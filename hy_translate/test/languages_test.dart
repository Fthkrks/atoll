import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/languages/languages.dart';

void main() {
  group('Languages Tests', () {
    test('findByCode finds correct language and is case-insensitive', () {
      expect(Languages.findByCode('auto'), equals(Languages.auto));
      expect(Languages.findByCode('AUTO'), equals(Languages.auto));
      expect(Languages.findByCode('tr')?.englishName, equals('Turkish'));
      expect(Languages.findByCode('TR')?.englishName, equals('Turkish'));
      expect(Languages.findByCode('zh')?.englishName, equals('Chinese'));
      expect(Languages.findByCode('nonexistent'), isNull);
      expect(Languages.findByCode(null), isNull);
      expect(Languages.findByCode(''), isNull);
    });

    test('isChinese recognizes zh and zh-Hant', () {
      expect(Languages.isChinese('zh'), isTrue);
      expect(Languages.isChinese('ZH'), isTrue);
      expect(Languages.isChinese('zh-hant'), isTrue);
      expect(Languages.isChinese('yue'), isTrue);
      expect(Languages.isChinese('en'), isFalse);
    });

    test('isRtl recognizes Arabic, Persian, Urdu, Hebrew', () {
      expect(Languages.isRtl('ar'), isTrue);
      expect(Languages.isRtl('fa'), isTrue);
      expect(Languages.isRtl('ur'), isTrue);
      expect(Languages.isRtl('he'), isTrue);
      expect(Languages.isRtl('tr'), isFalse);
      expect(Languages.isRtl('en'), isFalse);
    });

    test('buildPrompt uses English template when neither source nor target is Chinese', () {
      final prompt = Languages.buildPrompt('Hello world', 'tr', 'en');
      expect(
        prompt,
        equals('Translate the following segment into Turkish, without additional explanation.\n\nHello world'),
      );
    });

    test('buildPrompt uses Chinese template when target is Chinese', () {
      final prompt = Languages.buildPrompt('Hello world', 'zh', 'en');
      expect(
        prompt,
        equals('把下面的文本翻译成中文，不要额外解释。\n\nHello world'),
      );
    });

    test('buildPrompt uses Chinese template when source is Chinese', () {
      final prompt = Languages.buildPrompt('你好世界', 'en', 'zh');
      expect(
        prompt,
        equals('把下面的文本翻译成英语，不要额外解释。\n\n你好世界'),
      );
    });

    test('containsInstructionEcho detects echoed instructions', () {
      expect(
        Languages.containsInstructionEcho(
          'Translate the following segment into Turkish: without additional explanation',
          'Hello world',
        ),
        isTrue,
      );
      expect(
        Languages.containsInstructionEcho(
          'without additional explanation, here is the text: Merhaba',
          'Merhaba',
        ),
        isTrue,
      );
      expect(
        Languages.containsInstructionEcho('不要额外解释', '你好'),
        isTrue,
      );
      expect(
        Languages.containsInstructionEcho('Merhaba dünya, nasılsınız?', 'Hello world, how are you?'),
        isFalse,
      );
    });

    test('postProcessTranslation strips code blocks, quotes and whitespace', () {
      // Strips triple backticks markdown fences
      expect(
        Languages.postProcessTranslation('```Merhaba dünya```', 'Hello world'),
        equals('Merhaba dünya'),
      );
      expect(
        Languages.postProcessTranslation('```json\nMerhaba dünya\n```', 'Hello world'),
        equals('Merhaba dünya'),
      );

      // Strips surrounding quotes
      expect(
        Languages.postProcessTranslation('"Merhaba dünya"', 'Hello world'),
        equals('Merhaba dünya'),
      );
      expect(
        Languages.postProcessTranslation('“Merhaba dünya”', 'Hello world'),
        equals('Merhaba dünya'),
      );

      // Echo safety guard returns original text if translated text echoes instructions
      const echoed = 'Translate the following segment into Turkish without additional explanation';
      expect(
        Languages.postProcessTranslation(echoed, 'Hello world'),
        equals('Hello world'),
      );
    });
  });
}
