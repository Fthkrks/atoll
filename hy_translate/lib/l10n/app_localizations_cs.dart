// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get navText => 'Text';

  @override
  String get navDocuments => 'Dokumenty';

  @override
  String get navSettings => 'Nastavení';

  @override
  String get madeBy => 'Vytvořilo 4pp';

  @override
  String get modelRequired =>
      'Před překladem je třeba model stáhnout nebo vybrat.';

  @override
  String translationError(String error) {
    return 'Chyba překladu: $error';
  }

  @override
  String genericError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get download => 'Stáhnout';

  @override
  String get swapLanguages => 'Prohodit jazyky';

  @override
  String get clear => 'Vymazat';

  @override
  String get inputHint => 'Zadejte text...';

  @override
  String get translate => 'Přeložit';

  @override
  String get copyToClipboard => 'Kopírovat do schránky';

  @override
  String get translationCopied => 'Překlad zkopírován do schránky';

  @override
  String get translating => 'Překládání...';

  @override
  String get translationPlaceholder => 'Zde se zobrazí překlad';

  @override
  String get documentTitle => 'Překlad dokumentů';

  @override
  String pickFileError(String error) {
    return 'Soubor se nepodařilo vybrat: $error';
  }

  @override
  String get chooseSaveFolder => 'Vyberte složku pro uložení';

  @override
  String get unsupportedFormat => 'Tento formát souboru není podporován.';

  @override
  String get documentDone => 'Dokument byl úspěšně přeložen!';

  @override
  String get translationCancelled => 'Překlad zrušen.';

  @override
  String documentError(String error) {
    return 'Při překladu došlo k chybě: $error';
  }

  @override
  String get tapToPickDocument => 'Klepnutím vyberte dokument';

  @override
  String get saveLocation => 'Umístění uložení:';

  @override
  String get change => 'Změnit…';

  @override
  String get pdfOcrTitle => 'Překládat text v obrázcích v PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'OCR ML Kit pro naskenované stránky a diagramy';

  @override
  String get sheetNamesShort => 'Překládat názvy listů';

  @override
  String get translateDocument => 'Přeložit dokument';

  @override
  String get cancel => 'Zrušit';

  @override
  String get preparing => 'Příprava překladu...';

  @override
  String progressLine(int done, int total) {
    return 'Řádek $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Odstavec $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Sdílený text $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Strana $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Strana $done/$total – čtení textu v obrázcích';
  }

  @override
  String get openFile => 'Otevřít soubor';

  @override
  String get share => 'Sdílet';

  @override
  String get selectSourceLanguage => 'Vyberte zdrojový jazyk';

  @override
  String get selectTargetLanguage => 'Vyberte cílový jazyk';

  @override
  String get searchLanguage => 'Hledat jazyk...';

  @override
  String get detectLanguage => 'Rozpoznat jazyk';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get aiModel => 'Model AI';

  @override
  String get downloadModel => 'Stáhnout model (1,05 GB)';

  @override
  String get pickGguf => 'Vybrat soubor .gguf ze zařízení';

  @override
  String get cancelDownload => 'Zrušit stahování';

  @override
  String get defaultLanguages => 'Výchozí jazyky';

  @override
  String get defaultSourceLanguage => 'Výchozí zdrojový jazyk';

  @override
  String get defaultTargetLanguage => 'Výchozí cílový jazyk';

  @override
  String get documentsOcr => 'Dokumenty a OCR';

  @override
  String get pdfOcrSupport => 'Podpora OCR pro PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Překládat text v naskenovaných PDF a obrázcích';

  @override
  String get sheetNames => 'Překládat názvy listů Excelu';

  @override
  String get sheetNamesDesc => 'Přeloží také názvy karet sešitu';

  @override
  String get appearance => 'Vzhled';

  @override
  String get appTheme => 'Motiv aplikace';

  @override
  String get themeSystem => 'Systémový';

  @override
  String get themeLight => 'Světlý';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get appLanguage => 'Jazyk aplikace';

  @override
  String get systemDefault => 'Výchozí podle systému';

  @override
  String get about => 'O aplikaci';

  @override
  String get aboutDescription =>
      'Plně offline aplikace pro překlad s AI, která běží přímo v zařízení. Využívá model Tencent HunYuan MT2 1.8B a engine llama.cpp FFI. Žádné texty ani dokumenty se neodesílají na internet.';

  @override
  String get modelNotInstalled => 'Model není nainstalován';

  @override
  String get modelNotDownloaded => 'Model ještě nebyl stažen';

  @override
  String modelFileNotFound(String path) {
    return 'Soubor modelu nenalezen: $path';
  }

  @override
  String get modelLoading => 'Načítání modelu do paměti...';

  @override
  String get modelReady => 'Model připraven (HunYuan MT2 1.8B offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Chyba při výběru souboru: $error';
  }

  @override
  String get downloadStarting => 'Spouštění stahování...';

  @override
  String get downloadCancelledKept => 'Stahování zrušeno (průběh uložen)';

  @override
  String downloadingPercent(String percent) {
    return 'Stahování: $percent %';
  }

  @override
  String get verifyingSha => 'Ověřování SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Stahování dokončeno, načítání modelu...';

  @override
  String get downloadCancelled => 'Stahování zrušeno';

  @override
  String downloadError(String error) {
    return 'Chyba stahování: $error';
  }

  @override
  String get cancellingDownload => 'Rušení stahování...';

  @override
  String get onboardingHeadline => 'Překlad bez internetu';

  @override
  String get onboardingBenefitOffline => 'Po nastavení funguje zcela offline';

  @override
  String get onboardingBenefitPrivate =>
      'Soukromé, žádná data neopouštějí vaše zařízení';

  @override
  String get onboardingBenefitFormats => 'Překládejte text a dokumenty';

  @override
  String onboardingSizeNote(String size) {
    return 'Jednorázové stažení: cca $size GB. Doporučeno Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Stáhnout model';

  @override
  String get onboardingBackgroundNote =>
      'Můžete aplikaci opustit; stahování se obnoví tam, kde skončilo.';

  @override
  String get onboardingTryAgain => 'Zkusit znovu';

  @override
  String get onboardingHaveGguf => 'Už mám soubor .gguf';

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
