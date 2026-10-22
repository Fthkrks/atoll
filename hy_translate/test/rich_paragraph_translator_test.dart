import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/translation/fake_translator.dart';
import 'package:hy_translate/core/translation/rich_paragraph_translator.dart';
import 'package:hy_translate/core/translation/translation_service.dart';

void main() {
  group('RichParagraphTranslator Tests', () {
    test('single run translates plain without tags', () async {
      final fake = FakeTranslator('TR_');
      final service = TranslationService(fake);

      final result = await RichParagraphTranslator.translateRuns(
        runTexts: ['Hello world'],
        formatKeys: ['normal'],
        service: service,
        targetLang: 'tr',
        sourceLang: 'en',
      );

      expect(result.pieces.length, equals(1));
      expect(result.pieces[0].templateRunIndex, equals(0));
      expect(result.pieces[0].text, contains('Hello world'));
      expect(result.fellBack, isFalse);
    });

    test('multi-run generates tags for non-base formats and recovers pieces correctly', () async {
      // Simulate an LLM that preserves tags and translates
      final fake = FakeTranslator.withHandler((input) {
        // Input: "This is <g1>bold</g1> and <g2>italic</g2> text."
        // Mock translation preserving tags:
        return 'Bu <g1>kalın</g1> ve <g2>italik</g2> metindir.';
      });
      final service = TranslationService(fake);

      final result = await RichParagraphTranslator.translateRuns(
        runTexts: ['This is ', 'bold', ' and ', 'italic', ' text.'],
        formatKeys: ['normal', 'bold_key', 'normal', 'italic_key', 'normal'],
        service: service,
        targetLang: 'tr',
        sourceLang: 'en',
      );

      expect(result.fellBack, isFalse);
      expect(result.pieces.isNotEmpty, isTrue);

      // Verify that pieces reference the right template indices
      final boldPiece = result.pieces.firstWhere((p) => p.text.contains('kalın'));
      expect(boldPiece.templateRunIndex, equals(1));

      final italicPiece = result.pieces.firstWhere((p) => p.text.contains('italik'));
      expect(italicPiece.templateRunIndex, equals(3));
    });

    test('falls back cleanly when LLM drops or mangles tags', () async {
      final fake = FakeTranslator.withHandler((input) {
        // LLM dropped all tags and returned plain text
        return 'Bu kalın ve italik metindir.';
      });
      final service = TranslationService(fake);

      final result = await RichParagraphTranslator.translateRuns(
        runTexts: ['This is ', 'bold', ' text.'],
        formatKeys: ['normal', 'bold_key', 'normal'],
        service: service,
        targetLang: 'tr',
        sourceLang: 'en',
      );

      // Should fall back cleanly without throwing or losing translated text
      expect(result.fellBack, isTrue);
      expect(result.pieces.length, equals(1));
      expect(result.pieces[0].text, equals('Bu kalın ve italik metindir.'));
    });

    test('handles tag reordering by the model', () async {
      final fake = FakeTranslator.withHandler((input) {
        // Model flips order: <g2> comes before <g1>
        return '<g2>İkinci</g2> ortada temel metin <g1>Birinci</g1>';
      });
      final service = TranslationService(fake);

      final result = await RichParagraphTranslator.translateRuns(
        runTexts: ['First', ' middle long base text ', 'Second'],
        formatKeys: ['f1', 'base', 'f2'],
        service: service,
        targetLang: 'tr',
        sourceLang: 'en',
      );

      expect(result.fellBack, isFalse);
      expect(result.reordered, isTrue);
      expect(result.pieces.first.text, contains('İkinci'));
      expect(result.pieces.first.templateRunIndex, equals(2));
      expect(result.pieces.last.text, contains('Birinci'));
      expect(result.pieces.last.templateRunIndex, equals(0));
    });
  });
}
