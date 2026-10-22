// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get navText => 'Testo';

  @override
  String get navDocuments => 'Documenti';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get madeBy => 'Realizzato da 4pp';

  @override
  String get modelRequired =>
      'Prima di tradurre è necessario scaricare o selezionare il modello.';

  @override
  String translationError(String error) {
    return 'Errore di traduzione: $error';
  }

  @override
  String genericError(String error) {
    return 'Errore: $error';
  }

  @override
  String get download => 'Scarica';

  @override
  String get swapLanguages => 'Inverti lingue';

  @override
  String get clear => 'Cancella';

  @override
  String get inputHint => 'Inserisci il testo...';

  @override
  String get translate => 'Traduci';

  @override
  String get copyToClipboard => 'Copia negli appunti';

  @override
  String get translationCopied => 'Traduzione copiata negli appunti';

  @override
  String get translating => 'Traduzione in corso...';

  @override
  String get translationPlaceholder => 'La traduzione apparirà qui';

  @override
  String get documentTitle => 'Traduzione di documenti';

  @override
  String pickFileError(String error) {
    return 'Impossibile scegliere il file: $error';
  }

  @override
  String get chooseSaveFolder => 'Scegli la cartella di salvataggio';

  @override
  String get unsupportedFormat => 'Questo formato di file non è supportato.';

  @override
  String get documentDone => 'Documento tradotto con successo!';

  @override
  String get translationCancelled => 'Traduzione annullata.';

  @override
  String documentError(String error) {
    return 'Si è verificato un errore durante la traduzione: $error';
  }

  @override
  String get tapToPickDocument => 'Tocca per scegliere un documento';

  @override
  String get saveLocation => 'Percorso di salvataggio:';

  @override
  String get change => 'Cambia…';

  @override
  String get pdfOcrTitle => 'Traduci il testo nelle immagini del PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'OCR ML Kit per pagine scansionate e diagrammi';

  @override
  String get sheetNamesShort => 'Traduci i nomi dei fogli';

  @override
  String get translateDocument => 'Traduci documento';

  @override
  String get cancel => 'Annulla';

  @override
  String get preparing => 'Preparazione della traduzione...';

  @override
  String progressLine(int done, int total) {
    return 'Riga $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Paragrafo $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Testo condiviso $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Pagina $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Pagina $done/$total – lettura del testo nelle immagini';
  }

  @override
  String get openFile => 'Apri file';

  @override
  String get share => 'Condividi';

  @override
  String get selectSourceLanguage => 'Scegli la lingua di origine';

  @override
  String get selectTargetLanguage => 'Scegli la lingua di destinazione';

  @override
  String get searchLanguage => 'Cerca lingua...';

  @override
  String get detectLanguage => 'Rileva lingua';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get aiModel => 'Modello IA';

  @override
  String get downloadModel => 'Scarica il modello (1,05 GB)';

  @override
  String get pickGguf => 'Scegli un .gguf dal dispositivo';

  @override
  String get cancelDownload => 'Annulla download';

  @override
  String get defaultLanguages => 'Lingue predefinite';

  @override
  String get defaultSourceLanguage => 'Lingua di origine predefinita';

  @override
  String get defaultTargetLanguage => 'Lingua di destinazione predefinita';

  @override
  String get documentsOcr => 'Documenti e OCR';

  @override
  String get pdfOcrSupport => 'Supporto OCR per PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Traduci il testo di PDF scansionati e immagini';

  @override
  String get sheetNames => 'Traduci i nomi dei fogli Excel';

  @override
  String get sheetNamesDesc =>
      'Traduce anche i titoli delle schede del foglio di calcolo';

  @override
  String get appearance => 'Aspetto';

  @override
  String get appTheme => 'Tema dell’app';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get appLanguage => 'Lingua dell’app';

  @override
  String get systemDefault => 'Predefinita di sistema';

  @override
  String get about => 'Informazioni';

  @override
  String get aboutDescription =>
      'App di traduzione IA completamente offline e sul dispositivo. Basata sul modello Tencent HunYuan MT2 1.8B e sul motore FFI llama.cpp. Nessun testo o documento viene mai inviato a Internet.';

  @override
  String get modelNotInstalled => 'Modello non installato';

  @override
  String get modelNotDownloaded => 'Modello non ancora scaricato';

  @override
  String modelFileNotFound(String path) {
    return 'File del modello non trovato: $path';
  }

  @override
  String get modelLoading => 'Caricamento del modello in memoria...';

  @override
  String get modelReady => 'Modello pronto (HunYuan MT2 1.8B offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Errore durante la scelta del file: $error';
  }

  @override
  String get downloadStarting => 'Avvio del download...';

  @override
  String get downloadCancelledKept =>
      'Download annullato (avanzamento conservato)';

  @override
  String downloadingPercent(String percent) {
    return 'Download in corso: $percent%';
  }

  @override
  String get verifyingSha => 'Verifica SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Download completato, caricamento del modello...';

  @override
  String get downloadCancelled => 'Download annullato';

  @override
  String downloadError(String error) {
    return 'Errore di download: $error';
  }

  @override
  String get cancellingDownload => 'Annullamento del download...';

  @override
  String get onboardingHeadline => 'Traduci senza internet';

  @override
  String get onboardingBenefitOffline =>
      'Funziona completamente offline dopo la configurazione';

  @override
  String get onboardingBenefitPrivate =>
      'Privato, nessun dato lascia il tuo dispositivo';

  @override
  String get onboardingBenefitFormats => 'Traduci testi e documenti';

  @override
  String onboardingSizeNote(String size) {
    return 'Download una tantum: circa $size GB. Wi-Fi consigliato.';
  }

  @override
  String get onboardingDownloadButton => 'Scarica modello';

  @override
  String get onboardingBackgroundNote =>
      'Puoi uscire dall\'app; il download riprenderà da dove interrotto.';

  @override
  String get onboardingTryAgain => 'Riprova';

  @override
  String get onboardingHaveGguf => 'Ho già un file .gguf';

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
