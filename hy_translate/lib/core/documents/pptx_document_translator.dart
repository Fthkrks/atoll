import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';
import '../translation/rich_paragraph_translator.dart';
import '../translation/translation_service.dart';
import 'i_document_translator.dart';
import 'translate_options.dart';
import 'translation_progress.dart';

class PptxDocumentTranslator implements IDocumentTranslator {
  final TranslationService translationService;

  @override
  List<String> get extensions => const ['.pptx'];

  PptxDocumentTranslator(this.translationService);

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

    final targetFiles = <ArchiveFile>[];
    for (final file in archive.files) {
      if (!file.isFile) continue;
      final name = file.name.toLowerCase();
      if (name.startsWith('ppt/slides/slide') ||
          name.startsWith('ppt/notesslides/notesslide') ||
          name.startsWith('ppt/slidemasters/slidemaster') ||
          name.startsWith('ppt/slidelayouts/slidelayout')) {
        targetFiles.add(file);
      }
    }

    int totalParagraphs = 0;
    final parsedDocs = <String, XmlDocument>{};

    for (final file in targetFiles) {
      final xmlStr = utf8.decode(file.content as List<int>);
      final doc = XmlDocument.parse(xmlStr);
      parsedDocs[file.name] = doc;
      totalParagraphs += doc.findAllElements('a:p').length;
    }

    int doneParagraphs = 0;

    for (final file in targetFiles) {
      final doc = parsedDocs[file.name]!;
      final paragraphs = doc.findAllElements('a:p').toList();

      for (final p in paragraphs) {
        if (isCancelled?.call() == true) {
          throw const FormatException('Translation cancelled');
        }

        await _translateParagraph(p, options);

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

      final updatedXml = doc.toXmlString();
      final updatedBytes = utf8.encode(updatedXml);
      final newFile = ArchiveFile(file.name, updatedBytes.length, updatedBytes);
      archive.addFile(newFile);
    }

    final encoded = ZipEncoder().encode(archive);
    await File(outputPath).writeAsBytes(encoded);
  }

  Future<void> _translateParagraph(
    XmlElement p,
    TranslateOptions opt,
  ) async {
    final currentSegment = <XmlElement>[];
    final children = p.children.whereType<XmlElement>().toList();

    for (final child in children) {
      if (child.name.local == 'r' && _isTextRun(child)) {
        currentSegment.add(child);
      } else {
        if (currentSegment.isNotEmpty) {
          await _processSegment(currentSegment, p, opt);
          currentSegment.clear();
        }
      }
    }

    if (currentSegment.isNotEmpty) {
      await _processSegment(currentSegment, p, opt);
      currentSegment.clear();
    }
  }

  bool _isTextRun(XmlElement r) {
    // Ancestors check for field: check if parent or grandparent is a:fld
    var parent = r.parentElement;
    while (parent != null) {
      if (parent.name.local == 'fld') return false;
      parent = parent.parentElement;
    }
    if (r.findElements('a:t').isEmpty) return false;
    if (r.findElements('a:br').isNotEmpty) return false;
    return true;
  }

  String _getPptxFormatKey(XmlElement? rPr) {
    if (rPr == null) return '';
    return rPr
        .toXmlString()
        .replaceAll(RegExp(r'\s+(?:[a-zA-Z0-9_]+:)?(lang|dirty|err)="[^"]*"'), '')
        .trim();
  }

  Future<void> _processSegment(
    List<XmlElement> segmentRuns,
    XmlElement parent,
    TranslateOptions opt,
  ) async {
    if (segmentRuns.isEmpty) return;

    final runTexts = segmentRuns.map((r) {
      return r.findElements('a:t').map((t) => t.innerText).join();
    }).toList();

    if (runTexts.every((t) => t.trim().isEmpty)) return;

    final formatKeys = segmentRuns.map((r) {
      return _getPptxFormatKey(r.findElements('a:rPr').firstOrNull);
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
    final insertIndex = parent.children.indexOf(firstRun);
    if (insertIndex == -1) return;

    final newRuns = <XmlElement>[];
    for (final piece in result.pieces) {
      final templateRun = segmentRuns[piece.templateRunIndex];
      final cloned = templateRun.copy();
      _setRunText(cloned, piece.text);
      newRuns.add(cloned);
    }

    parent.children.insertAll(insertIndex, newRuns);
    for (final oldRun in segmentRuns) {
      parent.children.remove(oldRun);
    }
  }

  void _setRunText(XmlElement run, String text) {
    run.children.removeWhere((c) => c is XmlElement && c.name.local == 't');
    final tElement = XmlElement(XmlName.qualified('a:t'), [], [XmlText(text)]);
    run.children.add(tElement);
  }
}
