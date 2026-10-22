// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get navText => 'লেখা';

  @override
  String get navDocuments => 'নথি';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String get madeBy => '4pp দ্বারা তৈরি';

  @override
  String get modelRequired =>
      'অনুবাদ করার আগে মডেলটি ডাউনলোড বা নির্বাচন করতে হবে।';

  @override
  String translationError(String error) {
    return 'অনুবাদে ত্রুটি: $error';
  }

  @override
  String genericError(String error) {
    return 'ত্রুটি: $error';
  }

  @override
  String get download => 'ডাউনলোড';

  @override
  String get swapLanguages => 'ভাষা অদলবদল করুন';

  @override
  String get clear => 'মুছুন';

  @override
  String get inputHint => 'লেখা লিখুন...';

  @override
  String get translate => 'অনুবাদ করুন';

  @override
  String get copyToClipboard => 'ক্লিপবোর্ডে কপি করুন';

  @override
  String get translationCopied => 'অনুবাদ ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get translating => 'অনুবাদ হচ্ছে...';

  @override
  String get translationPlaceholder => 'অনুবাদ এখানে দেখা যাবে';

  @override
  String get documentTitle => 'নথি অনুবাদ';

  @override
  String pickFileError(String error) {
    return 'ফাইল নির্বাচন করা যায়নি: $error';
  }

  @override
  String get chooseSaveFolder => 'সেভ করার ফোল্ডার নির্বাচন করুন';

  @override
  String get unsupportedFormat => 'এই ফাইল ফরম্যাট সমর্থিত নয়।';

  @override
  String get documentDone => 'নথি সফলভাবে অনুবাদ হয়েছে!';

  @override
  String get translationCancelled => 'অনুবাদ বাতিল করা হয়েছে।';

  @override
  String documentError(String error) {
    return 'অনুবাদের সময় একটি ত্রুটি ঘটেছে: $error';
  }

  @override
  String get tapToPickDocument => 'নথি বেছে নিতে ট্যাপ করুন';

  @override
  String get saveLocation => 'সেভ করার স্থান:';

  @override
  String get change => 'পরিবর্তন করুন…';

  @override
  String get pdfOcrTitle => 'PDF-এর ছবির লেখা অনুবাদ করুন (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'স্ক্যান করা পৃষ্ঠা ও ডায়াগ্রামের জন্য ML Kit OCR';

  @override
  String get sheetNamesShort => 'শিটের নাম অনুবাদ করুন';

  @override
  String get translateDocument => 'নথি অনুবাদ করুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get preparing => 'অনুবাদ প্রস্তুত করা হচ্ছে...';

  @override
  String progressLine(int done, int total) {
    return 'লাইন $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'অনুচ্ছেদ $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'শেয়ার করা লেখা $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'পৃষ্ঠা $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'পৃষ্ঠা $done/$total – ছবির লেখা পড়া হচ্ছে';
  }

  @override
  String get openFile => 'ফাইল খুলুন';

  @override
  String get share => 'শেয়ার করুন';

  @override
  String get selectSourceLanguage => 'উৎস ভাষা নির্বাচন করুন';

  @override
  String get selectTargetLanguage => 'লক্ষ্য ভাষা নির্বাচন করুন';

  @override
  String get searchLanguage => 'ভাষা খুঁজুন...';

  @override
  String get detectLanguage => 'ভাষা শনাক্ত করুন';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get aiModel => 'এআই মডেল';

  @override
  String get downloadModel => 'মডেল ডাউনলোড করুন (১.০৫ জিবি)';

  @override
  String get pickGguf => 'ডিভাইস থেকে .gguf বেছে নিন';

  @override
  String get cancelDownload => 'ডাউনলোড বাতিল করুন';

  @override
  String get defaultLanguages => 'ডিফল্ট ভাষা';

  @override
  String get defaultSourceLanguage => 'ডিফল্ট উৎস ভাষা';

  @override
  String get defaultTargetLanguage => 'ডিফল্ট লক্ষ্য ভাষা';

  @override
  String get documentsOcr => 'নথি ও OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR সমর্থন';

  @override
  String get pdfOcrSupportDesc => 'স্ক্যান করা PDF ও ছবির লেখা অনুবাদ করুন';

  @override
  String get sheetNames => 'Excel শিটের নাম অনুবাদ করুন';

  @override
  String get sheetNamesDesc => 'স্প্রেডশিটের ট্যাবের শিরোনামও অনুবাদ করে';

  @override
  String get appearance => 'চেহারা';

  @override
  String get appTheme => 'অ্যাপের থিম';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String get appLanguage => 'অ্যাপের ভাষা';

  @override
  String get systemDefault => 'সিস্টেম ডিফল্ট';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get aboutDescription =>
      'সম্পূর্ণ অফলাইনে ডিভাইসের উপরেই চলা এআই অনুবাদ অ্যাপ। এটি Tencent HunYuan MT2 1.8B মডেল ও llama.cpp FFI ইঞ্জিনে চালিত। কোনো লেখা বা নথি ইন্টারনেটে পাঠানো হয় না।';

  @override
  String get modelNotInstalled => 'মডেল ইনস্টল করা নেই';

  @override
  String get modelNotDownloaded => 'মডেল এখনও ডাউনলোড হয়নি';

  @override
  String modelFileNotFound(String path) {
    return 'মডেল ফাইল পাওয়া যায়নি: $path';
  }

  @override
  String get modelLoading => 'মডেল মেমরিতে লোড করা হচ্ছে...';

  @override
  String get modelReady => 'মডেল প্রস্তুত (HunYuan MT2 1.8B অফলাইন)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ফাইল নির্বাচনের সময় ত্রুটি: $error';
  }

  @override
  String get downloadStarting => 'ডাউনলোড শুরু হচ্ছে...';

  @override
  String get downloadCancelledKept => 'ডাউনলোড বাতিল হয়েছে (অগ্রগতি সংরক্ষিত)';

  @override
  String downloadingPercent(String percent) {
    return 'ডাউনলোড হচ্ছে: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 যাচাই করা হচ্ছে...';

  @override
  String get downloadCompleteLoading => 'ডাউনলোড সম্পন্ন, মডেল লোড হচ্ছে...';

  @override
  String get downloadCancelled => 'ডাউনলোড বাতিল হয়েছে';

  @override
  String downloadError(String error) {
    return 'ডাউনলোডে ত্রুটি: $error';
  }

  @override
  String get cancellingDownload => 'ডাউনলোড বাতিল করা হচ্ছে...';

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
