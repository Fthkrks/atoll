// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get navText => 'Текст';

  @override
  String get navDocuments => 'Баримтууд';

  @override
  String get navSettings => 'Тохиргоо';

  @override
  String get madeBy => '4pp бүтээсэн';

  @override
  String get modelRequired =>
      'Орчуулахын өмнө загварыг татаж авах эсвэл сонгох шаардлагатай.';

  @override
  String translationError(String error) {
    return 'Орчуулгын алдаа: $error';
  }

  @override
  String genericError(String error) {
    return 'Алдаа: $error';
  }

  @override
  String get download => 'Татах';

  @override
  String get swapLanguages => 'Хэлүүдийг солих';

  @override
  String get clear => 'Цэвэрлэх';

  @override
  String get inputHint => 'Текст оруулна уу...';

  @override
  String get translate => 'Орчуулах';

  @override
  String get copyToClipboard => 'Түр санах ойд хуулах';

  @override
  String get translationCopied => 'Орчуулгыг түр санах ойд хууллаа';

  @override
  String get translating => 'Орчуулж байна...';

  @override
  String get translationPlaceholder => 'Орчуулга энд харагдана';

  @override
  String get documentTitle => 'Баримтын орчуулга';

  @override
  String pickFileError(String error) {
    return 'Файл сонгож чадсангүй: $error';
  }

  @override
  String get chooseSaveFolder => 'Хадгалах хавтсаа сонгоно уу';

  @override
  String get unsupportedFormat => 'Энэ файлын формат дэмжигдэхгүй байна.';

  @override
  String get documentDone => 'Баримтыг амжилттай орчууллаа!';

  @override
  String get translationCancelled => 'Орчуулгыг цуцаллаа.';

  @override
  String documentError(String error) {
    return 'Орчуулах явцад алдаа гарлаа: $error';
  }

  @override
  String get tapToPickDocument => 'Баримт сонгохын тулд товшино уу';

  @override
  String get saveLocation => 'Хадгалах байршил:';

  @override
  String get change => 'Өөрчлөх…';

  @override
  String get pdfOcrTitle => 'PDF доторх зургийн текстийг орчуулах (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'Сканнердсан хуудас болон диаграмд зориулсан ML Kit OCR';

  @override
  String get sheetNamesShort => 'Хүснэгтийн хуудасны нэрийг орчуулах';

  @override
  String get translateDocument => 'Баримтыг орчуулах';

  @override
  String get cancel => 'Цуцлах';

  @override
  String get preparing => 'Орчуулгыг бэлтгэж байна...';

  @override
  String progressLine(int done, int total) {
    return 'Мөр $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Догол мөр $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Хуваалцсан текст $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Хуудас $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Хуудас $done/$total – зураг доторх текстийг уншиж байна';
  }

  @override
  String get openFile => 'Файл нээх';

  @override
  String get share => 'Хуваалцах';

  @override
  String get selectSourceLanguage => 'Эх хэлээ сонгоно уу';

  @override
  String get selectTargetLanguage => 'Зорилтот хэлээ сонгоно уу';

  @override
  String get searchLanguage => 'Хэл хайх...';

  @override
  String get detectLanguage => 'Хэл илрүүлэх';

  @override
  String get settingsTitle => 'Тохиргоо';

  @override
  String get aiModel => 'AI загвар';

  @override
  String get downloadModel => 'Загварыг татах (1.05 GB)';

  @override
  String get pickGguf => 'Төхөөрөмжөөс .gguf сонгох';

  @override
  String get cancelDownload => 'Татаж авахыг цуцлах';

  @override
  String get defaultLanguages => 'Өгөгдмөл хэлүүд';

  @override
  String get defaultSourceLanguage => 'Өгөгдмөл эх хэл';

  @override
  String get defaultTargetLanguage => 'Өгөгдмөл зорилтот хэл';

  @override
  String get documentsOcr => 'Баримт ба OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR дэмжлэг';

  @override
  String get pdfOcrSupportDesc =>
      'Сканнердсан PDF болон зургийн текстийг орчуулах';

  @override
  String get sheetNames => 'Excel хуудасны нэрийг орчуулах';

  @override
  String get sheetNamesDesc => 'Хүснэгтийн табын гарчгийг мөн орчуулна';

  @override
  String get appearance => 'Харагдац';

  @override
  String get appTheme => 'Аппын загвар';

  @override
  String get themeSystem => 'Систем';

  @override
  String get themeLight => 'Цайвар';

  @override
  String get themeDark => 'Бараан';

  @override
  String get appLanguage => 'Аппын хэл';

  @override
  String get systemDefault => 'Системийн өгөгдмөл';

  @override
  String get about => 'Тухай';

  @override
  String get aboutDescription =>
      'Бүрэн офлайн, төхөөрөмж дээрээ ажилладаг AI орчуулгын апп. Tencent HunYuan MT2 1.8B загвар болон llama.cpp FFI хөдөлгүүрээр ажилладаг. Ямар ч текст эсвэл баримт интернэтэд илгээгдэхгүй.';

  @override
  String get modelNotInstalled => 'Загвар суулгаагүй байна';

  @override
  String get modelNotDownloaded => 'Загварыг хараахан татаагүй байна';

  @override
  String modelFileNotFound(String path) {
    return 'Загварын файл олдсонгүй: $path';
  }

  @override
  String get modelLoading => 'Загварыг санах ойд ачаалж байна...';

  @override
  String get modelReady => 'Загвар бэлэн (HunYuan MT2 1.8B офлайн)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Файл сонгох үед алдаа гарлаа: $error';
  }

  @override
  String get downloadStarting => 'Татаж эхэлж байна...';

  @override
  String get downloadCancelledKept =>
      'Татаж авахыг цуцаллаа (явц хадгалагдсан)';

  @override
  String downloadingPercent(String percent) {
    return 'Татаж байна: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 шалгаж байна...';

  @override
  String get downloadCompleteLoading =>
      'Татаж дууслаа, загварыг ачаалж байна...';

  @override
  String get downloadCancelled => 'Татаж авахыг цуцаллаа';

  @override
  String downloadError(String error) {
    return 'Татах үеийн алдаа: $error';
  }

  @override
  String get cancellingDownload => 'Татаж авахыг цуцалж байна...';

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
