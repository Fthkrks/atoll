// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get navText => 'వచనం';

  @override
  String get navDocuments => 'పత్రాలు';

  @override
  String get navSettings => 'సెట్టింగ్‌లు';

  @override
  String get madeBy => '4pp రూపొందించింది';

  @override
  String get modelRequired =>
      'అనువదించే ముందు మోడల్‌ను డౌన్‌లోడ్ చేయాలి లేదా ఎంచుకోవాలి.';

  @override
  String translationError(String error) {
    return 'అనువాద లోపం: $error';
  }

  @override
  String genericError(String error) {
    return 'లోపం: $error';
  }

  @override
  String get download => 'డౌన్‌లోడ్';

  @override
  String get swapLanguages => 'భాషలను మార్చు';

  @override
  String get clear => 'తొలగించు';

  @override
  String get inputHint => 'వచనాన్ని నమోదు చేయండి...';

  @override
  String get translate => 'అనువదించు';

  @override
  String get copyToClipboard => 'క్లిప్‌బోర్డ్‌కు కాపీ చేయి';

  @override
  String get translationCopied => 'అనువాదం క్లిప్‌బోర్డ్‌కు కాపీ అయింది';

  @override
  String get translating => 'అనువదిస్తోంది...';

  @override
  String get translationPlaceholder => 'అనువాదం ఇక్కడ కనిపిస్తుంది';

  @override
  String get documentTitle => 'పత్ర అనువాదం';

  @override
  String pickFileError(String error) {
    return 'ఫైల్‌ను ఎంచుకోలేకపోయాం: $error';
  }

  @override
  String get chooseSaveFolder => 'సేవ్ ఫోల్డర్‌ను ఎంచుకోండి';

  @override
  String get unsupportedFormat => 'ఈ ఫైల్ ఫార్మాట్‌కు మద్దతు లేదు.';

  @override
  String get documentDone => 'పత్రం విజయవంతంగా అనువదించబడింది!';

  @override
  String get translationCancelled => 'అనువాదం రద్దు చేయబడింది.';

  @override
  String documentError(String error) {
    return 'అనువాద సమయంలో లోపం సంభవించింది: $error';
  }

  @override
  String get tapToPickDocument => 'పత్రాన్ని ఎంచుకోవడానికి తట్టండి';

  @override
  String get saveLocation => 'సేవ్ చేసే స్థానం:';

  @override
  String get change => 'మార్చు…';

  @override
  String get pdfOcrTitle => 'PDF చిత్రాల్లోని వచనాన్ని అనువదించు (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'స్కాన్ చేసిన పేజీలు, రేఖాచిత్రాల కోసం ML Kit OCR';

  @override
  String get sheetNamesShort => 'షీట్ పేర్లను అనువదించు';

  @override
  String get translateDocument => 'పత్రాన్ని అనువదించు';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get preparing => 'అనువాదాన్ని సిద్ధం చేస్తోంది...';

  @override
  String progressLine(int done, int total) {
    return 'వరుస $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'పేరా $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'షేర్ చేసిన వచనం $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'పేజీ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'పేజీ $done/$total – చిత్రాల్లోని వచనాన్ని చదువుతోంది';
  }

  @override
  String get openFile => 'ఫైల్‌ను తెరువు';

  @override
  String get share => 'షేర్ చేయి';

  @override
  String get selectSourceLanguage => 'మూల భాషను ఎంచుకోండి';

  @override
  String get selectTargetLanguage => 'లక్ష్య భాషను ఎంచుకోండి';

  @override
  String get searchLanguage => 'భాషను వెతకండి...';

  @override
  String get detectLanguage => 'భాషను గుర్తించు';

  @override
  String get settingsTitle => 'సెట్టింగ్‌లు';

  @override
  String get aiModel => 'AI మోడల్';

  @override
  String get downloadModel => 'మోడల్‌ను డౌన్‌లోడ్ చేయి (1.05 GB)';

  @override
  String get pickGguf => 'పరికరం నుండి .gguf ఎంచుకోండి';

  @override
  String get cancelDownload => 'డౌన్‌లోడ్ రద్దు చేయి';

  @override
  String get defaultLanguages => 'డిఫాల్ట్ భాషలు';

  @override
  String get defaultSourceLanguage => 'డిఫాల్ట్ మూల భాష';

  @override
  String get defaultTargetLanguage => 'డిఫాల్ట్ లక్ష్య భాష';

  @override
  String get documentsOcr => 'పత్రాలు & OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR మద్దతు';

  @override
  String get pdfOcrSupportDesc =>
      'స్కాన్ చేసిన PDFలు, చిత్రాల్లోని వచనాన్ని అనువదించు';

  @override
  String get sheetNames => 'Excel షీట్ పేర్లను అనువదించు';

  @override
  String get sheetNamesDesc =>
      'స్ప్రెడ్‌షీట్ ట్యాబ్‌ల శీర్షికలను కూడా అనువదిస్తుంది';

  @override
  String get appearance => 'రూపం';

  @override
  String get appTheme => 'యాప్ థీమ్';

  @override
  String get themeSystem => 'సిస్టమ్';

  @override
  String get themeLight => 'లైట్';

  @override
  String get themeDark => 'డార్క్';

  @override
  String get appLanguage => 'యాప్ భాష';

  @override
  String get systemDefault => 'సిస్టమ్ డిఫాల్ట్';

  @override
  String get about => 'గురించి';

  @override
  String get aboutDescription =>
      'పూర్తిగా ఆఫ్‌లైన్‌లో, పరికరంలోనే పనిచేసే AI అనువాద యాప్. Tencent HunYuan MT2 1.8B మోడల్, llama.cpp FFI ఇంజిన్‌తో పనిచేస్తుంది. ఏ వచనం లేదా పత్రం ఇంటర్నెట్‌కు పంపబడదు.';

  @override
  String get modelNotInstalled => 'మోడల్ ఇన్‌స్టాల్ చేయలేదు';

  @override
  String get modelNotDownloaded => 'మోడల్ ఇంకా డౌన్‌లోడ్ కాలేదు';

  @override
  String modelFileNotFound(String path) {
    return 'మోడల్ ఫైల్ కనబడలేదు: $path';
  }

  @override
  String get modelLoading => 'మోడల్‌ను మెమరీలోకి లోడ్ చేస్తోంది...';

  @override
  String get modelReady => 'మోడల్ సిద్ధంగా ఉంది (HunYuan MT2 1.8B ఆఫ్‌లైన్)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ఫైల్‌ను ఎంచుకోవడంలో లోపం: $error';
  }

  @override
  String get downloadStarting => 'డౌన్‌లోడ్ ప్రారంభమవుతోంది...';

  @override
  String get downloadCancelledKept =>
      'డౌన్‌లోడ్ రద్దయింది (పురోగతి భద్రపరచబడింది)';

  @override
  String downloadingPercent(String percent) {
    return 'డౌన్‌లోడ్ అవుతోంది: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 ధృవీకరిస్తోంది...';

  @override
  String get downloadCompleteLoading =>
      'డౌన్‌లోడ్ పూర్తయింది, మోడల్‌ను లోడ్ చేస్తోంది...';

  @override
  String get downloadCancelled => 'డౌన్‌లోడ్ రద్దయింది';

  @override
  String downloadError(String error) {
    return 'డౌన్‌లోడ్ లోపం: $error';
  }

  @override
  String get cancellingDownload => 'డౌన్‌లోడ్‌ను రద్దు చేస్తోంది...';

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
