// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get navText => 'Teksto';

  @override
  String get navDocuments => 'Mga Dokumento';

  @override
  String get navSettings => 'Mga Setting';

  @override
  String get madeBy => 'Gawa ng 4pp';

  @override
  String get modelRequired =>
      'Kailangang i-download o piliin ang model bago magsalin.';

  @override
  String translationError(String error) {
    return 'Error sa pagsasalin: $error';
  }

  @override
  String genericError(String error) {
    return 'Error: $error';
  }

  @override
  String get download => 'I-download';

  @override
  String get swapLanguages => 'Ipagpalit ang mga wika';

  @override
  String get clear => 'I-clear';

  @override
  String get inputHint => 'Maglagay ng teksto...';

  @override
  String get translate => 'Isalin';

  @override
  String get copyToClipboard => 'Kopyahin sa clipboard';

  @override
  String get translationCopied => 'Nakopya sa clipboard ang salin';

  @override
  String get translating => 'Isinasalin...';

  @override
  String get translationPlaceholder => 'Dito lalabas ang salin';

  @override
  String get documentTitle => 'Pagsasalin ng Dokumento';

  @override
  String pickFileError(String error) {
    return 'Hindi napili ang file: $error';
  }

  @override
  String get chooseSaveFolder => 'Pumili ng folder na paglalagyan';

  @override
  String get unsupportedFormat =>
      'Hindi sinusuportahan ang format ng file na ito.';

  @override
  String get documentDone => 'Matagumpay na naisalin ang dokumento!';

  @override
  String get translationCancelled => 'Kinansela ang pagsasalin.';

  @override
  String documentError(String error) {
    return 'May naganap na error habang nagsasalin: $error';
  }

  @override
  String get tapToPickDocument => 'I-tap para pumili ng dokumento';

  @override
  String get saveLocation => 'Lokasyon ng pag-save:';

  @override
  String get change => 'Baguhin…';

  @override
  String get pdfOcrTitle => 'Isalin ang teksto sa mga larawan ng PDF (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'ML Kit OCR para sa mga na-scan na pahina at diagram';

  @override
  String get sheetNamesShort => 'Isalin ang mga pangalan ng sheet';

  @override
  String get translateDocument => 'Isalin ang dokumento';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get preparing => 'Inihahanda ang pagsasalin...';

  @override
  String progressLine(int done, int total) {
    return 'Linya $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Talata $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Ibinahaging teksto $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Pahina $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Pahina $done/$total – binabasa ang teksto sa mga larawan';
  }

  @override
  String get openFile => 'Buksan ang file';

  @override
  String get share => 'Ibahagi';

  @override
  String get selectSourceLanguage => 'Pumili ng pinagmulang wika';

  @override
  String get selectTargetLanguage => 'Pumili ng target na wika';

  @override
  String get searchLanguage => 'Maghanap ng wika...';

  @override
  String get detectLanguage => 'Tukuyin ang wika';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get aiModel => 'AI Model';

  @override
  String get downloadModel => 'I-download ang model (1.05 GB)';

  @override
  String get pickGguf => 'Pumili ng .gguf mula sa device';

  @override
  String get cancelDownload => 'Kanselahin ang pag-download';

  @override
  String get defaultLanguages => 'Mga default na wika';

  @override
  String get defaultSourceLanguage => 'Default na pinagmulang wika';

  @override
  String get defaultTargetLanguage => 'Default na target na wika';

  @override
  String get documentsOcr => 'Mga Dokumento at OCR';

  @override
  String get pdfOcrSupport => 'Suporta sa OCR ng PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Isalin ang teksto sa mga na-scan na PDF at larawan';

  @override
  String get sheetNames => 'Isalin ang mga pangalan ng sheet ng Excel';

  @override
  String get sheetNamesDesc =>
      'Isinasalin din ang mga pamagat ng tab ng spreadsheet';

  @override
  String get appearance => 'Hitsura';

  @override
  String get appTheme => 'Tema ng app';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Maliwanag';

  @override
  String get themeDark => 'Madilim';

  @override
  String get appLanguage => 'Wika ng app';

  @override
  String get systemDefault => 'Default ng system';

  @override
  String get about => 'Tungkol';

  @override
  String get aboutDescription =>
      'Ganap na offline na AI translation app na tumatakbo sa mismong device. Pinapagana ng modelong Tencent HunYuan MT2 1.8B at ng llama.cpp FFI engine. Walang teksto o dokumentong ipinapadala sa internet.';

  @override
  String get modelNotInstalled => 'Hindi pa naka-install ang model';

  @override
  String get modelNotDownloaded => 'Hindi pa na-download ang model';

  @override
  String modelFileNotFound(String path) {
    return 'Hindi makita ang file ng model: $path';
  }

  @override
  String get modelLoading => 'Nilo-load ang model sa memorya...';

  @override
  String get modelReady => 'Handa na ang model (HunYuan MT2 1.8B Offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Error habang pumipili ng file: $error';
  }

  @override
  String get downloadStarting => 'Sinisimulan ang pag-download...';

  @override
  String get downloadCancelledKept =>
      'Kinansela ang pag-download (nai-save ang progreso)';

  @override
  String downloadingPercent(String percent) {
    return 'Dina-download: $percent%';
  }

  @override
  String get verifyingSha => 'Bine-verify ang SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Tapos na ang pag-download, nilo-load ang model...';

  @override
  String get downloadCancelled => 'Kinansela ang pag-download';

  @override
  String downloadError(String error) {
    return 'Error sa pag-download: $error';
  }

  @override
  String get cancellingDownload => 'Kinakansela ang pag-download...';

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
