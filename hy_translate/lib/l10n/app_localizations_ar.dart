// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get navText => 'نص';

  @override
  String get navDocuments => 'المستندات';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get madeBy => 'من تطوير 4pp';

  @override
  String get modelRequired => 'يجب تنزيل النموذج أو اختياره قبل الترجمة.';

  @override
  String translationError(String error) {
    return 'خطأ في الترجمة: $error';
  }

  @override
  String genericError(String error) {
    return 'خطأ: $error';
  }

  @override
  String get download => 'تنزيل';

  @override
  String get swapLanguages => 'تبديل اللغتين';

  @override
  String get clear => 'مسح';

  @override
  String get inputHint => 'أدخل النص...';

  @override
  String get translate => 'ترجمة';

  @override
  String get copyToClipboard => 'نسخ إلى الحافظة';

  @override
  String get translationCopied => 'تم نسخ الترجمة إلى الحافظة';

  @override
  String get translating => 'جارٍ الترجمة...';

  @override
  String get translationPlaceholder => 'ستظهر الترجمة هنا';

  @override
  String get documentTitle => 'ترجمة المستندات';

  @override
  String pickFileError(String error) {
    return 'تعذّر اختيار الملف: $error';
  }

  @override
  String get chooseSaveFolder => 'اختر مجلد الحفظ';

  @override
  String get unsupportedFormat => 'تنسيق هذا الملف غير مدعوم.';

  @override
  String get documentDone => 'تمت ترجمة المستند بنجاح!';

  @override
  String get translationCancelled => 'تم إلغاء الترجمة.';

  @override
  String documentError(String error) {
    return 'حدث خطأ أثناء الترجمة: $error';
  }

  @override
  String get tapToPickDocument => 'انقر لاختيار مستند';

  @override
  String get saveLocation => 'موقع الحفظ:';

  @override
  String get change => 'تغيير…';

  @override
  String get pdfOcrTitle => 'ترجمة النص داخل صور ملف PDF (OCR)';

  @override
  String get pdfOcrSubtitle => '‏ML Kit OCR للصفحات الممسوحة ضوئيًا والمخططات';

  @override
  String get sheetNamesShort => 'ترجمة أسماء الأوراق';

  @override
  String get translateDocument => 'ترجمة المستند';

  @override
  String get cancel => 'إلغاء';

  @override
  String get preparing => 'جارٍ تحضير الترجمة...';

  @override
  String progressLine(int done, int total) {
    return 'السطر $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'الفقرة $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'النص المشترك $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'الصفحة $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'الصفحة $done/$total – قراءة النص داخل الصور';
  }

  @override
  String get openFile => 'فتح الملف';

  @override
  String get share => 'مشاركة';

  @override
  String get selectSourceLanguage => 'اختر لغة المصدر';

  @override
  String get selectTargetLanguage => 'اختر لغة الهدف';

  @override
  String get searchLanguage => 'ابحث عن لغة...';

  @override
  String get detectLanguage => 'اكتشاف اللغة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get aiModel => 'نموذج الذكاء الاصطناعي';

  @override
  String get downloadModel => 'تنزيل النموذج (1.05 غيغابايت)';

  @override
  String get pickGguf => 'اختيار ملف .gguf من الجهاز';

  @override
  String get cancelDownload => 'إلغاء التنزيل';

  @override
  String get defaultLanguages => 'اللغات الافتراضية';

  @override
  String get defaultSourceLanguage => 'لغة المصدر الافتراضية';

  @override
  String get defaultTargetLanguage => 'لغة الهدف الافتراضية';

  @override
  String get documentsOcr => 'المستندات والتعرّف الضوئي (OCR)';

  @override
  String get pdfOcrSupport => 'دعم OCR لملفات PDF';

  @override
  String get pdfOcrSupportDesc =>
      'ترجمة النص في ملفات PDF الممسوحة ضوئيًا والصور';

  @override
  String get sheetNames => 'ترجمة أسماء أوراق Excel';

  @override
  String get sheetNamesDesc => 'يترجم أيضًا عناوين علامات تبويب جدول البيانات';

  @override
  String get appearance => 'المظهر';

  @override
  String get appTheme => 'سمة التطبيق';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get appLanguage => 'لغة التطبيق';

  @override
  String get systemDefault => 'افتراضي النظام';

  @override
  String get about => 'حول';

  @override
  String get aboutDescription =>
      'تطبيق ترجمة بالذكاء الاصطناعي يعمل بالكامل دون اتصال وعلى الجهاز نفسه. مدعوم بنموذج Tencent HunYuan MT2 1.8B ومحرك llama.cpp FFI. لا يُرسَل أي نص أو مستند إلى الإنترنت.';

  @override
  String get modelNotInstalled => 'النموذج غير مثبّت';

  @override
  String get modelNotDownloaded => 'لم يتم تنزيل النموذج بعد';

  @override
  String modelFileNotFound(String path) {
    return 'ملف النموذج غير موجود: $path';
  }

  @override
  String get modelLoading => 'جارٍ تحميل النموذج في الذاكرة...';

  @override
  String get modelReady => 'النموذج جاهز (HunYuan MT2 1.8B دون اتصال)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'خطأ أثناء اختيار الملف: $error';
  }

  @override
  String get downloadStarting => 'جارٍ بدء التنزيل...';

  @override
  String get downloadCancelledKept => 'تم إلغاء التنزيل (تم حفظ التقدّم)';

  @override
  String downloadingPercent(String percent) {
    return 'جارٍ التنزيل: $percent%';
  }

  @override
  String get verifyingSha => 'جارٍ التحقق من SHA256...';

  @override
  String get downloadCompleteLoading => 'اكتمل التنزيل، جارٍ تحميل النموذج...';

  @override
  String get downloadCancelled => 'تم إلغاء التنزيل';

  @override
  String downloadError(String error) {
    return 'خطأ في التنزيل: $error';
  }

  @override
  String get cancellingDownload => 'جارٍ إلغاء التنزيل...';

  @override
  String get onboardingHeadline => 'ترجمة بدون إنترنت';

  @override
  String get onboardingBenefitOffline =>
      'يعمل بدون اتصال بالإنترنت تمامًا بعد الإعداد';

  @override
  String get onboardingBenefitPrivate => 'خاص وآمن، لا تخرج أي بيانات من جهازك';

  @override
  String get onboardingBenefitFormats => 'ترجمة النصوص والمستندات';

  @override
  String onboardingSizeNote(String size) {
    return 'تنزيل لمرة واحدة: حوالي $size غ.ب. يُوصى باستخدام Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'تنزيل النموذج';

  @override
  String get onboardingBackgroundNote =>
      'يمكنك مغادرة التطبيق، وسيتم استئناف التنزيل من حيث توقف.';

  @override
  String get onboardingTryAgain => 'إعادة المحاولة';

  @override
  String get onboardingHaveGguf => 'لدي ملف .gguf بالفعل';

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
