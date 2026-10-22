// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get navText => 'Texte';

  @override
  String get navDocuments => 'Documents';

  @override
  String get navSettings => 'Réglages';

  @override
  String get madeBy => 'Créé par 4pp';

  @override
  String get modelRequired =>
      'Le modèle doit être téléchargé ou sélectionné avant de traduire.';

  @override
  String translationError(String error) {
    return 'Erreur de traduction : $error';
  }

  @override
  String genericError(String error) {
    return 'Erreur : $error';
  }

  @override
  String get download => 'Télécharger';

  @override
  String get swapLanguages => 'Inverser les langues';

  @override
  String get clear => 'Effacer';

  @override
  String get inputHint => 'Saisissez du texte...';

  @override
  String get translate => 'Traduire';

  @override
  String get copyToClipboard => 'Copier dans le presse-papiers';

  @override
  String get translationCopied => 'Traduction copiée dans le presse-papiers';

  @override
  String get translating => 'Traduction en cours...';

  @override
  String get translationPlaceholder => 'La traduction apparaîtra ici';

  @override
  String get documentTitle => 'Traduction de documents';

  @override
  String pickFileError(String error) {
    return 'Impossible de choisir le fichier : $error';
  }

  @override
  String get chooseSaveFolder => 'Choisir le dossier d’enregistrement';

  @override
  String get unsupportedFormat =>
      'Ce format de fichier n’est pas pris en charge.';

  @override
  String get documentDone => 'Document traduit avec succès !';

  @override
  String get translationCancelled => 'Traduction annulée.';

  @override
  String documentError(String error) {
    return 'Une erreur s’est produite pendant la traduction : $error';
  }

  @override
  String get tapToPickDocument => 'Appuyez pour choisir un document';

  @override
  String get saveLocation => 'Emplacement d’enregistrement :';

  @override
  String get change => 'Modifier…';

  @override
  String get pdfOcrTitle => 'Traduire le texte des images PDF (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'OCR ML Kit pour les pages numérisées et les schémas';

  @override
  String get sheetNamesShort => 'Traduire les noms des feuilles';

  @override
  String get translateDocument => 'Traduire le document';

  @override
  String get cancel => 'Annuler';

  @override
  String get preparing => 'Préparation de la traduction...';

  @override
  String progressLine(int done, int total) {
    return 'Ligne $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Paragraphe $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Texte partagé $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Page $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Page $done/$total – lecture du texte des images';
  }

  @override
  String get openFile => 'Ouvrir le fichier';

  @override
  String get share => 'Partager';

  @override
  String get selectSourceLanguage => 'Choisir la langue source';

  @override
  String get selectTargetLanguage => 'Choisir la langue cible';

  @override
  String get searchLanguage => 'Rechercher une langue...';

  @override
  String get detectLanguage => 'Détecter la langue';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get aiModel => 'Modèle d’IA';

  @override
  String get downloadModel => 'Télécharger le modèle (1,05 Go)';

  @override
  String get pickGguf => 'Choisir un .gguf sur l’appareil';

  @override
  String get cancelDownload => 'Annuler le téléchargement';

  @override
  String get defaultLanguages => 'Langues par défaut';

  @override
  String get defaultSourceLanguage => 'Langue source par défaut';

  @override
  String get defaultTargetLanguage => 'Langue cible par défaut';

  @override
  String get documentsOcr => 'Documents et OCR';

  @override
  String get pdfOcrSupport => 'Prise en charge de l’OCR PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Traduire le texte des PDF numérisés et des images';

  @override
  String get sheetNames => 'Traduire les noms des feuilles Excel';

  @override
  String get sheetNamesDesc =>
      'Traduit aussi les titres des onglets du classeur';

  @override
  String get appearance => 'Apparence';

  @override
  String get appTheme => 'Thème de l’application';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get appLanguage => 'Langue de l’application';

  @override
  String get systemDefault => 'Par défaut du système';

  @override
  String get about => 'À propos';

  @override
  String get aboutDescription =>
      'Application de traduction par IA fonctionnant entièrement hors ligne, sur l’appareil. Propulsée par le modèle Tencent HunYuan MT2 1.8B et le moteur FFI llama.cpp. Aucun texte ni document n’est jamais envoyé sur Internet.';

  @override
  String get modelNotInstalled => 'Modèle non installé';

  @override
  String get modelNotDownloaded => 'Modèle pas encore téléchargé';

  @override
  String modelFileNotFound(String path) {
    return 'Fichier du modèle introuvable : $path';
  }

  @override
  String get modelLoading => 'Chargement du modèle en mémoire...';

  @override
  String get modelReady => 'Modèle prêt (HunYuan MT2 1.8B hors ligne)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Erreur lors du choix du fichier : $error';
  }

  @override
  String get downloadStarting => 'Démarrage du téléchargement...';

  @override
  String get downloadCancelledKept =>
      'Téléchargement annulé (progression conservée)';

  @override
  String downloadingPercent(String percent) {
    return 'Téléchargement : $percent %';
  }

  @override
  String get verifyingSha => 'Vérification SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Téléchargement terminé, chargement du modèle...';

  @override
  String get downloadCancelled => 'Téléchargement annulé';

  @override
  String downloadError(String error) {
    return 'Erreur de téléchargement : $error';
  }

  @override
  String get cancellingDownload => 'Annulation du téléchargement...';

  @override
  String get onboardingHeadline => 'Traduire sans Internet';

  @override
  String get onboardingBenefitOffline =>
      'Fonctionne entièrement hors ligne après configuration';

  @override
  String get onboardingBenefitPrivate =>
      'Privé, aucune donnée ne quitte votre appareil';

  @override
  String get onboardingBenefitFormats => 'Traduire des textes et des documents';

  @override
  String onboardingSizeNote(String size) {
    return 'Téléchargement unique : environ $size Go. Wi-Fi recommandé.';
  }

  @override
  String get onboardingDownloadButton => 'Télécharger le modèle';

  @override
  String get onboardingBackgroundNote =>
      'Vous pouvez quitter l\'application ; le téléchargement reprendra.';

  @override
  String get onboardingTryAgain => 'Réessayer';

  @override
  String get onboardingHaveGguf => 'J\'ai déjà un fichier .gguf';

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
