// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get navText => 'Text';

  @override
  String get navDocuments => 'Dokumente';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get madeBy => 'Entwickelt von 4pp';

  @override
  String get modelRequired =>
      'Das Modell muss vor der Übersetzung heruntergeladen oder ausgewählt werden.';

  @override
  String translationError(String error) {
    return 'Übersetzungsfehler: $error';
  }

  @override
  String genericError(String error) {
    return 'Fehler: $error';
  }

  @override
  String get download => 'Herunterladen';

  @override
  String get swapLanguages => 'Sprachen tauschen';

  @override
  String get clear => 'Löschen';

  @override
  String get inputHint => 'Text eingeben...';

  @override
  String get translate => 'Übersetzen';

  @override
  String get copyToClipboard => 'In die Zwischenablage kopieren';

  @override
  String get translationCopied => 'Übersetzung in die Zwischenablage kopiert';

  @override
  String get translating => 'Wird übersetzt...';

  @override
  String get translationPlaceholder => 'Die Übersetzung erscheint hier';

  @override
  String get documentTitle => 'Dokumentübersetzung';

  @override
  String pickFileError(String error) {
    return 'Datei konnte nicht ausgewählt werden: $error';
  }

  @override
  String get chooseSaveFolder => 'Speicherordner auswählen';

  @override
  String get unsupportedFormat => 'Dieses Dateiformat wird nicht unterstützt.';

  @override
  String get documentDone => 'Dokument erfolgreich übersetzt!';

  @override
  String get translationCancelled => 'Übersetzung abgebrochen.';

  @override
  String documentError(String error) {
    return 'Bei der Übersetzung ist ein Fehler aufgetreten: $error';
  }

  @override
  String get tapToPickDocument => 'Tippen, um ein Dokument auszuwählen';

  @override
  String get saveLocation => 'Speicherort:';

  @override
  String get change => 'Ändern…';

  @override
  String get pdfOcrTitle => 'Text in PDF-Bildern übersetzen (OCR)';

  @override
  String get pdfOcrSubtitle => 'ML-Kit-OCR für gescannte Seiten und Diagramme';

  @override
  String get sheetNamesShort => 'Tabellenblattnamen übersetzen';

  @override
  String get translateDocument => 'Dokument übersetzen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get preparing => 'Übersetzung wird vorbereitet...';

  @override
  String progressLine(int done, int total) {
    return 'Zeile $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Absatz $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Gemeinsamer Text $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Seite $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Seite $done/$total – Text in Bildern wird gelesen';
  }

  @override
  String get openFile => 'Datei öffnen';

  @override
  String get share => 'Teilen';

  @override
  String get selectSourceLanguage => 'Quellsprache auswählen';

  @override
  String get selectTargetLanguage => 'Zielsprache auswählen';

  @override
  String get searchLanguage => 'Sprache suchen...';

  @override
  String get detectLanguage => 'Sprache erkennen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get aiModel => 'KI-Modell';

  @override
  String get downloadModel => 'Modell herunterladen (1,05 GB)';

  @override
  String get pickGguf => '.gguf vom Gerät auswählen';

  @override
  String get cancelDownload => 'Download abbrechen';

  @override
  String get defaultLanguages => 'Standardsprachen';

  @override
  String get defaultSourceLanguage => 'Standard-Quellsprache';

  @override
  String get defaultTargetLanguage => 'Standard-Zielsprache';

  @override
  String get documentsOcr => 'Dokumente & OCR';

  @override
  String get pdfOcrSupport => 'PDF-OCR-Unterstützung';

  @override
  String get pdfOcrSupportDesc =>
      'Text in gescannten PDFs und Bildern übersetzen';

  @override
  String get sheetNames => 'Excel-Blattnamen übersetzen';

  @override
  String get sheetNamesDesc => 'Übersetzt auch die Titel der Tabellenblätter';

  @override
  String get appearance => 'Darstellung';

  @override
  String get appTheme => 'App-Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get appLanguage => 'App-Sprache';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get about => 'Info';

  @override
  String get aboutDescription =>
      'Vollständig offline arbeitende KI-Übersetzungs-App direkt auf dem Gerät. Angetrieben vom Modell Tencent HunYuan MT2 1.8B und der llama.cpp-FFI-Engine. Es werden niemals Texte oder Dokumente ins Internet gesendet.';

  @override
  String get modelNotInstalled => 'Modell nicht installiert';

  @override
  String get modelNotDownloaded => 'Modell noch nicht heruntergeladen';

  @override
  String modelFileNotFound(String path) {
    return 'Modelldatei nicht gefunden: $path';
  }

  @override
  String get modelLoading => 'Modell wird in den Speicher geladen...';

  @override
  String get modelReady => 'Modell bereit (HunYuan MT2 1.8B Offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Fehler bei der Dateiauswahl: $error';
  }

  @override
  String get downloadStarting => 'Download wird gestartet...';

  @override
  String get downloadCancelledKept =>
      'Download abgebrochen (Fortschritt gespeichert)';

  @override
  String downloadingPercent(String percent) {
    return 'Wird heruntergeladen: $percent %';
  }

  @override
  String get verifyingSha => 'SHA256 wird überprüft...';

  @override
  String get downloadCompleteLoading =>
      'Download abgeschlossen, Modell wird geladen...';

  @override
  String get downloadCancelled => 'Download abgebrochen';

  @override
  String downloadError(String error) {
    return 'Download-Fehler: $error';
  }

  @override
  String get cancellingDownload => 'Download wird abgebrochen...';

  @override
  String get onboardingHeadline => 'Übersetzen ohne Internet';

  @override
  String get onboardingBenefitOffline =>
      'Funktioniert nach Einrichtung komplett offline';

  @override
  String get onboardingBenefitPrivate =>
      'Privat, keine Daten verlassen das Gerät';

  @override
  String get onboardingBenefitFormats => 'Texte und Dokumente übersetzen';

  @override
  String onboardingSizeNote(String size) {
    return 'Einmaliger Download: ca. $size GB. WLAN empfohlen.';
  }

  @override
  String get onboardingDownloadButton => 'Modell herunterladen';

  @override
  String get onboardingBackgroundNote =>
      'Sie können die App verlassen; der Download wird fortgesetzt.';

  @override
  String get onboardingTryAgain => 'Erneut versuchen';

  @override
  String get onboardingHaveGguf => 'Ich habe bereits eine .gguf-Datei';

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
