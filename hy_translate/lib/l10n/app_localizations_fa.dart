// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get navText => 'متن';

  @override
  String get navDocuments => 'اسناد';

  @override
  String get navSettings => 'تنظیمات';

  @override
  String get madeBy => 'ساخته‌شده توسط 4pp';

  @override
  String get modelRequired => 'پیش از ترجمه باید مدل را دانلود یا انتخاب کنید.';

  @override
  String translationError(String error) {
    return 'خطای ترجمه: $error';
  }

  @override
  String genericError(String error) {
    return 'خطا: $error';
  }

  @override
  String get download => 'دانلود';

  @override
  String get swapLanguages => 'جابه‌جایی زبان‌ها';

  @override
  String get clear => 'پاک کردن';

  @override
  String get inputHint => 'متن را وارد کنید...';

  @override
  String get translate => 'ترجمه';

  @override
  String get copyToClipboard => 'کپی در کلیپ‌بورد';

  @override
  String get translationCopied => 'ترجمه در کلیپ‌بورد کپی شد';

  @override
  String get translating => 'در حال ترجمه...';

  @override
  String get translationPlaceholder => 'ترجمه اینجا نمایش داده می‌شود';

  @override
  String get documentTitle => 'ترجمهٔ سند';

  @override
  String pickFileError(String error) {
    return 'انتخاب فایل ممکن نشد: $error';
  }

  @override
  String get chooseSaveFolder => 'پوشهٔ ذخیره را انتخاب کنید';

  @override
  String get unsupportedFormat => 'این قالب فایل پشتیبانی نمی‌شود.';

  @override
  String get documentDone => 'سند با موفقیت ترجمه شد!';

  @override
  String get translationCancelled => 'ترجمه لغو شد.';

  @override
  String documentError(String error) {
    return 'هنگام ترجمه خطایی رخ داد: $error';
  }

  @override
  String get tapToPickDocument => 'برای انتخاب سند ضربه بزنید';

  @override
  String get saveLocation => 'محل ذخیره:';

  @override
  String get change => 'تغییر…';

  @override
  String get pdfOcrTitle => 'ترجمهٔ متن تصاویر داخل PDF (OCR)';

  @override
  String get pdfOcrSubtitle => '‏ML Kit OCR برای صفحه‌های اسکن‌شده و نمودارها';

  @override
  String get sheetNamesShort => 'ترجمهٔ نام برگه‌ها';

  @override
  String get translateDocument => 'ترجمهٔ سند';

  @override
  String get cancel => 'لغو';

  @override
  String get preparing => 'در حال آماده‌سازی ترجمه...';

  @override
  String progressLine(int done, int total) {
    return 'خط $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'بند $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'متن مشترک $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'صفحه $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'صفحه $done/$total – در حال خواندن متن تصاویر';
  }

  @override
  String get openFile => 'باز کردن فایل';

  @override
  String get share => 'هم‌رسانی';

  @override
  String get selectSourceLanguage => 'زبان مبدأ را انتخاب کنید';

  @override
  String get selectTargetLanguage => 'زبان مقصد را انتخاب کنید';

  @override
  String get searchLanguage => 'جستجوی زبان...';

  @override
  String get detectLanguage => 'تشخیص زبان';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get aiModel => 'مدل هوش مصنوعی';

  @override
  String get downloadModel => 'دانلود مدل (۱٫۰۵ گیگابایت)';

  @override
  String get pickGguf => 'انتخاب فایل .gguf از دستگاه';

  @override
  String get cancelDownload => 'لغو دانلود';

  @override
  String get defaultLanguages => 'زبان‌های پیش‌فرض';

  @override
  String get defaultSourceLanguage => 'زبان مبدأ پیش‌فرض';

  @override
  String get defaultTargetLanguage => 'زبان مقصد پیش‌فرض';

  @override
  String get documentsOcr => 'اسناد و OCR';

  @override
  String get pdfOcrSupport => 'پشتیبانی از OCR در PDF';

  @override
  String get pdfOcrSupportDesc => 'ترجمهٔ متن در PDFهای اسکن‌شده و تصاویر';

  @override
  String get sheetNames => 'ترجمهٔ نام برگه‌های اکسل';

  @override
  String get sheetNamesDesc => 'عنوان زبانه‌های صفحه‌گسترده را هم ترجمه می‌کند';

  @override
  String get appearance => 'ظاهر';

  @override
  String get appTheme => 'پوستهٔ برنامه';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تیره';

  @override
  String get appLanguage => 'زبان برنامه';

  @override
  String get systemDefault => 'پیش‌فرض سیستم';

  @override
  String get about => 'دربارهٔ برنامه';

  @override
  String get aboutDescription =>
      'برنامهٔ ترجمهٔ هوش مصنوعی که کاملاً آفلاین و روی خود دستگاه اجرا می‌شود. با مدل Tencent HunYuan MT2 1.8B و موتور llama.cpp FFI کار می‌کند. هیچ متن یا سندی به اینترنت ارسال نمی‌شود.';

  @override
  String get modelNotInstalled => 'مدل نصب نشده است';

  @override
  String get modelNotDownloaded => 'مدل هنوز دانلود نشده است';

  @override
  String modelFileNotFound(String path) {
    return 'فایل مدل پیدا نشد: $path';
  }

  @override
  String get modelLoading => 'در حال بارگذاری مدل در حافظه...';

  @override
  String get modelReady => 'مدل آماده است (HunYuan MT2 1.8B آفلاین)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'خطا در انتخاب فایل: $error';
  }

  @override
  String get downloadStarting => 'در حال شروع دانلود...';

  @override
  String get downloadCancelledKept => 'دانلود لغو شد (پیشرفت ذخیره شد)';

  @override
  String downloadingPercent(String percent) {
    return 'در حال دانلود: $percent٪';
  }

  @override
  String get verifyingSha => 'در حال بررسی SHA256...';

  @override
  String get downloadCompleteLoading =>
      'دانلود کامل شد، در حال بارگذاری مدل...';

  @override
  String get downloadCancelled => 'دانلود لغو شد';

  @override
  String downloadError(String error) {
    return 'خطای دانلود: $error';
  }

  @override
  String get cancellingDownload => 'در حال لغو دانلود...';

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
