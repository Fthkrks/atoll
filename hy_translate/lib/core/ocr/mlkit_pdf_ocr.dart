import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart' as px;
import 'ocr_interfaces.dart';
import 'ocr_pixel_sampler.dart';

class MlKitPdfOcr implements IPdfPageOcr {
  final TextRecognizer _recognizer;
  bool _disposed = false;

  MlKitPdfOcr([TextRecognitionScript script = TextRecognitionScript.latin])
      : _recognizer = TextRecognizer(script: script);

  @override
  bool get isAvailable => !_disposed;

  @override
  String? get languageTag => 'auto';

  @override
  Future<OcrPageResult> recognizePage(
    String pdfPath,
    int pageIndex,
  ) async {
    if (_disposed) {
      return const OcrPageResult(lines: []);
    }

    // 1. Open PDF with pdfx and render page to image
    final pxDoc = await px.PdfDocument.openFile(pdfPath);
    try {
      final pageNum = pageIndex + 1; // pdfx is 1-based
      if (pageNum < 1 || pageNum > pxDoc.pagesCount) {
        return const OcrPageResult(lines: []);
      }

      final page = await pxDoc.getPage(pageNum);
      // Scale ~2.78x for ~200 DPI
      const scale = 2.78;
      final targetWidth = (page.width * scale).toDouble();
      final targetHeight = (page.height * scale).toDouble();

      final pageImage = await page.render(
        width: targetWidth,
        height: targetHeight,
        format: px.PdfPageImageFormat.png,
      );
      await page.close();

      if (pageImage == null || pageImage.bytes.isEmpty) {
        return const OcrPageResult(lines: []);
      }

      // 2. Save to temporary file for ML Kit
      final tempDir = await getTemporaryDirectory();
      final tempFile = File(
        '${tempDir.path}/ocr_page_${DateTime.now().microsecondsSinceEpoch}.png',
      );
      await tempFile.writeAsBytes(pageImage.bytes);

      try {
        final inputImage = InputImage.fromFilePath(tempFile.path);
        final recognizedText = await _recognizer.processImage(inputImage);

        // Decode image for pixel sampling
        final decodedImage = img.decodePng(pageImage.bytes);
        IOcrPixelSampler? sampler;
        if (decodedImage != null) {
          sampler = OcrPixelSampler(
            image: decodedImage,
            pageWidthPt: page.width.toDouble(),
            pageHeightPt: page.height.toDouble(),
          );
        }

        final scaleX = targetWidth / page.width;
        final scaleY = targetHeight / page.height;

        final lines = <OcrTextLine>[];
        for (final block in recognizedText.blocks) {
          for (final line in block.lines) {
            final rect = line.boundingBox;
            final ptLeft = rect.left / scaleX;
            final ptTop = rect.top / scaleY;
            final ptWidth = rect.width / scaleX;
            final ptHeight = rect.height / scaleY;

            lines.add(
              OcrTextLine(
                text: line.text,
                left: ptLeft,
                top: ptTop,
                width: ptWidth,
                height: ptHeight,
              ),
            );
          }
        }

        return OcrPageResult(lines: lines, sampler: sampler);
      } finally {
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
      }
    } finally {
      await pxDoc.close();
    }
  }

  void dispose() {
    _disposed = true;
    _recognizer.close();
  }
}
