// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get navText => 'متن';

  @override
  String get navDocuments => 'دستاویزات';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String get madeBy => '4pp کی طرف سے تیار کردہ';

  @override
  String get modelRequired =>
      'ترجمہ کرنے سے پہلے ماڈل ڈاؤن لوڈ یا منتخب کرنا ضروری ہے۔';

  @override
  String translationError(String error) {
    return 'ترجمے کی خرابی: $error';
  }

  @override
  String genericError(String error) {
    return 'خرابی: $error';
  }

  @override
  String get download => 'ڈاؤن لوڈ';

  @override
  String get swapLanguages => 'زبانیں بدلیں';

  @override
  String get clear => 'صاف کریں';

  @override
  String get inputHint => 'متن درج کریں...';

  @override
  String get translate => 'ترجمہ کریں';

  @override
  String get copyToClipboard => 'کلپ بورڈ پر کاپی کریں';

  @override
  String get translationCopied => 'ترجمہ کلپ بورڈ پر کاپی ہو گیا';

  @override
  String get translating => 'ترجمہ ہو رہا ہے...';

  @override
  String get translationPlaceholder => 'ترجمہ یہاں ظاہر ہوگا';

  @override
  String get documentTitle => 'دستاویز کا ترجمہ';

  @override
  String pickFileError(String error) {
    return 'فائل منتخب نہیں ہو سکی: $error';
  }

  @override
  String get chooseSaveFolder => 'محفوظ کرنے کا فولڈر منتخب کریں';

  @override
  String get unsupportedFormat => 'یہ فائل فارمیٹ تعاون یافتہ نہیں ہے۔';

  @override
  String get documentDone => 'دستاویز کا ترجمہ کامیابی سے ہو گیا!';

  @override
  String get translationCancelled => 'ترجمہ منسوخ کر دیا گیا۔';

  @override
  String documentError(String error) {
    return 'ترجمے کے دوران خرابی پیش آئی: $error';
  }

  @override
  String get tapToPickDocument => 'دستاویز منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String get saveLocation => 'محفوظ کرنے کی جگہ:';

  @override
  String get change => 'تبدیل کریں…';

  @override
  String get pdfOcrTitle => 'PDF کی تصاویر میں موجود متن کا ترجمہ کریں (OCR)';

  @override
  String get pdfOcrSubtitle => 'اسکین شدہ صفحات اور خاکوں کے لیے ML Kit OCR';

  @override
  String get sheetNamesShort => 'شیٹ کے نام کا ترجمہ کریں';

  @override
  String get translateDocument => 'دستاویز کا ترجمہ کریں';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get preparing => 'ترجمہ تیار کیا جا رہا ہے...';

  @override
  String progressLine(int done, int total) {
    return 'سطر $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'پیراگراف $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'مشترکہ متن $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'صفحہ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'صفحہ $done/$total – تصاویر میں متن پڑھا جا رہا ہے';
  }

  @override
  String get openFile => 'فائل کھولیں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get selectSourceLanguage => 'ماخذ زبان منتخب کریں';

  @override
  String get selectTargetLanguage => 'ہدفی زبان منتخب کریں';

  @override
  String get searchLanguage => 'زبان تلاش کریں...';

  @override
  String get detectLanguage => 'زبان کی شناخت کریں';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get aiModel => 'اے آئی ماڈل';

  @override
  String get downloadModel => 'ماڈل ڈاؤن لوڈ کریں (1.05 جی بی)';

  @override
  String get pickGguf => 'آلے سے .gguf منتخب کریں';

  @override
  String get cancelDownload => 'ڈاؤن لوڈ منسوخ کریں';

  @override
  String get defaultLanguages => 'ڈیفالٹ زبانیں';

  @override
  String get defaultSourceLanguage => 'ڈیفالٹ ماخذ زبان';

  @override
  String get defaultTargetLanguage => 'ڈیفالٹ ہدفی زبان';

  @override
  String get documentsOcr => 'دستاویزات اور OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR کی معاونت';

  @override
  String get pdfOcrSupportDesc =>
      'اسکین شدہ PDF اور تصاویر میں موجود متن کا ترجمہ کریں';

  @override
  String get sheetNames => 'Excel شیٹ کے ناموں کا ترجمہ کریں';

  @override
  String get sheetNamesDesc => 'اسپریڈشیٹ ٹیبز کے عنوانات کا بھی ترجمہ کرتا ہے';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get appTheme => 'ایپ تھیم';

  @override
  String get themeSystem => 'سسٹم';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تاریک';

  @override
  String get appLanguage => 'ایپ کی زبان';

  @override
  String get systemDefault => 'سسٹم ڈیفالٹ';

  @override
  String get about => 'تعارف';

  @override
  String get aboutDescription =>
      'مکمل طور پر آف لائن، آلے پر چلنے والی اے آئی ترجمہ ایپ۔ یہ Tencent HunYuan MT2 1.8B ماڈل اور llama.cpp FFI انجن سے چلتی ہے۔ کوئی متن یا دستاویز انٹرنیٹ پر نہیں بھیجی جاتی۔';

  @override
  String get modelNotInstalled => 'ماڈل انسٹال نہیں ہے';

  @override
  String get modelNotDownloaded => 'ماڈل ابھی تک ڈاؤن لوڈ نہیں ہوا';

  @override
  String modelFileNotFound(String path) {
    return 'ماڈل فائل نہیں ملی: $path';
  }

  @override
  String get modelLoading => 'ماڈل میموری میں لوڈ ہو رہا ہے...';

  @override
  String get modelReady => 'ماڈل تیار ہے (HunYuan MT2 1.8B آف لائن)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'فائل منتخب کرتے وقت خرابی: $error';
  }

  @override
  String get downloadStarting => 'ڈاؤن لوڈ شروع ہو رہا ہے...';

  @override
  String get downloadCancelledKept =>
      'ڈاؤن لوڈ منسوخ کر دیا گیا (پیش رفت محفوظ ہے)';

  @override
  String downloadingPercent(String percent) {
    return 'ڈاؤن لوڈ ہو رہا ہے: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 کی تصدیق ہو رہی ہے...';

  @override
  String get downloadCompleteLoading => 'ڈاؤن لوڈ مکمل، ماڈل لوڈ ہو رہا ہے...';

  @override
  String get downloadCancelled => 'ڈاؤن لوڈ منسوخ کر دیا گیا';

  @override
  String downloadError(String error) {
    return 'ڈاؤن لوڈ میں خرابی: $error';
  }

  @override
  String get cancellingDownload => 'ڈاؤن لوڈ منسوخ کیا جا رہا ہے...';

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
