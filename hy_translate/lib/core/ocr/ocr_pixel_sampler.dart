import 'dart:math' as math;
import 'package:image/image.dart' as img;
import 'ocr_interfaces.dart';

class OcrPixelSampler implements IOcrPixelSampler {
  final img.Image image;
  final double scaleX;
  final double scaleY;

  OcrPixelSampler({
    required this.image,
    required double pageWidthPt,
    required double pageHeightPt,
  })  : scaleX = pageWidthPt > 0 ? image.width / pageWidthPt : 1.0,
        scaleY = pageHeightPt > 0 ? image.height / pageHeightPt : 1.0;

  @override
  ({int r, int g, int b}) backgroundColor(
    double left,
    double top,
    double width,
    double height,
  ) {
    final imgLeft = (left * scaleX).round();
    final imgTop = (top * scaleY).round();
    final imgRight = ((left + width) * scaleX).round();
    final imgBottom = ((top + height) * scaleY).round();

    const ringThickness = 3;
    final rValues = <int>[];
    final gValues = <int>[];
    final bValues = <int>[];

    void samplePixel(int x, int y) {
      if (x >= 0 && x < image.width && y >= 0 && y < image.height) {
        final pixel = image.getPixel(x, y);
        rValues.add(pixel.r.toInt());
        gValues.add(pixel.g.toInt());
        bValues.add(pixel.b.toInt());
      }
    }

    // Top and bottom borders of the 3-pixel ring
    for (int t = 1; t <= ringThickness; t++) {
      final yTop = imgTop - t;
      final yBottom = imgBottom + t;
      for (int x = imgLeft - ringThickness; x <= imgRight + ringThickness; x++) {
        samplePixel(x, yTop);
        samplePixel(x, yBottom);
      }
    }

    // Left and right borders of the 3-pixel ring
    for (int t = 1; t <= ringThickness; t++) {
      final xLeft = imgLeft - t;
      final xRight = imgRight + t;
      for (int y = imgTop; y <= imgBottom; y++) {
        samplePixel(xLeft, y);
        samplePixel(xRight, y);
      }
    }

    if (rValues.isEmpty) {
      return (r: 255, g: 255, b: 255);
    }

    rValues.sort();
    gValues.sort();
    bValues.sort();
    final mid = rValues.length ~/ 2;

    return (r: rValues[mid], g: gValues[mid], b: bValues[mid]);
  }

  @override
  ({int r, int g, int b}) textColor(
    double left,
    double top,
    double width,
    double height,
  ) {
    final imgLeft = (left * scaleX).round().clamp(0, image.width - 1);
    final imgTop = (top * scaleY).round().clamp(0, image.height - 1);
    final imgRight = ((left + width) * scaleX).round().clamp(0, image.width - 1);
    final imgBottom = ((top + height) * scaleY).round().clamp(0, image.height - 1);

    final pixels = <({int r, int g, int b, double lum})>[];

    for (int y = imgTop; y <= imgBottom; y++) {
      for (int x = imgLeft; x <= imgRight; x++) {
        final p = image.getPixel(x, y);
        final r = p.r.toInt();
        final g = p.g.toInt();
        final b = p.b.toInt();
        final lum = 0.299 * r + 0.587 * g + 0.114 * b;
        pixels.add((r: r, g: g, b: b, lum: lum));
      }
    }

    if (pixels.isEmpty) {
      return (r: 0, g: 0, b: 0);
    }

    // Darkest 10%
    pixels.sort((a, b) => a.lum.compareTo(b.lum));
    final count = math.max(1, (pixels.length * 0.10).round());
    final darkest = pixels.take(count).toList();

    int sumR = 0, sumG = 0, sumB = 0;
    for (final p in darkest) {
      sumR += p.r;
      sumG += p.g;
      sumB += p.b;
    }

    final textR = sumR ~/ count;
    final textG = sumG ~/ count;
    final textB = sumB ~/ count;
    final textLum = 0.299 * textR + 0.587 * textG + 0.114 * textB;

    final bg = backgroundColor(left, top, width, height);
    final bgLum = 0.299 * bg.r + 0.587 * bg.g + 0.114 * bg.b;

    // If contrast < 60, choose black or white with maximum contrast
    if ((textLum - bgLum).abs() < 60) {
      return bgLum > 128 ? (r: 0, g: 0, b: 0) : (r: 255, g: 255, b: 255);
    }

    return (r: textR, g: textG, b: textB);
  }
}
