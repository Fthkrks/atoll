import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/ocr/ocr_block_builder.dart';
import 'package:hy_translate/core/ocr/ocr_interfaces.dart';

void main() {
  group('OcrBlockBuilder Tests', () {
    test('filterLines eliminates noise and keeps legitimate text', () {
      final lines = [
        const OcrTextLine(text: '', left: 0, top: 0, width: 10, height: 10),
        const OcrTextLine(text: '   ', left: 0, top: 0, width: 10, height: 10),
        const OcrTextLine(text: '.', left: 0, top: 0, width: 5, height: 5),
        const OcrTextLine(text: 'Hello world', left: 10, top: 10, width: 100, height: 20),
        const OcrTextLine(text: 'Valid line number 2', left: 10, top: 35, width: 120, height: 20),
      ];

      final filtered = OcrBlockBuilder.filterLines(lines);
      expect(filtered.length, equals(2));
      expect(filtered[0].text, equals('Hello world'));
      expect(filtered[1].text, equals('Valid line number 2'));
    });

    test('group clusters nearby lines into blocks', () {
      final lines = [
        // Paragraph 1
        const OcrTextLine(text: 'Line 1 of paragraph 1', left: 20, top: 20, width: 150, height: 15),
        const OcrTextLine(text: 'Line 2 of paragraph 1', left: 20, top: 38, width: 150, height: 15),
        // Paragraph 2 (far down)
        const OcrTextLine(text: 'Line 1 of paragraph 2', left: 20, top: 150, width: 150, height: 15),
      ];

      final blocks = OcrBlockBuilder.group(lines);
      expect(blocks.length, equals(2));
      expect(blocks[0].lineCount, equals(2));
      expect(blocks[1].lineCount, equals(1));
    });

    test('joinLines handles hyphenation correctly at line breaks', () {
      final hyphenatedLines = [
        const OcrTextLine(text: 'This is an impor-', left: 10, top: 10, width: 100, height: 15),
        const OcrTextLine(text: 'tant message.', left: 10, top: 30, width: 100, height: 15),
      ];

      final joined = OcrBlockBuilder.joinLines(hyphenatedLines);
      expect(joined, equals('This is an important message.'));

      final regularLines = [
        const OcrTextLine(text: 'First complete line', left: 10, top: 10, width: 100, height: 15),
        const OcrTextLine(text: 'Second line text', left: 10, top: 30, width: 100, height: 15),
      ];

      final joinedRegular = OcrBlockBuilder.joinLines(regularLines);
      expect(joinedRegular, equals('First complete line Second line text'));
    });

    test('estimateFontSize calculates reasonable average font size', () {
      final lines = [
        const OcrTextLine(text: 'Sample line 1', left: 10, top: 10, width: 100, height: 20),
        const OcrTextLine(text: 'Sample line 2', left: 10, top: 35, width: 100, height: 20),
      ];

      final size = OcrBlockBuilder.estimateFontSize(lines);
      expect(size, inInclusiveRange(8.0, 25.0));
    });
  });
}
