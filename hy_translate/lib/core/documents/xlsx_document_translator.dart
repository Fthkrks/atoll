import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';
import '../translation/rich_paragraph_translator.dart';
import '../translation/translation_service.dart';
import 'i_document_translator.dart';
import 'translate_options.dart';
import 'translation_progress.dart';

class XlsxDocumentTranslator implements IDocumentTranslator {
  final TranslationService translationService;

  @override
  List<String> get extensions => const ['.xlsx'];

  XlsxDocumentTranslator(this.translationService);

  @override
  Future<void> translate({
    required String inputPath,
    required String outputPath,
    required TranslateOptions options,
    void Function(TranslationProgress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    final bytes = await File(inputPath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    // 1. Shared Strings Table (xl/sharedStrings.xml)
    final sstFile = archive.files.firstWhere(
      (f) => f.name.toLowerCase() == 'xl/sharedstrings.xml',
      orElse: () => ArchiveFile('', 0, []),
    );

    if (sstFile.name.isNotEmpty) {
      final xmlStr = utf8.decode(sstFile.content as List<int>);
      final doc = XmlDocument.parse(xmlStr);
      final siElements = doc.findAllElements('si').toList();
      final total = siElements.length;
      int done = 0;

      for (final si in siElements) {
        if (isCancelled?.call() == true) {
          throw const FormatException('Translation cancelled');
        }

        await _translateSharedStringItem(si, options);
        done++;
        onProgress?.call(
          TranslationProgress.of(
            ProgressKind.sharedText,
            done,
            total,
            'Shared text $done/$total',
          ),
        );
      }

      final updatedXml = doc.toXmlString();
      final updatedBytes = utf8.encode(updatedXml);
      archive.addFile(ArchiveFile(sstFile.name, updatedBytes.length, updatedBytes));
    }

    // 2. Inline strings in worksheets (xl/worksheets/sheet*.xml)
    for (final file in archive.files.toList()) {
      if (!file.isFile) continue;
      final name = file.name.toLowerCase();
      if (name.startsWith('xl/worksheets/sheet') && name.endsWith('.xml')) {
        final xmlStr = utf8.decode(file.content as List<int>);
        final doc = XmlDocument.parse(xmlStr);
        final cells = doc.findAllElements('c').where((c) {
          final t = c.getAttribute('t');
          final hasFormula = c.findElements('f').isNotEmpty;
          return t == 'inlineStr' && !hasFormula;
        }).toList();

        for (final cell in cells) {
          if (isCancelled?.call() == true) {
            throw const FormatException('Translation cancelled');
          }

          final isElem = cell.findElements('is').firstOrNull;
          if (isElem != null) {
            await _translateSharedStringItem(isElem, options);
          }
        }

        final updatedXml = doc.toXmlString();
        final updatedBytes = utf8.encode(updatedXml);
        archive.addFile(ArchiveFile(file.name, updatedBytes.length, updatedBytes));
      }
    }

    // 3. Optional sheet names (xl/workbook.xml)
    if (options.translateSheetNames) {
      final wbFile = archive.files.firstWhere(
        (f) => f.name.toLowerCase() == 'xl/workbook.xml',
        orElse: () => ArchiveFile('', 0, []),
      );

      if (wbFile.name.isNotEmpty) {
        final xmlStr = utf8.decode(wbFile.content as List<int>);
        final doc = XmlDocument.parse(xmlStr);
        final sheets = doc.findAllElements('sheet').toList();

        for (final sheet in sheets) {
          final originalName = sheet.getAttribute('name');
          if (originalName != null && originalName.trim().isNotEmpty) {
            final translated = await translationService.translateText(
              originalName,
              options.targetLang,
              sourceLang: options.sourceLang,
            );

            // Clean invalid chars :\/?*[] and limit to 31 chars
            var clean = translated.replaceAll(RegExp(r'[:\\/?*\[\]]'), '');
            if (clean.length > 31) clean = clean.substring(0, 31);
            if (clean.trim().isNotEmpty) {
              sheet.setAttribute('name', clean.trim());
            }
          }
        }

        final updatedXml = doc.toXmlString();
        final updatedBytes = utf8.encode(updatedXml);
        archive.addFile(ArchiveFile(wbFile.name, updatedBytes.length, updatedBytes));
      }
    }

    final encoded = ZipEncoder().encode(archive);
    await File(outputPath).writeAsBytes(encoded);
  }

  Future<void> _translateSharedStringItem(
    XmlElement item,
    TranslateOptions opt,
  ) async {
    // Simple text: <t>...</t> directly under item
    final directT = item.children.whereType<XmlElement>().where((e) => e.name.local == 't').firstOrNull;
    if (directT != null && directT.innerText.trim().isNotEmpty) {
      final translated = await translationService.translateText(
        directT.innerText,
        opt.targetLang,
        sourceLang: opt.sourceLang,
      );
      directT.children.clear();
      directT.children.add(XmlText(translated));
      directT.setAttribute('xml:space', 'preserve');
      return;
    }

    // Rich text runs: <r>...</r>
    final runs = item.children.whereType<XmlElement>().where((e) => e.name.local == 'r').toList();
    if (runs.isNotEmpty) {
      await _translateSpreadsheetRuns(item, runs, opt);
    }
  }

  Future<void> _translateSpreadsheetRuns(
    XmlElement parent,
    List<XmlElement> runs,
    TranslateOptions opt,
  ) async {
    final runTexts = runs.map((r) {
      final t = r.findElements('t').firstOrNull;
      return t?.innerText ?? '';
    }).toList();

    if (runTexts.every((t) => t.trim().isEmpty)) return;

    final formatKeys = runs.map((r) {
      final rPr = r.findElements('rPr').firstOrNull;
      return rPr?.toXmlString() ?? '';
    }).toList();

    final result = await RichParagraphTranslator.translateRuns(
      runTexts: runTexts,
      formatKeys: formatKeys,
      service: translationService,
      targetLang: opt.targetLang,
      sourceLang: opt.sourceLang,
    );

    if (result.pieces.isEmpty) return;

    final firstRun = runs[0];
    final insertIndex = parent.children.indexOf(firstRun);
    if (insertIndex == -1) return;

    final newRuns = <XmlElement>[];
    for (final piece in result.pieces) {
      final templateRun = runs[piece.templateRunIndex];
      final cloned = templateRun.copy();
      var tElem = cloned.findElements('t').firstOrNull;
      if (tElem == null) {
        tElem = XmlElement(XmlName.qualified('t'), [XmlAttribute(XmlName.qualified('xml:space'), 'preserve')], [XmlText(piece.text)]);
        cloned.children.add(tElem);
      } else {
        tElem.children.clear();
        tElem.children.add(XmlText(piece.text));
        tElem.setAttribute('xml:space', 'preserve');
      }
      newRuns.add(cloned);
    }

    parent.children.insertAll(insertIndex, newRuns);
    for (final oldRun in runs) {
      parent.children.remove(oldRun);
    }
  }
}
