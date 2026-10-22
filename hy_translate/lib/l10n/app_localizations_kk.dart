// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get navText => 'Мәтін';

  @override
  String get navDocuments => 'Құжаттар';

  @override
  String get navSettings => 'Параметрлер';

  @override
  String get madeBy => '4pp жасаған';

  @override
  String get modelRequired =>
      'Аудармас бұрын модельді жүктеп алу немесе таңдау керек.';

  @override
  String translationError(String error) {
    return 'Аударма қатесі: $error';
  }

  @override
  String genericError(String error) {
    return 'Қате: $error';
  }

  @override
  String get download => 'Жүктеп алу';

  @override
  String get swapLanguages => 'Тілдерді ауыстыру';

  @override
  String get clear => 'Тазалау';

  @override
  String get inputHint => 'Мәтін енгізіңіз...';

  @override
  String get translate => 'Аудару';

  @override
  String get copyToClipboard => 'Буферге көшіру';

  @override
  String get translationCopied => 'Аударма буферге көшірілді';

  @override
  String get translating => 'Аударылуда...';

  @override
  String get translationPlaceholder => 'Аударма осы жерде көрсетіледі';

  @override
  String get documentTitle => 'Құжат аудармасы';

  @override
  String pickFileError(String error) {
    return 'Файлды таңдау мүмкін болмады: $error';
  }

  @override
  String get chooseSaveFolder => 'Сақтау қалтасын таңдаңыз';

  @override
  String get unsupportedFormat => 'Бұл файл пішімі қолдау көрсетілмейді.';

  @override
  String get documentDone => 'Құжат сәтті аударылды!';

  @override
  String get translationCancelled => 'Аударма тоқтатылды.';

  @override
  String documentError(String error) {
    return 'Аудару кезінде қате орын алды: $error';
  }

  @override
  String get tapToPickDocument => 'Құжатты таңдау үшін түртіңіз';

  @override
  String get saveLocation => 'Сақтау орны:';

  @override
  String get change => 'Өзгерту…';

  @override
  String get pdfOcrTitle => 'PDF ішіндегі суреттердегі мәтінді аудару (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'Сканерленген беттер мен диаграммалар үшін ML Kit OCR';

  @override
  String get sheetNamesShort => 'Парақ атауларын аудару';

  @override
  String get translateDocument => 'Құжатты аудару';

  @override
  String get cancel => 'Бас тарту';

  @override
  String get preparing => 'Аударма дайындалуда...';

  @override
  String progressLine(int done, int total) {
    return '$done/$total жол';
  }

  @override
  String progressParagraph(int done, int total) {
    return '$done/$total абзац';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Ортақ мәтін $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return '$done/$total бет';
  }

  @override
  String progressPageOcr(int done, int total) {
    return '$done/$total бет – суреттегі мәтін оқылуда';
  }

  @override
  String get openFile => 'Файлды ашу';

  @override
  String get share => 'Бөлісу';

  @override
  String get selectSourceLanguage => 'Бастапқы тілді таңдаңыз';

  @override
  String get selectTargetLanguage => 'Мақсатты тілді таңдаңыз';

  @override
  String get searchLanguage => 'Тілді іздеу...';

  @override
  String get detectLanguage => 'Тілді анықтау';

  @override
  String get settingsTitle => 'Параметрлер';

  @override
  String get aiModel => 'ЖИ моделі';

  @override
  String get downloadModel => 'Модельді жүктеп алу (1,05 ГБ)';

  @override
  String get pickGguf => 'Құрылғыдан .gguf таңдау';

  @override
  String get cancelDownload => 'Жүктеп алудан бас тарту';

  @override
  String get defaultLanguages => 'Әдепкі тілдер';

  @override
  String get defaultSourceLanguage => 'Әдепкі бастапқы тіл';

  @override
  String get defaultTargetLanguage => 'Әдепкі мақсатты тіл';

  @override
  String get documentsOcr => 'Құжаттар және OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR қолдауы';

  @override
  String get pdfOcrSupportDesc =>
      'Сканерленген PDF мен суреттердегі мәтінді аудару';

  @override
  String get sheetNames => 'Excel парақ атауларын аудару';

  @override
  String get sheetNamesDesc =>
      'Электрондық кесте беттерінің атауларын да аударады';

  @override
  String get appearance => 'Көрінісі';

  @override
  String get appTheme => 'Қолданба тақырыбы';

  @override
  String get themeSystem => 'Жүйелік';

  @override
  String get themeLight => 'Ашық';

  @override
  String get themeDark => 'Қараңғы';

  @override
  String get appLanguage => 'Қолданба тілі';

  @override
  String get systemDefault => 'Жүйенің әдепкісі';

  @override
  String get about => 'Қолданба туралы';

  @override
  String get aboutDescription =>
      'Толық офлайн, құрылғының өзінде жұмыс істейтін ЖИ аударма қолданбасы. Tencent HunYuan MT2 1.8B моделі мен llama.cpp FFI қозғалтқышымен жұмыс істейді. Ешбір мәтін не құжат интернетке жіберілмейді.';

  @override
  String get modelNotInstalled => 'Модель орнатылмаған';

  @override
  String get modelNotDownloaded => 'Модель әлі жүктелмеген';

  @override
  String modelFileNotFound(String path) {
    return 'Модель файлы табылмады: $path';
  }

  @override
  String get modelLoading => 'Модель жадқа жүктелуде...';

  @override
  String get modelReady => 'Модель дайын (HunYuan MT2 1.8B офлайн)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Файлды таңдау кезінде қате: $error';
  }

  @override
  String get downloadStarting => 'Жүктеп алу басталуда...';

  @override
  String get downloadCancelledKept => 'Жүктеп алу тоқтатылды (барысы сақталды)';

  @override
  String downloadingPercent(String percent) {
    return 'Жүктелуде: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 тексерілуде...';

  @override
  String get downloadCompleteLoading =>
      'Жүктеп алу аяқталды, модель жүктелуде...';

  @override
  String get downloadCancelled => 'Жүктеп алу тоқтатылды';

  @override
  String downloadError(String error) {
    return 'Жүктеп алу қатесі: $error';
  }

  @override
  String get cancellingDownload => 'Жүктеп алу тоқтатылуда...';

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
