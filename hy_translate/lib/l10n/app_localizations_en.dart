// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navText => 'Text';

  @override
  String get navDocuments => 'Documents';

  @override
  String get navSettings => 'Settings';

  @override
  String get madeBy => 'Made by 4pp';

  @override
  String get modelRequired =>
      'The model needs to be downloaded or selected before translating.';

  @override
  String translationError(String error) {
    return 'Translation error: $error';
  }

  @override
  String genericError(String error) {
    return 'Error: $error';
  }

  @override
  String get download => 'Download';

  @override
  String get swapLanguages => 'Swap languages';

  @override
  String get clear => 'Clear';

  @override
  String get inputHint => 'Enter text...';

  @override
  String get translate => 'Translate';

  @override
  String get copyToClipboard => 'Copy to clipboard';

  @override
  String get translationCopied => 'Translation copied to clipboard';

  @override
  String get translating => 'Translating...';

  @override
  String get translationPlaceholder => 'The translation will appear here';

  @override
  String get documentTitle => 'Document translation';

  @override
  String pickFileError(String error) {
    return 'Could not pick the file: $error';
  }

  @override
  String get chooseSaveFolder => 'Choose save folder';

  @override
  String get unsupportedFormat => 'This file format is not supported.';

  @override
  String get documentDone => 'Document translated successfully!';

  @override
  String get translationCancelled => 'Translation cancelled.';

  @override
  String documentError(String error) {
    return 'An error occurred during translation: $error';
  }

  @override
  String get tapToPickDocument => 'Tap to choose a document';

  @override
  String get saveLocation => 'Save location:';

  @override
  String get change => 'Change…';

  @override
  String get pdfOcrTitle => 'Translate text in PDF images (OCR)';

  @override
  String get pdfOcrSubtitle => 'ML Kit OCR for scanned pages and diagrams';

  @override
  String get sheetNamesShort => 'Translate sheet names';

  @override
  String get translateDocument => 'Translate document';

  @override
  String get cancel => 'Cancel';

  @override
  String get preparing => 'Preparing translation...';

  @override
  String progressLine(int done, int total) {
    return 'Line $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Paragraph $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Shared text $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Page $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Page $done/$total – reading text in images';
  }

  @override
  String get openFile => 'Open file';

  @override
  String get share => 'Share';

  @override
  String get selectSourceLanguage => 'Choose source language';

  @override
  String get selectTargetLanguage => 'Choose target language';

  @override
  String get searchLanguage => 'Search language...';

  @override
  String get detectLanguage => 'Detect language';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get aiModel => 'AI model';

  @override
  String get downloadModel => 'Download model (1.05 GB)';

  @override
  String get pickGguf => 'Choose .gguf from device';

  @override
  String get cancelDownload => 'Cancel download';

  @override
  String get defaultLanguages => 'Default languages';

  @override
  String get defaultSourceLanguage => 'Default source language';

  @override
  String get defaultTargetLanguage => 'Default target language';

  @override
  String get documentsOcr => 'Documents & OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR support';

  @override
  String get pdfOcrSupportDesc => 'Translate text in scanned PDFs and images';

  @override
  String get sheetNames => 'Translate Excel sheet names';

  @override
  String get sheetNamesDesc => 'Also translates the titles of spreadsheet tabs';

  @override
  String get appearance => 'Appearance';

  @override
  String get appTheme => 'App theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get appLanguage => 'App language';

  @override
  String get systemDefault => 'System default';

  @override
  String get about => 'About';

  @override
  String get aboutDescription =>
      'Fully offline, on-device AI translation app. Powered by the Tencent HunYuan MT2 1.8B model and the llama.cpp FFI engine. No text or document is ever sent to the internet.';

  @override
  String get modelNotInstalled => 'Model not installed';

  @override
  String get modelNotDownloaded => 'Model not downloaded yet';

  @override
  String modelFileNotFound(String path) {
    return 'Model file not found: $path';
  }

  @override
  String get modelLoading => 'Loading model into memory...';

  @override
  String get modelReady => 'Model ready (HunYuan MT2 1.8B Offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Error while picking the file: $error';
  }

  @override
  String get downloadStarting => 'Starting download...';

  @override
  String get downloadCancelledKept => 'Download cancelled (progress kept)';

  @override
  String downloadingPercent(String percent) {
    return 'Downloading: $percent%';
  }

  @override
  String get verifyingSha => 'Verifying SHA256...';

  @override
  String get downloadCompleteLoading => 'Download complete, loading model...';

  @override
  String get downloadCancelled => 'Download cancelled';

  @override
  String downloadError(String error) {
    return 'Download error: $error';
  }

  @override
  String get cancellingDownload => 'Cancelling download...';

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
