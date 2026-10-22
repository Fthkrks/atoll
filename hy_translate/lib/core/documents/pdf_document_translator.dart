import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' show Rect;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../ocr/ocr_block_builder.dart';
import '../ocr/ocr_interfaces.dart';
import '../translation/translation_service.dart';
import 'i_document_translator.dart';
import 'translate_options.dart';
import 'translation_progress.dart';

class _ExtractedBlock {
  final String text;
  final double left;
  final double top;
  final double width;
  final double height;
  final double fontSize;
  final bool isBold;
  final int lineCount;

  const _ExtractedBlock({
    required this.text,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.isBold,
    required this.lineCount,
  });
}

class PdfDocumentTranslator implements IDocumentTranslator {
  final TranslationService translationService;
  final IPdfPageOcr? ocr;

  @override
  List<String> get extensions => const ['.pdf'];

  PdfDocumentTranslator(this.translationService, {this.ocr});

  @override
  Future<void> translate({
    required String inputPath,
    required String outputPath,
    required TranslateOptions options,
    void Function(TranslationProgress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    final inputBytes = await File(inputPath).readAsBytes();
    final document = PdfDocument(inputBytes: inputBytes);

    try {
      final totalPages = document.pages.count;
      final warnings = <String>[];

      for (int pageIdx = 0; pageIdx < totalPages; pageIdx++) {
        if (isCancelled?.call() == true) {
          throw const FormatException('Translation cancelled');
        }

        final page = document.pages[pageIdx];

        // 1. Extract text lines from this page
        final textLines = PdfTextExtractor(document).extractTextLines(
          startPageIndex: pageIdx,
          endPageIndex: pageIdx,
        );

        final wordBoxes = <WordBox>[];
        final textBlocks = <_ExtractedBlock>[];

        for (final line in textLines) {
          final bounds = line.bounds;
          if (line.text.trim().isEmpty) continue;

          wordBoxes.add(WordBox(
            left: bounds.left,
            top: bounds.top,
            width: bounds.width,
            height: bounds.height,
          ));

          // Estimate font size from height
          final fontSize = math.max(6.0, bounds.height * 0.85);

          textBlocks.add(_ExtractedBlock(
            text: line.text,
            left: bounds.left,
            top: bounds.top,
            width: bounds.width,
            height: bounds.height,
            fontSize: fontSize,
            isBold: false,
            lineCount: 1,
          ));
        }

        // 2. Check if OCR is needed
        final canOcr = options.useOcr && ocr != null && ocr!.isAvailable;
        // Text layer may coexist with raster images (slides); OcrBlockBuilder.filterLines
        // drops OCR lines that overlap the text layer by >30%, so always OCR when enabled.
        final needsOcr = true;

        var ocrBlocks = <OcrBlock>[];
        IOcrPixelSampler? sampler;

        if (needsOcr && canOcr) {
          onProgress?.call(
            TranslationProgress.of(
              ProgressKind.pageOcr,
              pageIdx + 1,
              totalPages,
              'Page ${pageIdx + 1}/$totalPages – reading image text',
            ),
          );

          try {
            final ocrResult = await ocr!.recognizePage(inputPath, pageIdx);
            if (ocrResult.lines.isNotEmpty) {
              sampler = ocrResult.sampler;
              final filteredLines = OcrBlockBuilder.filterLines(
                ocrResult.lines,
                wordBoxes,
              );
              ocrBlocks = OcrBlockBuilder.group(filteredLines);
            }
          } catch (e) {
            warnings.add('Page ${pageIdx + 1}: OCR error – $e');
          }
        } else if (textBlocks.isEmpty && !canOcr) {
          warnings.add('Page ${pageIdx + 1} contains only images; OCR is off or unavailable, skipped');
        }

        // 3. Draw overlays onto the page
        // A. Text layer blocks
        for (final block in textBlocks) {
          if (TranslationService.shouldSkip(block.text)) continue;

          final translatedText = await translationService.translateText(
            block.text,
            options.targetLang,
            sourceLang: options.sourceLang,
          );

          final x = math.max(0.0, block.left);
          final y = math.max(0.0, block.top);
          final w = math.max(10.0, block.width);
          final h = math.max(10.0, block.height);

          final padH = 0.10 * block.fontSize;
          final padUp = 0.15 * block.fontSize;
          final padDown = 0.30 * block.fontSize;

          final coverX = math.max(0.0, x - padH);
          final coverY = math.max(0.0, y - padUp);
          final coverW = w + (2 * padH);
          final coverH = h + padUp + padDown;

          // White box overlay
          page.graphics.drawRectangle(
            brush: PdfSolidBrush(PdfColor(255, 255, 255)),
            bounds: Rect.fromLTWH(coverX, coverY, coverW, coverH),
          );

          // Draw fitted text
          _drawFittedText(
            page: page,
            text: translatedText,
            x: x,
            y: y,
            width: w,
            height: h,
            initialFontSize: block.fontSize,
            isBold: block.isBold,
            expectedLines: block.lineCount,
            textColor: PdfColor(0, 0, 0),
          );
        }

        // B. OCR blocks
        for (final ocrBlock in ocrBlocks) {
          if (TranslationService.shouldSkip(ocrBlock.text)) continue;

          final translatedText = await translationService.translateText(
            ocrBlock.text,
            options.targetLang,
            sourceLang: options.sourceLang,
          );

          final x = math.max(0.0, ocrBlock.left);
          final y = math.max(0.0, ocrBlock.top);
          final w = math.max(10.0, ocrBlock.width);
          final h = math.max(10.0, ocrBlock.height);

          final pad = 0.15 * ocrBlock.fontSize;
          final coverX = math.max(0.0, x - pad);
          final coverY = math.max(0.0, y - pad);
          final coverW = w + (2 * pad);
          final coverH = h + (2 * pad);

          var coverColor = PdfColor(255, 255, 255);
          var textColor = PdfColor(0, 0, 0);

          if (sampler != null) {
            final bg = sampler.backgroundColor(ocrBlock.left, ocrBlock.top, ocrBlock.width, ocrBlock.height);
            final fg = sampler.textColor(ocrBlock.left, ocrBlock.top, ocrBlock.width, ocrBlock.height);
            coverColor = PdfColor(bg.r, bg.g, bg.b);
            textColor = PdfColor(fg.r, fg.g, fg.b);
          }

          page.graphics.drawRectangle(
            brush: PdfSolidBrush(coverColor),
            bounds: Rect.fromLTWH(coverX, coverY, coverW, coverH),
          );

          _drawFittedText(
            page: page,
            text: translatedText,
            x: x,
            y: y,
            width: w,
            height: h,
            initialFontSize: ocrBlock.fontSize,
            isBold: false,
            expectedLines: ocrBlock.lineCount,
            textColor: textColor,
            alignment: ocrBlock.alignment,
          );
        }

        onProgress?.call(
          TranslationProgress.of(
            ProgressKind.page,
            pageIdx + 1,
            totalPages,
            'Page ${pageIdx + 1}/$totalPages',
            warnings.isNotEmpty ? warnings.last : null,
          ),
        );
      }

      final outputBytes = await document.save();
      await File(outputPath).writeAsBytes(outputBytes);
    } finally {
      document.dispose();
    }
  }

  void _drawFittedText({
    required PdfPage page,
    required String text,
    required double x,
    required double y,
    required double width,
    required double height,
    required double initialFontSize,
    required bool isBold,
    required int expectedLines,
    required PdfColor textColor,
    TextAlign alignment = TextAlign.left,
  }) {
    double fontSize = math.max(5.0, initialFontSize);
    const double minFontSize = 5.0;

    final fontStyle = isBold ? PdfFontStyle.bold : PdfFontStyle.regular;
    final brush = PdfSolidBrush(textColor);
    final unicodeFont = _loadUnicodeFontBytes(isBold);

    final maxAvailableHeight = height + (0.45 * initialFontSize);

    while (fontSize >= minFontSize) {
      final PdfFont font = unicodeFont != null
          ? PdfTrueTypeFont(unicodeFont, fontSize, style: fontStyle)
          : PdfStandardFont(
              PdfFontFamily.helvetica,
              fontSize,
              style: fontStyle,
            );

      // The standard Helvetica font only covers WinAnsi; drop glyphs it cannot
      // draw (e.g. the Turkish dotless i) instead of failing the whole file.
      final drawable =
          unicodeFont != null ? text : _stripUnsupported(text, font);
      final lines = _wrapText(drawable, font, width);
      final lineHeight = font.height;
      final totalTextHeight = lines.length * lineHeight;

      final fitsHorizontally = lines.every((line) {
        return font.measureString(line).width <= width + (0.20 * fontSize);
      });

      final fitsVertically = (lines.length <= expectedLines) ||
          (totalTextHeight <= maxAvailableHeight);

      if ((fitsHorizontally && fitsVertically) || fontSize <= minFontSize) {
        double currentY = y;
        for (final line in lines) {
          final lineWidth = font.measureString(line).width;
          final lineX = (alignment == TextAlign.center)
              ? x + ((width - lineWidth) / 2.0)
              : x;

          page.graphics.drawString(
            line,
            font,
            brush: brush,
            bounds: Rect.fromLTWH(lineX, currentY, width, lineHeight),
          );
          currentY += lineHeight;
        }
        break;
      }

      fontSize -= 0.5;
    }
  }

  /// System fonts with wide Latin/Cyrillic/Greek coverage, tried in order.
  static const List<String> _systemFontCandidates = [
    '/system/fonts/Roboto-Regular.ttf',
    '/system/fonts/RobotoStatic-Regular.ttf',
    '/system/fonts/DroidSans.ttf',
    '/system/fonts/NotoSerif-Regular.ttf',
  ];
  static const List<String> _systemBoldFontCandidates = [
    '/system/fonts/DroidSans-Bold.ttf',
    '/system/fonts/NotoSerif-Bold.ttf',
  ];
  static final Map<bool, List<int>?> _fontBytesCache = {};

  /// Returns the bytes of a Unicode-capable TrueType font, or null if none
  /// of the candidates is readable (then Helvetica is used as a fallback).
  static List<int>? _loadUnicodeFontBytes(bool bold) {
    return _fontBytesCache.putIfAbsent(bold, () {
      final candidates = [
        if (bold) ..._systemBoldFontCandidates,
        ..._systemFontCandidates,
      ];
      for (final path in candidates) {
        try {
          final f = File(path);
          if (f.existsSync()) return f.readAsBytesSync();
        } catch (_) {}
      }
      return null;
    });
  }

  static String _stripUnsupported(String text, PdfFont font) {
    final sb = StringBuffer();
    for (final rune in text.runes) {
      final ch = String.fromCharCode(rune);
      try {
        font.measureString(ch);
        sb.write(ch);
      } catch (_) {
        // glyph not available in the standard font: skip it
      }
    }
    return sb.toString();
  }

  List<String> _wrapText(String text, PdfFont font, double maxWidth) {
    final lines = <String>[];
    final words = text.split(RegExp(r'\s+'));
    if (words.isEmpty) return lines;

    String currentLine = words[0];
    for (int i = 1; i < words.length; i++) {
      final testLine = '$currentLine ${words[i]}';
      final size = font.measureString(testLine);
      if (size.width <= maxWidth) {
        currentLine = testLine;
      } else {
        lines.add(currentLine);
        currentLine = words[i];
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines;
  }
}
