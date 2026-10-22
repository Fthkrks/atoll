// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get navText => 'टेक्स्ट';

  @override
  String get navDocuments => 'दस्तावेज़';

  @override
  String get navSettings => 'सेटिंग';

  @override
  String get madeBy => '4pp द्वारा बनाया गया';

  @override
  String get modelRequired =>
      'अनुवाद करने से पहले मॉडल को डाउनलोड या चुनना ज़रूरी है।';

  @override
  String translationError(String error) {
    return 'अनुवाद में त्रुटि: $error';
  }

  @override
  String genericError(String error) {
    return 'त्रुटि: $error';
  }

  @override
  String get download => 'डाउनलोड करें';

  @override
  String get swapLanguages => 'भाषाएँ बदलें';

  @override
  String get clear => 'साफ़ करें';

  @override
  String get inputHint => 'टेक्स्ट लिखें...';

  @override
  String get translate => 'अनुवाद करें';

  @override
  String get copyToClipboard => 'क्लिपबोर्ड पर कॉपी करें';

  @override
  String get translationCopied => 'अनुवाद क्लिपबोर्ड पर कॉपी हो गया';

  @override
  String get translating => 'अनुवाद हो रहा है...';

  @override
  String get translationPlaceholder => 'अनुवाद यहाँ दिखाई देगा';

  @override
  String get documentTitle => 'दस्तावेज़ अनुवाद';

  @override
  String pickFileError(String error) {
    return 'फ़ाइल नहीं चुनी जा सकी: $error';
  }

  @override
  String get chooseSaveFolder => 'सेव करने का फ़ोल्डर चुनें';

  @override
  String get unsupportedFormat => 'यह फ़ाइल फ़ॉर्मैट समर्थित नहीं है।';

  @override
  String get documentDone => 'दस्तावेज़ का अनुवाद सफलतापूर्वक हो गया!';

  @override
  String get translationCancelled => 'अनुवाद रद्द कर दिया गया।';

  @override
  String documentError(String error) {
    return 'अनुवाद के दौरान त्रुटि हुई: $error';
  }

  @override
  String get tapToPickDocument => 'दस्तावेज़ चुनने के लिए टैप करें';

  @override
  String get saveLocation => 'सेव करने का स्थान:';

  @override
  String get change => 'बदलें…';

  @override
  String get pdfOcrTitle =>
      'PDF की छवियों में मौजूद टेक्स्ट का अनुवाद करें (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'स्कैन किए गए पृष्ठों और आरेखों के लिए ML Kit OCR';

  @override
  String get sheetNamesShort => 'शीट के नामों का अनुवाद करें';

  @override
  String get translateDocument => 'दस्तावेज़ का अनुवाद करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get preparing => 'अनुवाद तैयार किया जा रहा है...';

  @override
  String progressLine(int done, int total) {
    return 'पंक्ति $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'अनुच्छेद $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'साझा किया गया टेक्स्ट $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'पृष्ठ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'पृष्ठ $done/$total – छवियों में टेक्स्ट पढ़ा जा रहा है';
  }

  @override
  String get openFile => 'फ़ाइल खोलें';

  @override
  String get share => 'शेयर करें';

  @override
  String get selectSourceLanguage => 'स्रोत भाषा चुनें';

  @override
  String get selectTargetLanguage => 'लक्ष्य भाषा चुनें';

  @override
  String get searchLanguage => 'भाषा खोजें...';

  @override
  String get detectLanguage => 'भाषा पहचानें';

  @override
  String get settingsTitle => 'सेटिंग';

  @override
  String get aiModel => 'AI मॉडल';

  @override
  String get downloadModel => 'मॉडल डाउनलोड करें (1.05 GB)';

  @override
  String get pickGguf => 'डिवाइस से .gguf चुनें';

  @override
  String get cancelDownload => 'डाउनलोड रद्द करें';

  @override
  String get defaultLanguages => 'डिफ़ॉल्ट भाषाएँ';

  @override
  String get defaultSourceLanguage => 'डिफ़ॉल्ट स्रोत भाषा';

  @override
  String get defaultTargetLanguage => 'डिफ़ॉल्ट लक्ष्य भाषा';

  @override
  String get documentsOcr => 'दस्तावेज़ और OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR सहायता';

  @override
  String get pdfOcrSupportDesc =>
      'स्कैन किए गए PDF और छवियों में मौजूद टेक्स्ट का अनुवाद करें';

  @override
  String get sheetNames => 'Excel शीट के नामों का अनुवाद करें';

  @override
  String get sheetNamesDesc =>
      'स्प्रेडशीट टैब के शीर्षकों का भी अनुवाद करता है';

  @override
  String get appearance => 'दिखावट';

  @override
  String get appTheme => 'ऐप थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get appLanguage => 'ऐप की भाषा';

  @override
  String get systemDefault => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get about => 'परिचय';

  @override
  String get aboutDescription =>
      'पूरी तरह ऑफ़लाइन और डिवाइस पर चलने वाला AI अनुवाद ऐप। यह Tencent HunYuan MT2 1.8B मॉडल और llama.cpp FFI इंजन से संचालित है। कोई भी टेक्स्ट या दस्तावेज़ इंटरनेट पर नहीं भेजा जाता।';

  @override
  String get modelNotInstalled => 'मॉडल इंस्टॉल नहीं है';

  @override
  String get modelNotDownloaded => 'मॉडल अभी डाउनलोड नहीं हुआ है';

  @override
  String modelFileNotFound(String path) {
    return 'मॉडल फ़ाइल नहीं मिली: $path';
  }

  @override
  String get modelLoading => 'मॉडल को मेमोरी में लोड किया जा रहा है...';

  @override
  String get modelReady => 'मॉडल तैयार है (HunYuan MT2 1.8B ऑफ़लाइन)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'फ़ाइल चुनते समय त्रुटि हुई: $error';
  }

  @override
  String get downloadStarting => 'डाउनलोड शुरू हो रहा है...';

  @override
  String get downloadCancelledKept =>
      'डाउनलोड रद्द किया गया (प्रगति सुरक्षित है)';

  @override
  String downloadingPercent(String percent) {
    return 'डाउनलोड हो रहा है: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 सत्यापित किया जा रहा है...';

  @override
  String get downloadCompleteLoading =>
      'डाउनलोड पूरा हुआ, मॉडल लोड हो रहा है...';

  @override
  String get downloadCancelled => 'डाउनलोड रद्द किया गया';

  @override
  String downloadError(String error) {
    return 'डाउनलोड त्रुटि: $error';
  }

  @override
  String get cancellingDownload => 'डाउनलोड रद्द किया जा रहा है...';

  @override
  String get onboardingHeadline => 'बिना इंटरनेट अनुवाद करें';

  @override
  String get onboardingBenefitOffline =>
      'सेटअप के बाद पूरी तरह से ऑफ़लाइन काम करता है';

  @override
  String get onboardingBenefitPrivate =>
      'निजी, आपके डिवाइस से कोई भी डेटा बाहर नहीं जाता है';

  @override
  String get onboardingBenefitFormats => 'पाठ और दस्तावेज़ अनुवाद करें';

  @override
  String onboardingSizeNote(String size) {
    return 'एक बार डाउनलोड: लगभग $size GB। वाई-फ़ाई अनुशंसित।';
  }

  @override
  String get onboardingDownloadButton => 'मॉडल डाउनलोड करें';

  @override
  String get onboardingBackgroundNote =>
      'आप ऐप छोड़ सकते हैं; डाउनलोड वहीं से फिर से शुरू होगा जहां रुका था।';

  @override
  String get onboardingTryAgain => 'पुनः प्रयास करें';

  @override
  String get onboardingHaveGguf => 'मेरे पास पहले से ही .gguf फ़ाइल है';

  @override
  String get downloadErrorNetwork =>
      'Network error. Please check your connection.';

  @override
  String downloadErrorServer(String code) {
    return 'Server error ($code). Please try again later.';
  }

  @override
  String get downloadErrorVerification =>
      'Verification failed. The downloaded file is corrupted.';

  @override
  String get downloadErrorGeneric => 'Download failed. Please try again.';
}
