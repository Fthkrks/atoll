// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get navText => 'मजकूर';

  @override
  String get navDocuments => 'दस्तऐवज';

  @override
  String get navSettings => 'सेटिंग्ज';

  @override
  String get madeBy => '4pp ने बनवलेले';

  @override
  String get modelRequired =>
      'भाषांतर करण्यापूर्वी मॉडेल डाउनलोड करणे किंवा निवडणे आवश्यक आहे.';

  @override
  String translationError(String error) {
    return 'भाषांतरात त्रुटी: $error';
  }

  @override
  String genericError(String error) {
    return 'त्रुटी: $error';
  }

  @override
  String get download => 'डाउनलोड करा';

  @override
  String get swapLanguages => 'भाषा अदलाबदल करा';

  @override
  String get clear => 'साफ करा';

  @override
  String get inputHint => 'मजकूर लिहा...';

  @override
  String get translate => 'भाषांतर करा';

  @override
  String get copyToClipboard => 'क्लिपबोर्डवर कॉपी करा';

  @override
  String get translationCopied => 'भाषांतर क्लिपबोर्डवर कॉपी केले';

  @override
  String get translating => 'भाषांतर होत आहे...';

  @override
  String get translationPlaceholder => 'भाषांतर येथे दिसेल';

  @override
  String get documentTitle => 'दस्तऐवज भाषांतर';

  @override
  String pickFileError(String error) {
    return 'फाइल निवडता आली नाही: $error';
  }

  @override
  String get chooseSaveFolder => 'सेव्ह फोल्डर निवडा';

  @override
  String get unsupportedFormat => 'हे फाइल स्वरूप समर्थित नाही.';

  @override
  String get documentDone => 'दस्तऐवजाचे भाषांतर यशस्वीरीत्या झाले!';

  @override
  String get translationCancelled => 'भाषांतर रद्द केले.';

  @override
  String documentError(String error) {
    return 'भाषांतरादरम्यान त्रुटी आली: $error';
  }

  @override
  String get tapToPickDocument => 'दस्तऐवज निवडण्यासाठी टॅप करा';

  @override
  String get saveLocation => 'सेव्ह करण्याचे ठिकाण:';

  @override
  String get change => 'बदला…';

  @override
  String get pdfOcrTitle => 'PDF मधील प्रतिमांमधील मजकुराचे भाषांतर करा (OCR)';

  @override
  String get pdfOcrSubtitle => 'स्कॅन केलेली पाने आणि आकृत्यांसाठी ML Kit OCR';

  @override
  String get sheetNamesShort => 'शीटच्या नावांचे भाषांतर करा';

  @override
  String get translateDocument => 'दस्तऐवजाचे भाषांतर करा';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get preparing => 'भाषांतर तयार होत आहे...';

  @override
  String progressLine(int done, int total) {
    return 'ओळ $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'परिच्छेद $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'शेअर केलेला मजकूर $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'पान $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'पान $done/$total – प्रतिमांमधील मजकूर वाचला जात आहे';
  }

  @override
  String get openFile => 'फाइल उघडा';

  @override
  String get share => 'शेअर करा';

  @override
  String get selectSourceLanguage => 'स्रोत भाषा निवडा';

  @override
  String get selectTargetLanguage => 'लक्ष्य भाषा निवडा';

  @override
  String get searchLanguage => 'भाषा शोधा...';

  @override
  String get detectLanguage => 'भाषा ओळखा';

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get aiModel => 'AI मॉडेल';

  @override
  String get downloadModel => 'मॉडेल डाउनलोड करा (1.05 GB)';

  @override
  String get pickGguf => 'डिव्हाइसमधून .gguf निवडा';

  @override
  String get cancelDownload => 'डाउनलोड रद्द करा';

  @override
  String get defaultLanguages => 'डीफॉल्ट भाषा';

  @override
  String get defaultSourceLanguage => 'डीफॉल्ट स्रोत भाषा';

  @override
  String get defaultTargetLanguage => 'डीफॉल्ट लक्ष्य भाषा';

  @override
  String get documentsOcr => 'दस्तऐवज आणि OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR समर्थन';

  @override
  String get pdfOcrSupportDesc =>
      'स्कॅन केलेल्या PDF आणि प्रतिमांमधील मजकुराचे भाषांतर करा';

  @override
  String get sheetNames => 'Excel शीटच्या नावांचे भाषांतर करा';

  @override
  String get sheetNamesDesc => 'स्प्रेडशीट टॅबच्या शीर्षकांचेही भाषांतर करते';

  @override
  String get appearance => 'स्वरूप';

  @override
  String get appTheme => 'अ‍ॅप थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get appLanguage => 'अ‍ॅपची भाषा';

  @override
  String get systemDefault => 'सिस्टम डीफॉल्ट';

  @override
  String get about => 'माहिती';

  @override
  String get aboutDescription =>
      'पूर्णपणे ऑफलाइन आणि डिव्हाइसवरच चालणारे AI भाषांतर अ‍ॅप. Tencent HunYuan MT2 1.8B मॉडेल आणि llama.cpp FFI इंजिनद्वारे संचालित. कोणताही मजकूर किंवा दस्तऐवज इंटरनेटवर पाठवला जात नाही.';

  @override
  String get modelNotInstalled => 'मॉडेल इन्स्टॉल केलेले नाही';

  @override
  String get modelNotDownloaded => 'मॉडेल अजून डाउनलोड केलेले नाही';

  @override
  String modelFileNotFound(String path) {
    return 'मॉडेल फाइल सापडली नाही: $path';
  }

  @override
  String get modelLoading => 'मॉडेल मेमरीमध्ये लोड होत आहे...';

  @override
  String get modelReady => 'मॉडेल तयार आहे (HunYuan MT2 1.8B ऑफलाइन)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'फाइल निवडताना त्रुटी: $error';
  }

  @override
  String get downloadStarting => 'डाउनलोड सुरू होत आहे...';

  @override
  String get downloadCancelledKept => 'डाउनलोड रद्द केले (प्रगती जतन केली)';

  @override
  String downloadingPercent(String percent) {
    return 'डाउनलोड होत आहे: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 पडताळले जात आहे...';

  @override
  String get downloadCompleteLoading => 'डाउनलोड पूर्ण, मॉडेल लोड होत आहे...';

  @override
  String get downloadCancelled => 'डाउनलोड रद्द केले';

  @override
  String downloadError(String error) {
    return 'डाउनलोड त्रुटी: $error';
  }

  @override
  String get cancellingDownload => 'डाउनलोड रद्द होत आहे...';

  @override
  String get onboardingHeadline => 'Translate without internet';

  @override
  String get onboardingBenefitOffline => 'Works fully offline after setup';

  @override
  String get onboardingBenefitPrivate => 'Private, nothing leaves your device';

  @override
  String get onboardingBenefitFormats => 'Translate text and documents';

  @override
  String onboardingSizeNote(String size) {
    return 'One-time download: about $size GB. Wi-Fi recommended.';
  }

  @override
  String get onboardingDownloadButton => 'Download model';

  @override
  String get onboardingBackgroundNote =>
      'You can leave the app; download will resume where you left off.';

  @override
  String get onboardingTryAgain => 'Try again';

  @override
  String get onboardingHaveGguf => 'I already have a .gguf file';

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
