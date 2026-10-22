// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get navText => 'Tekst';

  @override
  String get navDocuments => 'Documenten';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get madeBy => 'Gemaakt door 4pp';

  @override
  String get modelRequired =>
      'Het model moet worden gedownload of geselecteerd voordat je kunt vertalen.';

  @override
  String translationError(String error) {
    return 'Vertaalfout: $error';
  }

  @override
  String genericError(String error) {
    return 'Fout: $error';
  }

  @override
  String get download => 'Downloaden';

  @override
  String get swapLanguages => 'Talen omwisselen';

  @override
  String get clear => 'Wissen';

  @override
  String get inputHint => 'Voer tekst in...';

  @override
  String get translate => 'Vertalen';

  @override
  String get copyToClipboard => 'Kopiëren naar klembord';

  @override
  String get translationCopied => 'Vertaling naar klembord gekopieerd';

  @override
  String get translating => 'Bezig met vertalen...';

  @override
  String get translationPlaceholder => 'De vertaling verschijnt hier';

  @override
  String get documentTitle => 'Documentvertaling';

  @override
  String pickFileError(String error) {
    return 'Bestand kiezen mislukt: $error';
  }

  @override
  String get chooseSaveFolder => 'Opslagmap kiezen';

  @override
  String get unsupportedFormat => 'Dit bestandsformaat wordt niet ondersteund.';

  @override
  String get documentDone => 'Document succesvol vertaald!';

  @override
  String get translationCancelled => 'Vertaling geannuleerd.';

  @override
  String documentError(String error) {
    return 'Er is een fout opgetreden tijdens het vertalen: $error';
  }

  @override
  String get tapToPickDocument => 'Tik om een document te kiezen';

  @override
  String get saveLocation => 'Opslaglocatie:';

  @override
  String get change => 'Wijzigen…';

  @override
  String get pdfOcrTitle => 'Tekst in pdf-afbeeldingen vertalen (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'ML Kit-OCR voor gescande pagina’s en diagrammen';

  @override
  String get sheetNamesShort => 'Namen van werkbladen vertalen';

  @override
  String get translateDocument => 'Document vertalen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get preparing => 'Vertaling voorbereiden...';

  @override
  String progressLine(int done, int total) {
    return 'Regel $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Alinea $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Gedeelde tekst $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Pagina $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Pagina $done/$total – tekst in afbeeldingen lezen';
  }

  @override
  String get openFile => 'Bestand openen';

  @override
  String get share => 'Delen';

  @override
  String get selectSourceLanguage => 'Brontaal kiezen';

  @override
  String get selectTargetLanguage => 'Doeltaal kiezen';

  @override
  String get searchLanguage => 'Taal zoeken...';

  @override
  String get detectLanguage => 'Taal detecteren';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get aiModel => 'AI-model';

  @override
  String get downloadModel => 'Model downloaden (1,05 GB)';

  @override
  String get pickGguf => '.gguf van apparaat kiezen';

  @override
  String get cancelDownload => 'Download annuleren';

  @override
  String get defaultLanguages => 'Standaardtalen';

  @override
  String get defaultSourceLanguage => 'Standaard brontaal';

  @override
  String get defaultTargetLanguage => 'Standaard doeltaal';

  @override
  String get documentsOcr => 'Documenten en OCR';

  @override
  String get pdfOcrSupport => 'Ondersteuning voor pdf-OCR';

  @override
  String get pdfOcrSupportDesc =>
      'Tekst in gescande pdf’s en afbeeldingen vertalen';

  @override
  String get sheetNames => 'Excel-werkbladnamen vertalen';

  @override
  String get sheetNamesDesc =>
      'Vertaalt ook de titels van de werkbladtabbladen';

  @override
  String get appearance => 'Weergave';

  @override
  String get appTheme => 'App-thema';

  @override
  String get themeSystem => 'Systeem';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get appLanguage => 'App-taal';

  @override
  String get systemDefault => 'Systeemstandaard';

  @override
  String get about => 'Over';

  @override
  String get aboutDescription =>
      'Volledig offline AI-vertaalapp die op het apparaat zelf draait. Aangedreven door het Tencent HunYuan MT2 1.8B-model en de llama.cpp FFI-engine. Er worden nooit teksten of documenten naar internet verzonden.';

  @override
  String get modelNotInstalled => 'Model niet geïnstalleerd';

  @override
  String get modelNotDownloaded => 'Model nog niet gedownload';

  @override
  String modelFileNotFound(String path) {
    return 'Modelbestand niet gevonden: $path';
  }

  @override
  String get modelLoading => 'Model laden in het geheugen...';

  @override
  String get modelReady => 'Model gereed (HunYuan MT2 1.8B offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Fout bij het kiezen van het bestand: $error';
  }

  @override
  String get downloadStarting => 'Download starten...';

  @override
  String get downloadCancelledKept =>
      'Download geannuleerd (voortgang bewaard)';

  @override
  String downloadingPercent(String percent) {
    return 'Downloaden: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 controleren...';

  @override
  String get downloadCompleteLoading =>
      'Download voltooid, model wordt geladen...';

  @override
  String get downloadCancelled => 'Download geannuleerd';

  @override
  String downloadError(String error) {
    return 'Downloadfout: $error';
  }

  @override
  String get cancellingDownload => 'Download annuleren...';

  @override
  String get onboardingHeadline => 'Vertalen zonder internet';

  @override
  String get onboardingBenefitOffline =>
      'Werkt na installatie volledig offline';

  @override
  String get onboardingBenefitPrivate =>
      'Privé, er verlaat geen data uw apparaat';

  @override
  String get onboardingBenefitFormats => 'Vertaal tekst en documenten';

  @override
  String onboardingSizeNote(String size) {
    return 'Eenmalige download: ca. $size GB. Wi-Fi aanbevolen.';
  }

  @override
  String get onboardingDownloadButton => 'Model downloaden';

  @override
  String get onboardingBackgroundNote =>
      'U kunt de app verlaten; het downloaden gaat verder waar u was gebleven.';

  @override
  String get onboardingTryAgain => 'Opnieuw proberen';

  @override
  String get onboardingHaveGguf => 'Ik heb al een .gguf-bestand';

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
