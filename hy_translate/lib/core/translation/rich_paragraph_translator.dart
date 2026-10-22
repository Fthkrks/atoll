import 'dart:async';
import 'rich_result.dart';
import 'translation_service.dart';

class _TagSpan {
  final int tagNum;
  final int openStart;
  final int openEnd;
  final int closeStart;
  final int closeEnd;

  const _TagSpan({
    required this.tagNum,
    required this.openStart,
    required this.openEnd,
    required this.closeStart,
    required this.closeEnd,
  });
}

class RichParagraphTranslator {
  static final RegExp _anyTagRegex = RegExp(r'</?g(?:\d+)?>');
  static final RegExp _tagFormatRegex = RegExp(r'^</?g(\d+)>$');

  static const Set<String> _noSpaceLanguages = {
    'zh',
    'zh-hant',
    'yue',
    'ja',
    'th',
    'km',
    'my',
    'bo',
  };

  static Future<RichResult> translateRuns({
    required List<String> runTexts,
    List<String>? formatKeys,
    bool sameFormatting = false,
    required TranslationService service,
    required String targetLang,
    String? sourceLang,
  }) async {
    final safeRuns = runTexts;
    final keys = sameFormatting
        ? List.filled(safeRuns.length, 'same')
        : (formatKeys ?? List.generate(safeRuns.length, (i) => 'fmt_$i'));

    return _translateRunsInternal(
      safeRuns,
      keys,
      service,
      targetLang,
      sourceLang,
    );
  }

  static Future<RichResult> _translateRunsInternal(
    List<String> runTexts,
    List<String> formatKeys,
    TranslationService service,
    String targetLang,
    String? sourceLang,
  ) async {
    if (runTexts.isEmpty) {
      return const RichResult([], false);
    }

    final keys = (formatKeys.length != runTexts.length)
        ? List.filled(runTexts.length, '')
        : formatKeys;

    final allJoined = runTexts.join();
    if (TranslationService.shouldSkip(allJoined)) {
      final originalPieces = List.generate(
        runTexts.length,
        (i) => RichPiece(i, runTexts[i]),
      );
      return RichResult(originalPieces, false);
    }

    // 2. Base format = the format key with the most characters in total
    final charCountsByFormat = <String, int>{};
    for (int i = 0; i < runTexts.length; i++) {
      final key = keys[i];
      charCountsByFormat[key] = (charCountsByFormat[key] ?? 0) + runTexts[i].length;
    }

    String baseFormatKey = keys[0];
    int maxChars = -1;
    for (final key in keys.toSet()) {
      final count = charCountsByFormat[key] ?? 0;
      if (count > maxChars) {
        maxChars = count;
        baseFormatKey = key;
      }
    }

    // Find base template run (the base-format run with the longest text)
    int baseTemplateRunIndex = -1;
    int maxBaseRunLen = -1;
    for (int i = 0; i < runTexts.length; i++) {
      if (keys[i] == baseFormatKey) {
        if (runTexts[i].length > maxBaseRunLen) {
          maxBaseRunLen = runTexts[i].length;
          baseTemplateRunIndex = i;
        }
      }
    }
    if (baseTemplateRunIndex == -1) baseTemplateRunIndex = 0;

    // 3. Merge adjacent runs that share a format key
    final mergedPieces = <({String formatKey, String text, int firstRunIndex})>[];
    for (int i = 0; i < runTexts.length; i++) {
      final key = keys[i];
      final text = runTexts[i];

      if (mergedPieces.isNotEmpty && mergedPieces.last.formatKey == key) {
        final prev = mergedPieces.last;
        mergedPieces[mergedPieces.length - 1] = (
          formatKey: prev.formatKey,
          text: prev.text + text,
          firstRunIndex: prev.firstRunIndex,
        );
      } else {
        mergedPieces.add((formatKey: key, text: text, firstRunIndex: i));
      }
    }

    // 4. Leave base-format pieces UNTAGGED; wrap only the other pieces with <gN>
    final needsTags = mergedPieces.any((p) => p.formatKey != baseFormatKey);
    if (!needsTags) {
      final translated = await service.translateText(
        allJoined,
        targetLang,
        sourceLang: sourceLang,
      );
      return RichResult([RichPiece(baseTemplateRunIndex, translated)], false);
    }

    int tagCounter = 0;
    final taggedPieceTemplates = <int, int>{}; // tagNumber -> firstRunIndex
    final sb = StringBuffer();

    for (final piece in mergedPieces) {
      if (piece.formatKey == baseFormatKey) {
        sb.write(piece.text);
      } else {
        tagCounter++;
        taggedPieceTemplates[tagCounter] = piece.firstRunIndex;
        sb.write('<g$tagCounter>${piece.text}</g$tagCounter>');
      }
    }

    final totalTags = tagCounter;
    final taggedInput = sb.toString();

    String taggedOutput;
    try {
      taggedOutput = await service.translateRaw(
        taggedInput,
        targetLang,
        sourceLang: sourceLang,
      );
    } catch (e) {
      return await _fallback(
        allJoined,
        baseTemplateRunIndex,
        service,
        targetLang,
        sourceLang,
      );
    }

    // Validation: every tag appears exactly once, no nesting, not empty
    final validation = _validateAndExtractTags(taggedOutput, totalTags);
    if (!validation.isValid) {
      return await _fallback(
        allJoined,
        baseTemplateRunIndex,
        service,
        targetLang,
        sourceLang,
      );
    }

    // 5. Parse output into ordered list of pieces
    final rawPieces = <RichPiece>[];
    int currPos = 0;

    for (final span in validation.spans) {
      if (span.openStart > currPos) {
        final untaggedText = taggedOutput.substring(currPos, span.openStart);
        if (untaggedText.isNotEmpty) {
          rawPieces.add(RichPiece(baseTemplateRunIndex, untaggedText));
        }
      }

      final innerText = taggedOutput.substring(span.openEnd, span.closeStart);
      final templateIndex = taggedPieceTemplates[span.tagNum]!;
      rawPieces.add(RichPiece(templateIndex, innerText));

      currPos = span.closeEnd;
    }

    if (currPos < taggedOutput.length) {
      final trailingText = taggedOutput.substring(currPos);
      if (trailingText.isNotEmpty) {
        rawPieces.add(RichPiece(baseTemplateRunIndex, trailingText));
      }
    }

    // Spacing
    final usesSpaces = !_noSpaceLanguages.contains(targetLang.toLowerCase()) &&
        !targetLang.toLowerCase().startsWith('zh-');

    final finalPieces = _applySpacingAndMerge(
      rawPieces,
      baseTemplateRunIndex,
      usesSpaces,
    );

    bool reordered = false;
    for (int i = 0; i < validation.spans.length - 1; i++) {
      if (validation.spans[i].tagNum > validation.spans[i + 1].tagNum) {
        reordered = true;
        break;
      }
    }

    return RichResult(finalPieces, false, reordered: reordered);
  }

  static ({bool isValid, List<_TagSpan> spans}) _validateAndExtractTags(
    String output,
    int totalTags,
  ) {
    final spans = <_TagSpan>[];
    if (output.trim().isEmpty) {
      return (isValid: false, spans: spans);
    }

    final allTagMatches = _anyTagRegex.allMatches(output).toList();
    if (allTagMatches.length != totalTags * 2) {
      return (isValid: false, spans: spans);
    }

    final openedTagNums = <int>{};
    final closedTagNums = <int>{};
    int currentOpenTag = 0;
    int currentOpenStart = -1;
    int currentOpenEnd = -1;

    for (final m in allTagMatches) {
      final tagMatch = _tagFormatRegex.firstMatch(m.group(0)!);
      if (tagMatch == null) {
        return (isValid: false, spans: spans);
      }

      final tagNum = int.parse(tagMatch.group(1)!);
      if (tagNum < 1 || tagNum > totalTags) {
        return (isValid: false, spans: spans);
      }

      final isClose = m.group(0)!.startsWith('</');
      if (!isClose) {
        if (currentOpenTag != 0) {
          return (isValid: false, spans: spans);
        }
        if (!openedTagNums.add(tagNum)) {
          return (isValid: false, spans: spans);
        }
        currentOpenTag = tagNum;
        currentOpenStart = m.start;
        currentOpenEnd = m.end;
      } else {
        if (currentOpenTag != tagNum) {
          return (isValid: false, spans: spans);
        }
        if (!closedTagNums.add(tagNum)) {
          return (isValid: false, spans: spans);
        }

        spans.add(_TagSpan(
          tagNum: tagNum,
          openStart: currentOpenStart,
          openEnd: currentOpenEnd,
          closeStart: m.start,
          closeEnd: m.end,
        ));
        currentOpenTag = 0;
      }
    }

    if (currentOpenTag != 0 ||
        openedTagNums.length != totalTags ||
        closedTagNums.length != totalTags) {
      return (isValid: false, spans: spans);
    }

    final plain = output.replaceAll(_anyTagRegex, '');
    if (plain.trim().isEmpty) {
      return (isValid: false, spans: spans);
    }

    return (isValid: true, spans: spans);
  }

  static List<RichPiece> _applySpacingAndMerge(
    List<RichPiece> rawPieces,
    int baseTemplateRunIndex,
    bool usesSpaces,
  ) {
    final result = <RichPiece>[];

    for (int i = 0; i < rawPieces.length; i++) {
      var current = rawPieces[i];
      if (current.text.isEmpty) continue;

      if (result.isNotEmpty) {
        var prev = result.last;

        if (usesSpaces) {
          if (prev.text.endsWith(' ') && current.text.startsWith(' ')) {
            current = RichPiece(
              current.templateRunIndex,
              current.text.replaceFirst(RegExp(r'^ +'), ''),
            );
          } else if (_isLetterOrDigit(prev.text[prev.text.length - 1]) &&
              current.text.isNotEmpty &&
              _isLetterOrDigit(current.text[0])) {
            if (current.templateRunIndex == baseTemplateRunIndex) {
              current = RichPiece(
                current.templateRunIndex,
                ' ${current.text}',
              );
            } else {
              prev = RichPiece(
                prev.templateRunIndex,
                '${prev.text} ',
              );
              result[result.length - 1] = prev;
            }
          }
        }

        if (prev.templateRunIndex == current.templateRunIndex) {
          result[result.length - 1] = RichPiece(
            prev.templateRunIndex,
            prev.text + current.text,
          );
          continue;
        }
      }

      if (current.text.isNotEmpty) {
        result.add(current);
      }
    }

    return result;
  }

  static bool _isLetterOrDigit(String ch) {
    if (ch.isEmpty) return false;
    final r = ch.runes.first;
    final s = String.fromCharCode(r);
    return RegExp(r'[\p{L}\p{N}]', unicode: true).hasMatch(s);
  }

  static Future<RichResult> _fallback(
    String allJoined,
    int baseTemplateRunIndex,
    TranslationService service,
    String targetLang,
    String? sourceLang,
  ) async {
    final String translated;
    if (TranslationService.shouldSkip(allJoined)) {
      translated = allJoined;
    } else {
      translated = await service.translateText(
        allJoined,
        targetLang,
        sourceLang: sourceLang,
      );
    }

    return RichResult([RichPiece(baseTemplateRunIndex, translated)], true);
  }
}
