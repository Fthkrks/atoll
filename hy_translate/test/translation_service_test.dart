import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/translation/fake_translator.dart';
import 'package:hy_translate/core/translation/translation_service.dart';

void main() {
  group('TranslationService Tests', () {
    test('shouldSkip correctly identifies non-translatable text', () {
      // Empty or whitespace
      expect(TranslationService.shouldSkip(''), isTrue);
      expect(TranslationService.shouldSkip('   \n\t '), isTrue);

      // Only numbers / punctuation
      expect(TranslationService.shouldSkip('12345'), isTrue);
      expect(TranslationService.shouldSkip('123, 456.78!'), isTrue);
      expect(TranslationService.shouldSkip('--- === +++'), isTrue);

      // URLs and emails
      expect(TranslationService.shouldSkip('https://flutter.dev/docs'), isTrue);
      expect(TranslationService.shouldSkip('contact@example.com'), isTrue);
      expect(TranslationService.shouldSkip('http://localhost:8080/api/v1'), isTrue);

      // Regular text should not be skipped
      expect(TranslationService.shouldSkip('Hello world'), isFalse);
      expect(TranslationService.shouldSkip('Günaydın dünya'), isFalse);
      expect(TranslationService.shouldSkip('This is a complete sentence with 123 numbers.'), isFalse);
    });

    test('preserves leading and trailing whitespace exactly', () async {
      final fake = FakeTranslator('TR_');
      final service = TranslationService(fake);

      final result = await service.translateText(
        '  \nHello world  \t',
        'tr',
        sourceLang: 'en',
      );

      expect(result.startsWith('  \n'), isTrue);
      expect(result.endsWith('  \t'), isTrue);
      expect(result, contains('Hello world'));
    });

    test('uses cache for duplicate queries', () async {
      final fake = FakeTranslator('TR_');
      final service = TranslationService(fake);

      final result1 = await service.translateText(
        'Consistent greeting text',
        'tr',
        sourceLang: 'en',
      );
      final result2 = await service.translateText(
        'Consistent greeting text',
        'tr',
        sourceLang: 'en',
      );

      expect(result1, equals(result2));
      expect(fake.callCount, equals(1)); // Only called once, second was served from cache
      expect(service.cacheCount, equals(1));
    });

    test('retries on instruction echo', () async {
      int calls = 0;
      final fake = FakeTranslator.withHandler((input) {
        calls++;
        if (calls == 1) {
          // First call echoes instruction
          return 'without additional explanation: Merhaba';
        }
        return 'Başarılı tercüme';
      });
      final service = TranslationService(fake);

      final result = await service.translateText(
        'Source segment',
        'tr',
        sourceLang: 'en',
      );

      expect(calls, equals(2));
      expect(result, equals('Başarılı tercüme'));
    });
  });
}
