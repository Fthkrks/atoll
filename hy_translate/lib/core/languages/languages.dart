import 'language_item.dart';

class Languages {
  static const String autoCode = 'auto';

  static const LanguageItem auto = LanguageItem(
    code: autoCode,
    englishName: 'Auto',
    chineseName: '自动',
    turkishName: 'Dili algıla',
  );

  static const List<LanguageItem> supportedLanguages = [
    LanguageItem(code: 'zh', englishName: 'Chinese', chineseName: '中文', turkishName: 'Çince'),
    LanguageItem(code: 'en', englishName: 'English', chineseName: '英语', turkishName: 'İngilizce'),
    LanguageItem(code: 'fr', englishName: 'French', chineseName: '法语', turkishName: 'Fransızca'),
    LanguageItem(code: 'pt', englishName: 'Portuguese', chineseName: '葡萄牙语', turkishName: 'Portekizce'),
    LanguageItem(code: 'es', englishName: 'Spanish', chineseName: '西班牙语', turkishName: 'İspanyolca'),
    LanguageItem(code: 'ja', englishName: 'Japanese', chineseName: '日语', turkishName: 'Japonca'),
    LanguageItem(code: 'tr', englishName: 'Turkish', chineseName: '土耳其语', turkishName: 'Türkçe'),
    LanguageItem(code: 'ru', englishName: 'Russian', chineseName: '俄语', turkishName: 'Rusça'),
    LanguageItem(code: 'ar', englishName: 'Arabic', chineseName: '阿拉伯语', turkishName: 'Arapça'),
    LanguageItem(code: 'ko', englishName: 'Korean', chineseName: '韩语', turkishName: 'Korece'),
    LanguageItem(code: 'th', englishName: 'Thai', chineseName: '泰语', turkishName: 'Tayca'),
    LanguageItem(code: 'it', englishName: 'Italian', chineseName: '意大利语', turkishName: 'İtalyanca'),
    LanguageItem(code: 'de', englishName: 'German', chineseName: '德语', turkishName: 'Almanca'),
    LanguageItem(code: 'vi', englishName: 'Vietnamese', chineseName: '越南语', turkishName: 'Vietnamca'),
    LanguageItem(code: 'ms', englishName: 'Malay', chineseName: '马来语', turkishName: 'Malayca'),
    LanguageItem(code: 'id', englishName: 'Indonesian', chineseName: '印尼语', turkishName: 'Endonezce'),
    LanguageItem(code: 'fil', englishName: 'Filipino', chineseName: '菲律宾语', turkishName: 'Filipince'),
    LanguageItem(code: 'hi', englishName: 'Hindi', chineseName: '印地语', turkishName: 'Hintçe'),
    LanguageItem(code: 'zh-Hant', englishName: 'Traditional Chinese', chineseName: '繁体中文', turkishName: 'Geleneksel Çince'),
    LanguageItem(code: 'pl', englishName: 'Polish', chineseName: '波兰语', turkishName: 'Lehçe'),
    LanguageItem(code: 'cs', englishName: 'Czech', chineseName: '捷克语', turkishName: 'Çekçe'),
    LanguageItem(code: 'nl', englishName: 'Dutch', chineseName: '荷兰语', turkishName: 'Felemenkçe'),
    LanguageItem(code: 'km', englishName: 'Khmer', chineseName: '高棉语', turkishName: 'Kmerce'),
    LanguageItem(code: 'my', englishName: 'Burmese', chineseName: '缅甸语', turkishName: 'Burmaca'),
    LanguageItem(code: 'fa', englishName: 'Persian', chineseName: '波斯语', turkishName: 'Farsça'),
    LanguageItem(code: 'gu', englishName: 'Gujarati', chineseName: '古吉拉特语', turkishName: 'Güceratça'),
    LanguageItem(code: 'ur', englishName: 'Urdu', chineseName: '乌尔都语', turkishName: 'Urduca'),
    LanguageItem(code: 'te', englishName: 'Telugu', chineseName: '泰卢固语', turkishName: 'Teluguca'),
    LanguageItem(code: 'mr', englishName: 'Marathi', chineseName: '马拉地语', turkishName: 'Marathice'),
    LanguageItem(code: 'he', englishName: 'Hebrew', chineseName: '希伯来语', turkishName: 'İbranice'),
    LanguageItem(code: 'bn', englishName: 'Bengali', chineseName: '孟加拉语', turkishName: 'Bengalce'),
    LanguageItem(code: 'ta', englishName: 'Tamil', chineseName: '泰米尔语', turkishName: 'Tamilce'),
    LanguageItem(code: 'uk', englishName: 'Ukrainian', chineseName: '乌克兰语', turkishName: 'Ukraynaca'),
    LanguageItem(code: 'bo', englishName: 'Tibetan', chineseName: '藏语', turkishName: 'Tibetçe'),
    LanguageItem(code: 'kk', englishName: 'Kazakh', chineseName: '哈萨克语', turkishName: 'Kazakça'),
    LanguageItem(code: 'mn', englishName: 'Mongolian', chineseName: '蒙古语', turkishName: 'Moğolca'),
    LanguageItem(code: 'ug', englishName: 'Uyghur', chineseName: '维吾尔语', turkishName: 'Uygurca'),
    LanguageItem(code: 'yue', englishName: 'Cantonese', chineseName: '粤语', turkishName: 'Kantonca'),
  ];

  static final Map<String, LanguageItem> _languageByCode = {
    for (var l in supportedLanguages) l.code.toLowerCase(): l,
  };

  static LanguageItem? findByCode(String? code) {
    if (code == null || code.trim().isEmpty) return null;
    if (code.toLowerCase() == autoCode) return auto;
    return _languageByCode[code.toLowerCase()];
  }

  static bool isChinese(String? code) {
    if (code == null || code.trim().isEmpty) return false;
    final c = code.toLowerCase();
    return c == 'zh' || c == 'zh-hant' || c == 'yue';
  }

  static bool isRtl(String? code) {
    if (code == null || code.trim().isEmpty) return false;
    final c = code.toLowerCase();
    return c == 'ar' || c == 'he' || c == 'fa' || c == 'ur';
  }

  static const List<String> echoPhrases = [
    'without additional explanation',
    'additional explanation',
    'ek açıklama',
    'ek bilgi olmadan',
    'çevrilmiş sonucu',
    'sadece çevir',
    'translated result',
    '不要额外解释',
  ];

  static bool containsInstructionEcho(String? output, String? originalText) {
    if (output == null || output.trim().isEmpty) return false;
    final lowerOutput = output.toLowerCase();
    final lowerOriginal = originalText?.toLowerCase();

    for (final phrase in echoPhrases) {
      final lowerPhrase = phrase.toLowerCase();
      if (lowerOutput.contains(lowerPhrase)) {
        if (lowerOriginal == null || !lowerOriginal.contains(lowerPhrase)) {
          return true;
        }
      }
    }

    return false;
  }

  static String buildPrompt(String text, String targetLangCode, [String? sourceLangCode]) {
    final targetItem = findByCode(targetLangCode) ??
        LanguageItem(
          code: targetLangCode,
          englishName: targetLangCode,
          chineseName: targetLangCode,
          turkishName: targetLangCode,
        );

    final sourceItem = (sourceLangCode != null &&
            sourceLangCode.trim().isNotEmpty &&
            sourceLangCode.toLowerCase() != autoCode)
        ? findByCode(sourceLangCode)
        : null;

    final useChineseTemplate = isChinese(targetLangCode) ||
        (sourceItem != null && isChinese(sourceItem.code)) ||
        isChinese(sourceLangCode);

    if (useChineseTemplate) {
      return '把下面的文本翻译成${targetItem.chineseName}，不要额外解释。\n\n$text';
    } else {
      return 'Translate the following segment into ${targetItem.englishName}, without additional explanation.\n\n$text';
    }
  }

  static String postProcessTranslation(String rawText, String originalText) {
    if (rawText.isEmpty) return '';

    var text = rawText.trim();

    // Strip markdown code fences if output is wrapped in them but original wasn't
    if (text.startsWith('```') && text.endsWith('```') && text.length >= 6) {
      final firstNewline = text.indexOf('\n');
      if (firstNewline != -1 && firstNewline < text.length - 3) {
        text = text.substring(firstNewline + 1, text.length - 3).trim();
      } else if (text.length > 6) {
        text = text.substring(3, text.length - 3).trim();
      }
    }

    // Strip wrapping quotes if original wasn't wrapped in quotes
    final originalHasQuotes = originalText.isNotEmpty &&
        ((originalText.startsWith('"') && originalText.endsWith('"')) ||
            (originalText.startsWith("'") && originalText.endsWith("'")) ||
            (originalText.startsWith('“') && originalText.endsWith('”')));

    if (!originalHasQuotes && text.length >= 2) {
      if ((text.startsWith('"') && text.endsWith('"')) ||
          (text.startsWith("'") && text.endsWith("'")) ||
          (text.startsWith('“') && text.endsWith('”'))) {
        text = text.substring(1, text.length - 1).trim();
      }
    }

    // Safety guard: if output contains instruction echo not in originalText, fallback to originalText
    if (containsInstructionEcho(text, originalText)) {
      return originalText;
    }

    return text;
  }
}
