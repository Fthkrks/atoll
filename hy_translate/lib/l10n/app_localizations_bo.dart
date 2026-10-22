// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tibetan (`bo`).
class AppLocalizationsBo extends AppLocalizations {
  AppLocalizationsBo([String locale = 'bo']) : super(locale);

  @override
  String get navText => 'ཡིག་ཆ།';

  @override
  String get navDocuments => 'ཡིག་ཆ་ཚང་མ།';

  @override
  String get navSettings => 'སྒྲིག་འགོད།';

  @override
  String get madeBy => '4pp ཡིས་བཟོས།';

  @override
  String get modelRequired =>
      'ཡིག་སྒྱུར་མ་བྱས་གོང་ལ་དཔེ་དབྱིབས་ཕབ་ལེན་ཡང་ན་འདེམས་དགོས།';

  @override
  String translationError(String error) {
    return 'ཡིག་སྒྱུར་ནོར་འཁྲུལ། $error';
  }

  @override
  String genericError(String error) {
    return 'ནོར་འཁྲུལ། $error';
  }

  @override
  String get download => 'ཕབ་ལེན།';

  @override
  String get swapLanguages => 'སྐད་ཡིག་བརྗེ་བ།';

  @override
  String get clear => 'གཙང་སེལ།';

  @override
  String get inputHint => 'ཡིག་ཆ་འཇུག་རོགས...';

  @override
  String get translate => 'ཡིག་སྒྱུར།';

  @override
  String get copyToClipboard => 'སྦྱར་བཅད་པང་དུ་འདྲ་བཤུ།';

  @override
  String get translationCopied => 'ཡིག་སྒྱུར་སྦྱར་བཅད་པང་དུ་འདྲ་བཤུས་ཟིན།';

  @override
  String get translating => 'ཡིག་སྒྱུར་བྱེད་བཞིན་པ།...';

  @override
  String get translationPlaceholder => 'ཡིག་སྒྱུར་འདིར་མངོན་ངེས།';

  @override
  String get documentTitle => 'ཡིག་ཆའི་ཡིག་སྒྱུར།';

  @override
  String pickFileError(String error) {
    return 'ཡིག་ཆ་འདེམས་མ་ཐུབ། $error';
  }

  @override
  String get chooseSaveFolder => 'ཉར་ཚགས་ཀྱི་ཡིག་སྣོད་འདེམས།';

  @override
  String get unsupportedFormat => 'ཡིག་ཆའི་རྣམ་གཞག་འདི་ལ་རྒྱབ་སྐྱོར་མེད།';

  @override
  String get documentDone => 'ཡིག་ཆ་ཡིག་སྒྱུར་ལེགས་པར་བྱས་ཟིན།';

  @override
  String get translationCancelled => 'ཡིག་སྒྱུར་ཕྱིར་འཐེན་བྱས་ཟིན།';

  @override
  String documentError(String error) {
    return 'ཡིག་སྒྱུར་བྱེད་སྐབས་ནོར་འཁྲུལ་བྱུང་། $error';
  }

  @override
  String get tapToPickDocument => 'ཡིག་ཆ་འདེམས་པར་མནན།';

  @override
  String get saveLocation => 'ཉར་ཚགས་ཀྱི་ས་ཆ།';

  @override
  String get change => 'བརྗེ་བ།…';

  @override
  String get pdfOcrTitle => 'PDF ནང་གི་པར་རིས་ཀྱི་ཡིག་ཆ་ཡིག་སྒྱུར་བྱེད། (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'ཞིབ་བཤེར་བྱས་པའི་ཤོག་ངོས་དང་རི་མོའི་ཆེད་དུ་ ML Kit OCR';

  @override
  String get sheetNamesShort => 'ཐེམ་པའི་མིང་ཡིག་སྒྱུར་བྱེད།';

  @override
  String get translateDocument => 'ཡིག་ཆ་ཡིག་སྒྱུར་བྱེད།';

  @override
  String get cancel => 'ཕྱིར་འཐེན།';

  @override
  String get preparing => 'ཡིག་སྒྱུར་གྲ་སྒྲིག་བྱེད་བཞིན་པ།...';

  @override
  String progressLine(int done, int total) {
    return 'ཕྲེང་ $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'དུམ་མཚམས $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'མཉམ་སྤྱོད་ཡིག་ཆ $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'ཤོག་ངོས $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'ཤོག་ངོས $done/$total – པར་རིས་ནང་གི་ཡིག་ཆ་ཀློག་བཞིན་པ།';
  }

  @override
  String get openFile => 'ཡིག་ཆ་ཁ་ཕྱེ།';

  @override
  String get share => 'མཉམ་སྤྱོད།';

  @override
  String get selectSourceLanguage => 'འབྱུང་ཁུངས་སྐད་ཡིག་འདེམས།';

  @override
  String get selectTargetLanguage => 'དམིགས་ཡུལ་སྐད་ཡིག་འདེམས།';

  @override
  String get searchLanguage => 'སྐད་ཡིག་འཚོལ།...';

  @override
  String get detectLanguage => 'སྐད་ཡིག་ངོས་འཛིན།';

  @override
  String get settingsTitle => 'སྒྲིག་འགོད།';

  @override
  String get aiModel => 'AI དཔེ་དབྱིབས།';

  @override
  String get downloadModel => 'དཔེ་དབྱིབས་ཕབ་ལེན། (1.05 GB)';

  @override
  String get pickGguf => 'སྒྲིག་ཆས་ནས་ .gguf འདེམས།';

  @override
  String get cancelDownload => 'ཕབ་ལེན་ཕྱིར་འཐེན།';

  @override
  String get defaultLanguages => 'ཁ་ཆད་སྐད་ཡིག';

  @override
  String get defaultSourceLanguage => 'ཁ་ཆད་འབྱུང་ཁུངས་སྐད་ཡིག';

  @override
  String get defaultTargetLanguage => 'ཁ་ཆད་དམིགས་ཡུལ་སྐད་ཡིག';

  @override
  String get documentsOcr => 'ཡིག་ཆ་དང་ OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR རྒྱབ་སྐྱོར།';

  @override
  String get pdfOcrSupportDesc =>
      'ཞིབ་བཤེར་བྱས་པའི་ PDF དང་པར་རིས་ནང་གི་ཡིག་ཆ་ཡིག་སྒྱུར་བྱེད།';

  @override
  String get sheetNames => 'Excel ཐེམ་པའི་མིང་ཡིག་སྒྱུར་བྱེད།';

  @override
  String get sheetNamesDesc => 'རེའུ་མིག་ཐེམ་པའི་ཁ་བྱང་ཡང་ཡིག་སྒྱུར་བྱེད།';

  @override
  String get appearance => 'མཚང་མཇལ།';

  @override
  String get appTheme => 'ཉེར་སྤྱོད་ཀྱི་བརྒྱུད་རིམ།';

  @override
  String get themeSystem => 'མ་ལག';

  @override
  String get themeLight => 'འོད་གསལ།';

  @override
  String get themeDark => 'མུན་ནག';

  @override
  String get appLanguage => 'ཉེར་སྤྱོད་ཀྱི་སྐད་ཡིག';

  @override
  String get systemDefault => 'མ་ལག་གི་ཁ་ཆད།';

  @override
  String get about => 'སྐོར།';

  @override
  String get aboutDescription =>
      'དྲ་རྒྱ་མེད་པར་སྒྲིག་ཆས་སྟེང་དུ་ཡོངས་རྫོགས་སྒྱུར་བཞིན་པའི་ AI ཡིག་སྒྱུར་ཉེར་སྤྱོད། Tencent HunYuan MT2 1.8B དཔེ་དབྱིབས་དང་ llama.cpp FFI ཆས་ཀྱིས་སྤར་བ། ཡིག་ཆ་གང་ཡང་དྲ་རྒྱར་མི་གཏོང་།';

  @override
  String get modelNotInstalled => 'དཔེ་དབྱིབས་སྒྲིག་འཇུག་མ་བྱས།';

  @override
  String get modelNotDownloaded => 'དཔེ་དབྱིབས་ད་དུང་ཕབ་ལེན་མ་བྱས།';

  @override
  String modelFileNotFound(String path) {
    return 'དཔེ་དབྱིབས་ཀྱི་ཡིག་ཆ་རྙེད་མ་སོང་། $path';
  }

  @override
  String get modelLoading => 'དཔེ་དབྱིབས་ཉར་ཚགས་ནང་འཇུག་བཞིན་པ།...';

  @override
  String get modelReady =>
      'དཔེ་དབྱིབས་གྲ་སྒྲིག་ཚར། (HunYuan MT2 1.8B དྲ་རྒྱ་མེད་པ།)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ཡིག་ཆ་འདེམས་སྐབས་ནོར་འཁྲུལ། $error';
  }

  @override
  String get downloadStarting => 'ཕབ་ལེན་འགོ་འཛུགས་བཞིན་པ།...';

  @override
  String get downloadCancelledKept =>
      'ཕབ་ལེན་ཕྱིར་འཐེན་བྱས་ཟིན། (ཡར་རྒྱས་ཉར་ཡོད།)';

  @override
  String downloadingPercent(String percent) {
    return 'ཕབ་ལེན་བྱེད་བཞིན་པ། $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 ཡང་དག་བཤེར་བཞིན་པ།...';

  @override
  String get downloadCompleteLoading => 'ཕབ་ལེན་ཚར། དཔེ་དབྱིབས་འཇུག་བཞིན་པ།...';

  @override
  String get downloadCancelled => 'ཕབ་ལེན་ཕྱིར་འཐེན་བྱས་ཟིན།';

  @override
  String downloadError(String error) {
    return 'ཕབ་ལེན་ནོར་འཁྲུལ། $error';
  }

  @override
  String get cancellingDownload => 'ཕབ་ལེན་ཕྱིར་འཐེན་བྱེད་བཞིན་པ།...';

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
