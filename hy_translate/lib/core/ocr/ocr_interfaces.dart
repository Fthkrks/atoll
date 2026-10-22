enum TextAlign {
  left,
  center,
}

class OcrTextLine {
  final String text;
  final double left;
  final double top;
  final double width;
  final double height;

  const OcrTextLine({
    required this.text,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  @override
  String toString() => 'OcrTextLine("$text", L:$left, T:$top, W:$width, H:$height)';
}

class OcrBlock {
  final String text;
  final double left;
  final double top;
  final double width;
  final double height;
  final double fontSize;
  final int lineCount;
  final TextAlign alignment;

  const OcrBlock({
    required this.text,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.lineCount,
    this.alignment = TextAlign.left,
  });

  @override
  String toString() => 'OcrBlock("$text", L:$left, T:$top, W:$width, H:$height, fs:$fontSize)';
}

abstract class IOcrPixelSampler {
  ({int r, int g, int b}) backgroundColor(
    double left,
    double top,
    double width,
    double height,
  );

  ({int r, int g, int b}) textColor(
    double left,
    double top,
    double width,
    double height,
  );
}

class OcrPageResult {
  final List<OcrTextLine> lines;
  final IOcrPixelSampler? sampler;

  const OcrPageResult({
    required this.lines,
    this.sampler,
  });
}

abstract class IPdfPageOcr {
  bool get isAvailable;
  String? get languageTag;
  Future<OcrPageResult> recognizePage(
    String pdfPath,
    int pageIndex,
  );
}
