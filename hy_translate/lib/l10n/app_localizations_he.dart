// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get navText => 'טקסט';

  @override
  String get navDocuments => 'מסמכים';

  @override
  String get navSettings => 'הגדרות';

  @override
  String get madeBy => 'נוצר על ידי 4pp';

  @override
  String get modelRequired => 'יש להוריד או לבחור את המודל לפני התרגום.';

  @override
  String translationError(String error) {
    return 'שגיאת תרגום: $error';
  }

  @override
  String genericError(String error) {
    return 'שגיאה: $error';
  }

  @override
  String get download => 'הורדה';

  @override
  String get swapLanguages => 'החלפת שפות';

  @override
  String get clear => 'ניקוי';

  @override
  String get inputHint => 'הקלידו טקסט...';

  @override
  String get translate => 'תרגום';

  @override
  String get copyToClipboard => 'העתקה ללוח';

  @override
  String get translationCopied => 'התרגום הועתק ללוח';

  @override
  String get translating => 'מתרגם...';

  @override
  String get translationPlaceholder => 'התרגום יופיע כאן';

  @override
  String get documentTitle => 'תרגום מסמכים';

  @override
  String pickFileError(String error) {
    return 'לא ניתן היה לבחור את הקובץ: $error';
  }

  @override
  String get chooseSaveFolder => 'בחרו תיקיית שמירה';

  @override
  String get unsupportedFormat => 'פורמט הקובץ הזה אינו נתמך.';

  @override
  String get documentDone => 'המסמך תורגם בהצלחה!';

  @override
  String get translationCancelled => 'התרגום בוטל.';

  @override
  String documentError(String error) {
    return 'אירעה שגיאה במהלך התרגום: $error';
  }

  @override
  String get tapToPickDocument => 'הקישו כדי לבחור מסמך';

  @override
  String get saveLocation => 'מיקום שמירה:';

  @override
  String get change => 'שינוי…';

  @override
  String get pdfOcrTitle => 'תרגום טקסט בתמונות בתוך PDF‏ (OCR)';

  @override
  String get pdfOcrSubtitle => '‏ML Kit OCR לעמודים סרוקים ותרשימים';

  @override
  String get sheetNamesShort => 'תרגום שמות גיליונות';

  @override
  String get translateDocument => 'תרגום המסמך';

  @override
  String get cancel => 'ביטול';

  @override
  String get preparing => 'מכין את התרגום...';

  @override
  String progressLine(int done, int total) {
    return 'שורה $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'פסקה $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'טקסט משותף $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'עמוד $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'עמוד $done/$total – קורא טקסט בתמונות';
  }

  @override
  String get openFile => 'פתיחת הקובץ';

  @override
  String get share => 'שיתוף';

  @override
  String get selectSourceLanguage => 'בחרו שפת מקור';

  @override
  String get selectTargetLanguage => 'בחרו שפת יעד';

  @override
  String get searchLanguage => 'חיפוש שפה...';

  @override
  String get detectLanguage => 'זיהוי שפה';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get aiModel => 'מודל בינה מלאכותית';

  @override
  String get downloadModel => 'הורדת המודל (‏1.05 GB)';

  @override
  String get pickGguf => 'בחירת קובץ ‎.gguf מהמכשיר';

  @override
  String get cancelDownload => 'ביטול ההורדה';

  @override
  String get defaultLanguages => 'שפות ברירת מחדל';

  @override
  String get defaultSourceLanguage => 'שפת מקור כברירת מחדל';

  @override
  String get defaultTargetLanguage => 'שפת יעד כברירת מחדל';

  @override
  String get documentsOcr => 'מסמכים ו-OCR';

  @override
  String get pdfOcrSupport => 'תמיכה ב-OCR ל-PDF';

  @override
  String get pdfOcrSupportDesc => 'תרגום טקסט ב-PDF סרוקים ובתמונות';

  @override
  String get sheetNames => 'תרגום שמות גיליונות של Excel';

  @override
  String get sheetNamesDesc => 'מתרגם גם את כותרות הלשוניות בגיליון האלקטרוני';

  @override
  String get appearance => 'מראה';

  @override
  String get appTheme => 'ערכת נושא של האפליקציה';

  @override
  String get themeSystem => 'מערכת';

  @override
  String get themeLight => 'בהירה';

  @override
  String get themeDark => 'כהה';

  @override
  String get appLanguage => 'שפת האפליקציה';

  @override
  String get systemDefault => 'ברירת מחדל של המערכת';

  @override
  String get about => 'אודות';

  @override
  String get aboutDescription =>
      'אפליקציית תרגום מבוססת בינה מלאכותית שפועלת במלואה במצב לא מקוון ישירות במכשיר. מופעלת על ידי המודל Tencent HunYuan MT2 1.8B ומנוע llama.cpp FFI. אף טקסט או מסמך לא נשלחים לאינטרנט.';

  @override
  String get modelNotInstalled => 'המודל לא מותקן';

  @override
  String get modelNotDownloaded => 'המודל עדיין לא הורד';

  @override
  String modelFileNotFound(String path) {
    return 'קובץ המודל לא נמצא: $path';
  }

  @override
  String get modelLoading => 'טוען את המודל לזיכרון...';

  @override
  String get modelReady => 'המודל מוכן (HunYuan MT2 1.8B לא מקוון)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'שגיאה בבחירת הקובץ: $error';
  }

  @override
  String get downloadStarting => 'מתחיל בהורדה...';

  @override
  String get downloadCancelledKept => 'ההורדה בוטלה (ההתקדמות נשמרה)';

  @override
  String downloadingPercent(String percent) {
    return 'מוריד: $percent%';
  }

  @override
  String get verifyingSha => 'מאמת SHA256...';

  @override
  String get downloadCompleteLoading => 'ההורדה הושלמה, טוען את המודל...';

  @override
  String get downloadCancelled => 'ההורדה בוטלה';

  @override
  String downloadError(String error) {
    return 'שגיאת הורדה: $error';
  }

  @override
  String get cancellingDownload => 'מבטל את ההורדה...';

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
