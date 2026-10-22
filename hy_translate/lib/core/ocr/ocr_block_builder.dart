import 'dart:math' as math;
import 'ocr_interfaces.dart';

class WordBox {
  final double left;
  final double top;
  final double width;
  final double height;

  const WordBox({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  @override
  String toString() => 'WordBox(L:$left, T:$top, W:$width, H:$height)';
}

class OcrBlockBuilder {
  static bool hasValidText(String text) {
    if (text.trim().isEmpty) return false;

    int letterCount = 0;
    int nonSpaceCount = 0;

    for (final rune in text.runes) {
      final s = String.fromCharCode(rune);
      if (s.trim().isNotEmpty) {
        nonSpaceCount++;
        if (RegExp(r'\p{L}', unicode: true).hasMatch(s)) {
          letterCount++;
        }
      }
    }

    if (letterCount < 3) return false;
    if (nonSpaceCount == 0) return false;

    return (letterCount / nonSpaceCount) >= 0.50;
  }

  static bool overlapsAnyWord(
    OcrTextLine line,
    Iterable<WordBox>? textLayerWords,
  ) {
    if (textLayerWords == null) return false;

    final lineArea = line.width * line.height;
    if (lineArea <= 0) return false;

    for (final word in textLayerWords) {
      final wordArea = word.width * word.height;
      if (wordArea <= 0) continue;

      final x1 = math.max(line.left, word.left);
      final y1 = math.max(line.top, word.top);
      final x2 = math.min(line.left + line.width, word.left + word.width);
      final y2 = math.min(line.top + line.height, word.top + word.height);

      if (x2 > x1 && y2 > y1) {
        final intersectArea = (x2 - x1) * (y2 - y1);
        if ((intersectArea / lineArea > 0.30) || (intersectArea / wordArea > 0.30)) {
          return true;
        }
      }
    }

    return false;
  }

  static List<OcrTextLine> filterLines(
    Iterable<OcrTextLine> lines, [
    Iterable<WordBox>? textLayerWords,
  ]) {
    final wordList = textLayerWords?.toList();
    final result = <OcrTextLine>[];

    for (final line in lines) {
      if (!hasValidText(line.text)) {
        continue;
      }

      if (overlapsAnyWord(line, wordList)) {
        continue;
      }

      result.add(line);
    }

    return result;
  }

  static List<OcrBlock> group(List<OcrTextLine> lines) {
    if (lines.isEmpty) return const [];

    final sorted = List<OcrTextLine>.from(lines)..sort((a, b) => a.top.compareTo(b.top));
    final groups = <List<OcrTextLine>>[];

    for (final line in sorted) {
      if (groups.isEmpty) {
        groups.add([line]);
        continue;
      }

      final currentGroup = groups.last;
      final prev = currentGroup.last;

      final medianHeight = getMedian(currentGroup.map((l) => l.height));
      final verticalGap = line.top - (prev.top + prev.height);

      final gapOk = verticalGap < 0.8 * medianHeight;
      final heightOk = prev.height > 0 &&
          (line.height - prev.height).abs() <= 0.35 * prev.height;

      final hOverlap = math.min(line.left + line.width, prev.left + prev.width) -
          math.max(line.left, prev.left);
      final leftDiff = (line.left - prev.left).abs();
      final lineCenter = line.left + line.width / 2.0;
      final prevCenter = prev.left + prev.width / 2.0;
      final centerDiff = (lineCenter - prevCenter).abs();

      final horizontalOk = (hOverlap > 0) ||
          (leftDiff <= 1.5 * prev.height) ||
          (centerDiff <= 1.5 * prev.height);

      if (gapOk && heightOk && horizontalOk) {
        currentGroup.add(line);
      } else {
        groups.add([line]);
      }
    }

    final result = <OcrBlock>[];
    for (final grp in groups) {
      final text = joinLines(grp);
      final left = grp.map((l) => l.left).reduce(math.min);
      final top = grp.map((l) => l.top).reduce(math.min);
      final right = grp.map((l) => l.left + l.width).reduce(math.max);
      final bottom = grp.map((l) => l.top + l.height).reduce(math.max);
      final width = math.max(0.0, right - left);
      final height = math.max(0.0, bottom - top);

      final fontSize = estimateFontSize(grp);
      final alignment = detectAlignment(grp);

      result.add(OcrBlock(
        text: text,
        left: left,
        top: top,
        width: width,
        height: height,
        fontSize: fontSize,
        lineCount: grp.length,
        alignment: alignment,
      ));
    }

    return result;
  }

  static double estimateFontSize(List<OcrTextLine> lines) {
    if (lines.isEmpty) return 10.0;

    if (lines.length >= 2) {
      final sorted = List<OcrTextLine>.from(lines)..sort((a, b) => a.top.compareTo(b.top));
      final pitches = <double>[];
      for (int i = 0; i < sorted.length - 1; i++) {
        pitches.add(sorted[i + 1].top - sorted[i].top);
      }
      final linePitch = getMedian(pitches);
      if (linePitch > 0) {
        return (linePitch / 1.2).clamp(6.0, 72.0);
      }
    }

    final lineHeight = getMedian(lines.map((l) => l.height));
    return (lineHeight * 0.85).clamp(6.0, 72.0);
  }

  static TextAlign detectAlignment(List<OcrTextLine> lines) {
    if (lines.length < 2) {
      return TextAlign.left;
    }

    final lefts = lines.map((l) => l.left).toList();
    final centers = lines.map((l) => l.left + (l.width / 2.0)).toList();
    final medianLineHeight = getMedian(lines.map((l) => l.height));

    final leftSpread = lefts.reduce(math.max) - lefts.reduce(math.min);
    if (leftSpread <= 1.0 * medianLineHeight) {
      return TextAlign.left;
    }

    final sdLeft = standardDeviation(lefts);
    final sdCenter = standardDeviation(centers);

    if (sdCenter < 0.5 * sdLeft) {
      return TextAlign.center;
    }

    return TextAlign.left;
  }

  static double standardDeviation(List<double> values) {
    if (values.length < 2) return 0.0;
    final mean = values.reduce((a, b) => a + b) / values.length;
    final sumSquares = values.fold<double>(
      0.0,
      (prev, v) => prev + (v - mean) * (v - mean),
    );
    return math.sqrt(sumSquares / values.length);
  }

  static String joinLines(List<OcrTextLine> lines) {
    if (lines.isEmpty) return '';
    final sb = StringBuffer();
    sb.write(lines[0].text);

    for (int i = 1; i < lines.length; i++) {
      final next = lines[i].text;
      final current = sb.toString();

      if (current.endsWith('-') &&
          next.isNotEmpty &&
          _isLowercaseLetter(next[0])) {
        // Hyphen joining: remove '-' and concatenate directly
        final withoutHyphen = current.substring(0, current.length - 1);
        sb.clear();
        sb.write(withoutHyphen);
        sb.write(next);
      } else {
        sb.write(' ');
        sb.write(next);
      }
    }

    return sb.toString();
  }

  static bool _isLowercaseLetter(String ch) {
    if (ch.isEmpty) return false;
    final r = ch.runes.first;
    final s = String.fromCharCode(r);
    return s.toLowerCase() == s && RegExp(r'\p{Ll}', unicode: true).hasMatch(s);
  }

  static double getMedian(Iterable<double> values) {
    final list = values.toList()..sort();
    if (list.isEmpty) return 10.0;
    final mid = list.length ~/ 2;
    if (list.length % 2 == 1) return list[mid];
    return (list[mid - 1] + list[mid]) / 2.0;
  }
}
