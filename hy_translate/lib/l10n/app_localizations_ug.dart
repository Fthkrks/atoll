// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AppLocalizationsUg extends AppLocalizations {
  AppLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get navText => 'تېكىست';

  @override
  String get navDocuments => 'ھۆججەتلەر';

  @override
  String get navSettings => 'تەڭشەكلەر';

  @override
  String get madeBy => '4pp تەرىپىدىن ياسالغان';

  @override
  String get modelRequired =>
      'تەرجىمە قىلىشتىن بۇرۇن مودېلنى چۈشۈرۈش ياكى تاللاش كېرەك.';

  @override
  String translationError(String error) {
    return 'تەرجىمە خاتالىقى: $error';
  }

  @override
  String genericError(String error) {
    return 'خاتالىق: $error';
  }

  @override
  String get download => 'چۈشۈر';

  @override
  String get swapLanguages => 'تىللارنى ئالماشتۇر';

  @override
  String get clear => 'تازىلا';

  @override
  String get inputHint => 'تېكىست كىرگۈزۈڭ...';

  @override
  String get translate => 'تەرجىمە قىل';

  @override
  String get copyToClipboard => 'چاپلاش تاختىسىغا كۆچۈر';

  @override
  String get translationCopied => 'تەرجىمە چاپلاش تاختىسىغا كۆچۈرۈلدى';

  @override
  String get translating => 'تەرجىمە قىلىنىۋاتىدۇ...';

  @override
  String get translationPlaceholder => 'تەرجىمە بۇ يەردە كۆرۈنىدۇ';

  @override
  String get documentTitle => 'ھۆججەت تەرجىمىسى';

  @override
  String pickFileError(String error) {
    return 'ھۆججەتنى تاللىغىلى بولمىدى: $error';
  }

  @override
  String get chooseSaveFolder => 'ساقلاش ھۆججەت قىسقۇچىنى تاللاڭ';

  @override
  String get unsupportedFormat => 'بۇ ھۆججەت فورماتىنى قوللىمايدۇ.';

  @override
  String get documentDone => 'ھۆججەت مۇۋەپپەقىيەتلىك تەرجىمە قىلىندى!';

  @override
  String get translationCancelled => 'تەرجىمە بىكار قىلىندى.';

  @override
  String documentError(String error) {
    return 'تەرجىمە جەريانىدا خاتالىق كۆرۈلدى: $error';
  }

  @override
  String get tapToPickDocument => 'ھۆججەت تاللاش ئۈچۈن چېكىڭ';

  @override
  String get saveLocation => 'ساقلاش ئورنى:';

  @override
  String get change => 'ئۆزگەرت…';

  @override
  String get pdfOcrTitle => 'PDF دىكى رەسىملەردىكى تېكىستنى تەرجىمە قىل (OCR)';

  @override
  String get pdfOcrSubtitle => 'سايىلەنگەن بەتلەر ۋە سخېمىلار ئۈچۈن ML Kit OCR';

  @override
  String get sheetNamesShort => 'جەدۋەل ئىسىملىرىنى تەرجىمە قىل';

  @override
  String get translateDocument => 'ھۆججەتنى تەرجىمە قىل';

  @override
  String get cancel => 'بىكار قىل';

  @override
  String get preparing => 'تەرجىمە تەييارلىنىۋاتىدۇ...';

  @override
  String progressLine(int done, int total) {
    return 'قۇر $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'ئابزاس $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'ھەمبەھىرلەنگەن تېكىست $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'بەت $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'بەت $done/$total – رەسىمدىكى تېكىست ئوقۇلىۋاتىدۇ';
  }

  @override
  String get openFile => 'ھۆججەتنى ئاچ';

  @override
  String get share => 'ھەمبەھىرلە';

  @override
  String get selectSourceLanguage => 'مەنبە تىلىنى تاللاڭ';

  @override
  String get selectTargetLanguage => 'نىشان تىلىنى تاللاڭ';

  @override
  String get searchLanguage => 'تىل ئىزدەش...';

  @override
  String get detectLanguage => 'تىلنى بايقا';

  @override
  String get settingsTitle => 'تەڭشەكلەر';

  @override
  String get aiModel => 'سۈنئىي ئىنتېللېكت مودېلى';

  @override
  String get downloadModel => 'مودېلنى چۈشۈر (1.05 GB)';

  @override
  String get pickGguf => 'ئۈسكۈنىدىن .gguf تاللا';

  @override
  String get cancelDownload => 'چۈشۈرۈشنى بىكار قىل';

  @override
  String get defaultLanguages => 'سۈكۈتتىكى تىللار';

  @override
  String get defaultSourceLanguage => 'سۈكۈتتىكى مەنبە تىل';

  @override
  String get defaultTargetLanguage => 'سۈكۈتتىكى نىشان تىل';

  @override
  String get documentsOcr => 'ھۆججەت ۋە OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR قوللىشى';

  @override
  String get pdfOcrSupportDesc =>
      'سايىلەنگەن PDF ۋە رەسىملەردىكى تېكىستنى تەرجىمە قىل';

  @override
  String get sheetNames => 'Excel جەدۋەل ئىسىملىرىنى تەرجىمە قىل';

  @override
  String get sheetNamesDesc =>
      'ئېلېكترونلۇق جەدۋەل بەتكۈچلىرىنىڭ ماۋزۇلىرىنىمۇ تەرجىمە قىلىدۇ';

  @override
  String get appearance => 'كۆرۈنۈش';

  @override
  String get appTheme => 'ئەپ تېمىسى';

  @override
  String get themeSystem => 'سىستېما';

  @override
  String get themeLight => 'ئوچۇق';

  @override
  String get themeDark => 'قاراڭغۇ';

  @override
  String get appLanguage => 'ئەپ تىلى';

  @override
  String get systemDefault => 'سىستېما سۈكۈتى';

  @override
  String get about => 'ھەققىدە';

  @override
  String get aboutDescription =>
      'پۈتۈنلەي تورسىز، ئۈسكۈنىنىڭ ئۆزىدە ئىشلەيدىغان AI تەرجىمە ئەپى. Tencent HunYuan MT2 1.8B مودېلى ۋە llama.cpp FFI ماتورى بىلەن قوزغىتىلىدۇ. ھېچقانداق تېكىست ياكى ھۆججەت تورغا يوللانمايدۇ.';

  @override
  String get modelNotInstalled => 'مودېل قاچىلانمىغان';

  @override
  String get modelNotDownloaded => 'مودېل تېخى چۈشۈرۈلمىدى';

  @override
  String modelFileNotFound(String path) {
    return 'مودېل ھۆججىتى تېپىلمىدى: $path';
  }

  @override
  String get modelLoading => 'مودېل ئەسلەكە يۈكلىنىۋاتىدۇ...';

  @override
  String get modelReady => 'مودېل تەييار (HunYuan MT2 1.8B تورسىز)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ھۆججەت تاللاشتا خاتالىق: $error';
  }

  @override
  String get downloadStarting => 'چۈشۈرۈش باشلىنىۋاتىدۇ...';

  @override
  String get downloadCancelledKept =>
      'چۈشۈرۈش بىكار قىلىندى (ئىلگىرىلەش ساقلاندى)';

  @override
  String downloadingPercent(String percent) {
    return 'چۈشۈرۈلۈۋاتىدۇ: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 دەلىللىنىۋاتىدۇ...';

  @override
  String get downloadCompleteLoading =>
      'چۈشۈرۈش تامام بولدى، مودېل يۈكلىنىۋاتىدۇ...';

  @override
  String get downloadCancelled => 'چۈشۈرۈش بىكار قىلىندى';

  @override
  String downloadError(String error) {
    return 'چۈشۈرۈش خاتالىقى: $error';
  }

  @override
  String get cancellingDownload => 'چۈشۈرۈش بىكار قىلىنىۋاتىدۇ...';

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
