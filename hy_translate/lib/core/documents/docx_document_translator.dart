import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';
import '../languages/languages.dart';
import '../translation/rich_paragraph_translator.dart';
import '../translation/translation_service.dart';
import 'i_document_translator.dart';
import 'translate_options.dart';
import 'translation_progress.dart';

class DocxDocumentTranslator implements IDocumentTranslator {
  final TranslationService translationService;

  @override
  List<String> get extensions => const ['.docx'];

  DocxDocumentTranslator(this.translationService);

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

    final isRtl = Languages.isRtl(options.targetLang);

    // Collect all XML files to translate
    final targetFiles = <ArchiveFile>[];
    for (final file in archive.files) {
      if (!file.isFile) continue;
      final name = file.name.toLowerCase();
      if (name == 'word/document.xml' ||
          name.startsWith('word/header') ||
          name.startsWith('word/footer') ||
          name == 'word/footnotes.xml' ||
          name == 'word/endnotes.xml' ||
          name == 'word/comments.xml') {
        targetFiles.add(file);
      }
    }

    // Pass 1: count all paragraphs for progress
    int totalParagraphs = 0;
    final parsedDocs = <String, XmlDocument>{};

    for (final file in targetFiles) {
      final xmlStr = utf8.decode(file.content as List<int>);
      final doc = XmlDocument.parse(xmlStr);
      parsedDocs[file.name] = doc;
      totalParagraphs += doc.findAllElements('w:p').length;
    }

    int doneParagraphs = 0;

    for (final file in targetFiles) {
      final doc = parsedDocs[file.name]!;
      final paragraphs = doc.findAllElements('w:p').toList();

      for (final p in paragraphs) {
        if (isCancelled?.call() == true) {
          throw const FormatException('Translation cancelled');
        }

        if (isRtl) {
          _ensureParagraphRtl(p);
        }

        await _segmentAndTranslateContainer(p, options, isRtl);

        doneParagraphs++;
        onProgress?.call(
          TranslationProgress.of(
            ProgressKind.paragraph,
            doneParagraphs,
            totalParagraphs,
            'Paragraph $doneParagraphs/$totalParagraphs',
          ),
        );
      }

      // Re-encode updated XML into archive
      final updatedXml = doc.toXmlString();
      final updatedBytes = utf8.encode(updatedXml);
      final newFile = ArchiveFile(file.name, updatedBytes.length, updatedBytes);
      archive.addFile(newFile);
    }

    final encoded = ZipEncoder().encode(archive);
    await File(outputPath).writeAsBytes(encoded);
  }

  void _ensureParagraphRtl(XmlElement p) {
    var pPr = p.findElements('w:pPr').firstOrNull;
    if (pPr == null) {
      pPr = XmlElement(XmlName.qualified('w:pPr'));
      p.children.insert(0, pPr);
    }
    if (pPr.findElements('w:bidi').isEmpty) {
      pPr.children.add(XmlElement(XmlName.qualified('w:bidi')));
    }
  }

  Future<void> _segmentAndTranslateContainer(
    XmlElement container,
    TranslateOptions opt,
    bool isRtl,
  ) async {
    final currentSegment = <XmlElement>[];
    final children = container.children.whereType<XmlElement>().toList();

    for (final child in children) {
      if (child.name.local == 'pPr') continue;

      if (child.name.local == 'hyperlink') {
        if (currentSegment.isNotEmpty) {
          await _processSegment(currentSegment, opt, isRtl);
          currentSegment.clear();
        }
        await _segmentAndTranslateContainer(child, opt, isRtl);
        continue;
      }

      if (child.name.local == 'sdt') {
        final content = child.findElements('w:sdtContent').firstOrNull;
        if (content != null) {
          if (currentSegment.isNotEmpty) {
            await _processSegment(currentSegment, opt, isRtl);
            currentSegment.clear();
          }
          await _segmentAndTranslateContainer(content, opt, isRtl);
          continue;
        }
      }

      if (child.name.local == 'r' && _isTextRun(child)) {
        currentSegment.add(child);
      } else {
        // Boundary element
        if (currentSegment.isNotEmpty) {
          await _processSegment(currentSegment, opt, isRtl);
          currentSegment.clear();
        }
      }
    }

    if (currentSegment.isNotEmpty) {
      await _processSegment(currentSegment, opt, isRtl);
      currentSegment.clear();
    }
  }

  bool _isTextRun(XmlElement r) {
    final texts = r.findElements('w:t');
    if (texts.isEmpty) return false;
    if (r.findElements('w:fldChar').isNotEmpty) return false;
    if (r.findElements('w:instrText').isNotEmpty) return false;
    if (r.findElements('w:drawing').isNotEmpty) return false;
    if (r.findElements('w:tab').isNotEmpty) return false;
    if (r.findElements('w:br').isNotEmpty) return false;
    if (r.findElements('w:delText').isNotEmpty) return false;
    return true;
  }

  String _getDocxFormatKey(XmlElement? rPr) {
    if (rPr == null) return '';
    // Strip rsid attributes for formatting equality comparison
    return rPr
        .toXmlString()
        .replaceAll(RegExp(r'\s+(?:[a-zA-Z0-9_]+:)?rsid[a-zA-Z0-9_]*="[^"]*"'), '')
        .trim();
  }

  Future<void> _processSegment(
    List<XmlElement> segmentRuns,
    TranslateOptions opt,
    bool isRtl,
  ) async {
    if (segmentRuns.isEmpty) return;

    final runTexts = segmentRuns.map((r) {
      return r.findElements('w:t').map((t) => t.innerText).join();
    }).toList();

    if (runTexts.every((t) => t.trim().isEmpty)) return;

    final formatKeys = segmentRuns.map((r) {
      return _getDocxFormatKey(r.findElements('w:rPr').firstOrNull);
    }).toList();

    final result = await RichParagraphTranslator.translateRuns(
      runTexts: runTexts,
      formatKeys: formatKeys,
      service: translationService,
      targetLang: opt.targetLang,
      sourceLang: opt.sourceLang,
    );

    if (result.pieces.isEmpty) return;

    final firstRun = segmentRuns[0];
    final parent = firstRun.parentElement;
    if (parent == null) return;

    final insertIndex = parent.children.indexOf(firstRun);
    if (insertIndex == -1) return;

    final newRuns = <XmlElement>[];
    for (final piece in result.pieces) {
      final templateRun = segmentRuns[piece.templateRunIndex];
      final cloned = templateRun.copy();
      _setRunText(cloned, piece.text);

      if (isRtl) {
        var rPr = cloned.findElements('w:rPr').firstOrNull;
        if (rPr == null) {
          rPr = XmlElement(XmlName.qualified('w:rPr'));
          cloned.children.insert(0, rPr);
        }
        if (rPr.findElements('w:rtl').isEmpty) {
          rPr.children.add(XmlElement(XmlName.qualified('w:rtl')));
        }
      }

      newRuns.add(cloned);
    }

    // Insert new runs and remove old ones
    parent.children.insertAll(insertIndex, newRuns);
    for (final oldRun in segmentRuns) {
      parent.children.remove(oldRun);
    }
  }

  void _setRunText(XmlElement run, String text) {
    run.children.removeWhere((c) => c is XmlElement && c.name.local == 't');
    final tElement = XmlElement(
      XmlName.qualified('w:t'),
      [XmlAttribute(XmlName.qualified('xml:space'), 'preserve')],
      [XmlText(text)],
    );
    run.children.add(tElement);
  }
}
