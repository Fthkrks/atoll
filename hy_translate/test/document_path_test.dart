import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/documents/document_translator_factory.dart';
import 'package:path/path.dart' as p;

void main() {
  group('Document Path Tests', () {
    test('getDefaultOutputPath constructs target filename correctly', () {
      final out1 = DocumentTranslatorFactory.getDefaultOutputPath('/docs/report.docx', 'tr');
      expect(p.basename(out1), equals('report.tr.docx'));

      final out2 = DocumentTranslatorFactory.getDefaultOutputPath('presentation.pptx', 'EN');
      expect(out2, equals('presentation.en.pptx'));

      final out3 = DocumentTranslatorFactory.getDefaultOutputPath('C:\\data\\sheet.xlsx', 'zh');
      expect(p.basename(out3), equals('sheet.zh.xlsx'));
    });

    test('makeUniquePath appends counter if file exists', () {
      final tempDir = Directory.systemTemp.createTempSync('hy_translate_test_');
      try {
        final existingFile = File(p.join(tempDir.path, 'sample.tr.txt'));
        existingFile.writeAsStringSync('dummy content');

        // Target path exists, so it should make it sample.tr (2).txt
        final uniquePath = DocumentTranslatorFactory.makeUniquePath(existingFile.path);
        expect(p.basename(uniquePath), equals('sample.tr (2).txt'));

        // If that exists too, it should increment to (3)
        File(uniquePath).writeAsStringSync('dummy 2');
        final uniquePath3 = DocumentTranslatorFactory.makeUniquePath(existingFile.path);
        expect(p.basename(uniquePath3), equals('sample.tr (3).txt'));
      } finally {
        tempDir.deleteSync(recursive: true);
      }
    });
  });
}
