import 'dart:convert';
import 'dart:io';
import '../translation/translation_service.dart';
import 'i_document_translator.dart';
import 'translate_options.dart';
import 'translation_progress.dart';

class MdDocumentTranslator implements IDocumentTranslator {
  final TranslationService translationService;

  @override
  List<String> get extensions => const ['.md', '.markdown'];

  MdDocumentTranslator(this.translationService);

  @override
  Future<void> translate({
    required String inputPath,
    required String outputPath,
    required TranslateOptions options,
    void Function(TranslationProgress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    final bytes = await File(inputPath).readAsBytes();
    final content = utf8.decode(bytes, allowMalformed: true);
    final lineEnding = content.contains('\r\n') ? '\r\n' : '\n';
    final lines = content.split(RegExp(r'\r\n|\r|\n'));
    final outputLines = <String>[];

    bool inFrontMatter = false;
    bool inCodeBlock = false;
    String codeFence = '';

    final total = lines.length;
    int done = 0;

    for (int i = 0; i < lines.length; i++) {
      if (isCancelled?.call() == true) {
        throw const FormatException('Translation cancelled');
      }

      final line = lines[i];

      // 1. Front matter (--- or +++) at start of file
      if (i == 0 && (line.trim() == '---' || line.trim() == '+++')) {
        inFrontMatter = true;
        outputLines.add(line);
        done++;
        continue;
      }

      if (inFrontMatter) {
        outputLines.add(line);
        if (line.trim() == '---' || line.trim() == '+++') {
          inFrontMatter = false;
        }
        done++;
        continue;
      }

      // 2. Fenced code blocks (``` or ~~~)
      final trimmedStart = line.trimLeft();
      if (!inCodeBlock &&
          (trimmedStart.startsWith('```') || trimmedStart.startsWith('~~~'))) {
        inCodeBlock = true;
        codeFence = trimmedStart.substring(0, 3);
        outputLines.add(line);
        done++;
        continue;
      }

      if (inCodeBlock) {
        outputLines.add(line);
        if (trimmedStart.startsWith(codeFence)) {
          inCodeBlock = false;
          codeFence = '';
        }
        done++;
        continue;
      }

      // 3. Blank or whitespace lines
      if (line.trim().isEmpty) {
        outputLines.add(line);
        done++;
        continue;
      }

      // 4. Table separator lines (| --- | :---: |)
      if (_isTableSeparator(line)) {
        outputLines.add(line);
        done++;
        continue;
      }

      // 5. Line with prefix (headings, lists, blockquotes) or table row
      final translatedLine = await _translateMarkdownLine(line, options);
      outputLines.add(translatedLine);
      done++;
      onProgress?.call(TranslationProgress(done, total, 'Line $done/$total'));
    }

    final result = outputLines.join(lineEnding);
    await File(outputPath).writeAsString(result);
  }

  static bool _isTableSeparator(String line) {
    final trimmed = line.trim();
    if (!trimmed.contains('-')) return false;
    return RegExp(r'^\|?\s*:?-+:?\s*(\|(\s*:?-+:?\s*))+\|?$').hasMatch(trimmed);
  }

  Future<String> _translateMarkdownLine(
    String line,
    TranslateOptions opt,
  ) async {
    // Check for table rows (| col1 | col2 |)
    if (line.trimLeft().startsWith('|') && line.trimRight().endsWith('|')) {
      return await _translateTableRow(line, opt);
    }

    // Check for Markdown prefixes: Headings (# ), Blockquotes (> ), Lists (- , * , 1. )
    final prefixMatch = RegExp(r'^(\s*(?:#{1,6}\s+|(?:>\s*)+|(?:[-*+]|\d+\.)\s+))').firstMatch(line);
    String prefix = '';
    String content = line;

    if (prefixMatch != null) {
      prefix = prefixMatch.group(1)!;
      content = line.substring(prefix.length);
    }

    if (content.trim().isEmpty) {
      return line;
    }

    final translatedContent = await _translateInlineProtectedText(content, opt);
    return prefix + translatedContent;
  }

  Future<String> _translateTableRow(
    String line,
    TranslateOptions opt,
  ) async {
    final cells = line.split('|');
    for (int i = 1; i < cells.length - 1; i++) {
      final cell = cells[i];
      if (cell.trim().isNotEmpty) {
        final trimmedLeft = cell.trimLeft();
        final leadingLen = cell.length - trimmedLeft.length;
        final trimmedRight = cell.trimRight();
        final trailingLen = cell.length - trimmedRight.length;

        final leading = cell.substring(0, leadingLen);
        final trailing = cell.substring(cell.length - trailingLen);
        final core = cell.trim();

        final translated = await _translateInlineProtectedText(core, opt);
        cells[i] = leading + translated + trailing;
      }
    }
    return cells.join('|');
  }

  Future<String> _translateInlineProtectedText(
    String text,
    TranslateOptions opt,
  ) async {
    final placeholders = <String>[];

    // 1. Protect inline code `...`
    var masked = text.replaceAllMapped(RegExp(r'`[^`\r\n]+`'), (m) {
      final index = placeholders.length;
      placeholders.add(m.group(0)!);
      return '⟦$index⟧';
    });

    // 2. Protect Images ![(alt)](url)
    masked = masked.replaceAllMapped(RegExp(r'!\[(.*?)\]\((.*?)\)'), (m) {
      final index = placeholders.length;
      placeholders.add(m.group(0)!);
      return '⟦$index⟧';
    });

    // 3. Protect HTML tags <...>
    masked = masked.replaceAllMapped(RegExp(r'<[^>\r\n]+>'), (m) {
      final index = placeholders.length;
      placeholders.add(m.group(0)!);
      return '⟦$index⟧';
    });

    // 4. Protect Link URLs: [text](url) -> [text]⟦index⟧ where placeholders[index] is "(url)"
    masked = masked.replaceAllMapped(RegExp(r'\[(.*?)\]\((.*?)\)'), (m) {
      final index = placeholders.length;
      placeholders.add('(${m.group(2)!})');
      return '[${m.group(1)!}]⟦$index⟧';
    });

    // Translate the masked text
    var translated = await translationService.translateText(
      masked,
      opt.targetLang,
      sourceLang: opt.sourceLang,
    );

    // Restore placeholders
    for (int i = 0; i < placeholders.length; i++) {
      final tokenPattern = RegExp('⟦\\s*$i\\s*⟧');
      final tokenFound = tokenPattern.hasMatch(translated);

      if (tokenFound) {
        if (placeholders[i].startsWith('(') && placeholders[i].endsWith(')')) {
          // If the model wrapped the token in parentheses, avoid double parens
          translated = translated.replaceAll(
            RegExp('\\(\\s*⟦\\s*$i\\s*⟧\\s*\\)'),
            placeholders[i],
          );
          // If preceded by ']', join cleanly e.g. [text]⟦0⟧ -> [text](url)
          translated = translated.replaceAll(
            RegExp('\\]\\s*⟦\\s*$i\\s*⟧'),
            ']${placeholders[i]}',
          );
        }

        // Standard token replacement
        translated = translated.replaceAll(tokenPattern, placeholders[i]);
      } else {
        // Token was dropped by model: append original placeholder to the end
        translated = translated.trim().isEmpty
            ? placeholders[i]
            : '${translated.trimRight()} ${placeholders[i]}';
      }
    }

    return translated;
  }
}
