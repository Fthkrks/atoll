// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get navText => 'Tekst';

  @override
  String get navDocuments => 'Dokumenty';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String get madeBy => 'Stworzone przez 4pp';

  @override
  String get modelRequired =>
      'Przed tłumaczeniem trzeba pobrać lub wybrać model.';

  @override
  String translationError(String error) {
    return 'Błąd tłumaczenia: $error';
  }

  @override
  String genericError(String error) {
    return 'Błąd: $error';
  }

  @override
  String get download => 'Pobierz';

  @override
  String get swapLanguages => 'Zamień języki';

  @override
  String get clear => 'Wyczyść';

  @override
  String get inputHint => 'Wpisz tekst...';

  @override
  String get translate => 'Przetłumacz';

  @override
  String get copyToClipboard => 'Kopiuj do schowka';

  @override
  String get translationCopied => 'Tłumaczenie skopiowano do schowka';

  @override
  String get translating => 'Tłumaczenie...';

  @override
  String get translationPlaceholder => 'Tutaj pojawi się tłumaczenie';

  @override
  String get documentTitle => 'Tłumaczenie dokumentów';

  @override
  String pickFileError(String error) {
    return 'Nie udało się wybrać pliku: $error';
  }

  @override
  String get chooseSaveFolder => 'Wybierz folder zapisu';

  @override
  String get unsupportedFormat => 'Ten format pliku nie jest obsługiwany.';

  @override
  String get documentDone => 'Dokument przetłumaczony pomyślnie!';

  @override
  String get translationCancelled => 'Tłumaczenie anulowane.';

  @override
  String documentError(String error) {
    return 'Podczas tłumaczenia wystąpił błąd: $error';
  }

  @override
  String get tapToPickDocument => 'Dotknij, aby wybrać dokument';

  @override
  String get saveLocation => 'Miejsce zapisu:';

  @override
  String get change => 'Zmień…';

  @override
  String get pdfOcrTitle => 'Tłumacz tekst na obrazach w PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'OCR ML Kit dla zeskanowanych stron i diagramów';

  @override
  String get sheetNamesShort => 'Tłumacz nazwy arkuszy';

  @override
  String get translateDocument => 'Przetłumacz dokument';

  @override
  String get cancel => 'Anuluj';

  @override
  String get preparing => 'Przygotowywanie tłumaczenia...';

  @override
  String progressLine(int done, int total) {
    return 'Wiersz $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Akapit $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Tekst udostępniony $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Strona $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Strona $done/$total – odczytywanie tekstu na obrazach';
  }

  @override
  String get openFile => 'Otwórz plik';

  @override
  String get share => 'Udostępnij';

  @override
  String get selectSourceLanguage => 'Wybierz język źródłowy';

  @override
  String get selectTargetLanguage => 'Wybierz język docelowy';

  @override
  String get searchLanguage => 'Szukaj języka...';

  @override
  String get detectLanguage => 'Wykryj język';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get aiModel => 'Model AI';

  @override
  String get downloadModel => 'Pobierz model (1,05 GB)';

  @override
  String get pickGguf => 'Wybierz plik .gguf z urządzenia';

  @override
  String get cancelDownload => 'Anuluj pobieranie';

  @override
  String get defaultLanguages => 'Języki domyślne';

  @override
  String get defaultSourceLanguage => 'Domyślny język źródłowy';

  @override
  String get defaultTargetLanguage => 'Domyślny język docelowy';

  @override
  String get documentsOcr => 'Dokumenty i OCR';

  @override
  String get pdfOcrSupport => 'Obsługa OCR w PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Tłumacz tekst w zeskanowanych plikach PDF i obrazach';

  @override
  String get sheetNames => 'Tłumacz nazwy arkuszy Excela';

  @override
  String get sheetNamesDesc => 'Tłumaczy też tytuły kart arkusza';

  @override
  String get appearance => 'Wygląd';

  @override
  String get appTheme => 'Motyw aplikacji';

  @override
  String get themeSystem => 'Systemowy';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get appLanguage => 'Język aplikacji';

  @override
  String get systemDefault => 'Domyślny systemu';

  @override
  String get about => 'Informacje';

  @override
  String get aboutDescription =>
      'W pełni offline’owa aplikacja do tłumaczenia z AI, działająca na urządzeniu. Napędzana modelem Tencent HunYuan MT2 1.8B i silnikiem llama.cpp FFI. Żadne teksty ani dokumenty nie są wysyłane do internetu.';

  @override
  String get modelNotInstalled => 'Model nie jest zainstalowany';

  @override
  String get modelNotDownloaded => 'Model nie został jeszcze pobrany';

  @override
  String modelFileNotFound(String path) {
    return 'Nie znaleziono pliku modelu: $path';
  }

  @override
  String get modelLoading => 'Ładowanie modelu do pamięci...';

  @override
  String get modelReady => 'Model gotowy (HunYuan MT2 1.8B offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Błąd podczas wybierania pliku: $error';
  }

  @override
  String get downloadStarting => 'Rozpoczynanie pobierania...';

  @override
  String get downloadCancelledKept => 'Pobieranie anulowane (postęp zachowany)';

  @override
  String downloadingPercent(String percent) {
    return 'Pobieranie: $percent%';
  }

  @override
  String get verifyingSha => 'Weryfikowanie SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Pobieranie zakończone, ładowanie modelu...';

  @override
  String get downloadCancelled => 'Pobieranie anulowane';

  @override
  String downloadError(String error) {
    return 'Błąd pobierania: $error';
  }

  @override
  String get cancellingDownload => 'Anulowanie pobierania...';

  @override
  String get onboardingHeadline => 'Tłumacz bez internetu';

  @override
  String get onboardingBenefitOffline =>
      'Po konfiguracji działa całkowicie offline';

  @override
  String get onboardingBenefitPrivate =>
      'Prywatnie, żadne dane nie opuszczają Twojego urządzenia';

  @override
  String get onboardingBenefitFormats => 'Tłumacz tekst i dokumenty';

  @override
  String onboardingSizeNote(String size) {
    return 'Jednorazowe pobieranie: ok. $size GB. Zalecane Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Pobierz model';

  @override
  String get onboardingBackgroundNote =>
      'Możesz wyjść z aplikacji; pobieranie zostanie wznowione.';

  @override
  String get onboardingTryAgain => 'Spróbuj ponownie';

  @override
  String get onboardingHaveGguf => 'Mam już plik .gguf';

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
