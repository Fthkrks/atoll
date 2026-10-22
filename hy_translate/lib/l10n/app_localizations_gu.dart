// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get navText => 'ટેક્સ્ટ';

  @override
  String get navDocuments => 'દસ્તાવેજો';

  @override
  String get navSettings => 'સેટિંગ્સ';

  @override
  String get madeBy => '4pp દ્વારા બનાવાયેલ';

  @override
  String get modelRequired =>
      'અનુવાદ કરતા પહેલાં મોડેલ ડાઉનલોડ કરવું અથવા પસંદ કરવું જરૂરી છે.';

  @override
  String translationError(String error) {
    return 'અનુવાદમાં ભૂલ: $error';
  }

  @override
  String genericError(String error) {
    return 'ભૂલ: $error';
  }

  @override
  String get download => 'ડાઉનલોડ કરો';

  @override
  String get swapLanguages => 'ભાષાઓની અદલાબદલી કરો';

  @override
  String get clear => 'સાફ કરો';

  @override
  String get inputHint => 'ટેક્સ્ટ લખો...';

  @override
  String get translate => 'અનુવાદ કરો';

  @override
  String get copyToClipboard => 'ક્લિપબોર્ડ પર કૉપિ કરો';

  @override
  String get translationCopied => 'અનુવાદ ક્લિપબોર્ડ પર કૉપિ થયો';

  @override
  String get translating => 'અનુવાદ થઈ રહ્યો છે...';

  @override
  String get translationPlaceholder => 'અનુવાદ અહીં દેખાશે';

  @override
  String get documentTitle => 'દસ્તાવેજ અનુવાદ';

  @override
  String pickFileError(String error) {
    return 'ફાઇલ પસંદ કરી શકાઈ નથી: $error';
  }

  @override
  String get chooseSaveFolder => 'સાચવવા માટે ફોલ્ડર પસંદ કરો';

  @override
  String get unsupportedFormat => 'આ ફાઇલ ફોર્મેટ સપોર્ટેડ નથી.';

  @override
  String get documentDone => 'દસ્તાવેજનો અનુવાદ સફળતાપૂર્વક થયો!';

  @override
  String get translationCancelled => 'અનુવાદ રદ કરાયો.';

  @override
  String documentError(String error) {
    return 'અનુવાદ દરમિયાન ભૂલ થઈ: $error';
  }

  @override
  String get tapToPickDocument => 'દસ્તાવેજ પસંદ કરવા ટૅપ કરો';

  @override
  String get saveLocation => 'સાચવવાનું સ્થાન:';

  @override
  String get change => 'બદલો…';

  @override
  String get pdfOcrTitle => 'PDF ની છબીઓમાંના ટેક્સ્ટનો અનુવાદ કરો (OCR)';

  @override
  String get pdfOcrSubtitle => 'સ્કૅન કરેલા પૃષ્ઠો અને આકૃતિઓ માટે ML Kit OCR';

  @override
  String get sheetNamesShort => 'શીટના નામોનો અનુવાદ કરો';

  @override
  String get translateDocument => 'દસ્તાવેજનો અનુવાદ કરો';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get preparing => 'અનુવાદ તૈયાર થઈ રહ્યો છે...';

  @override
  String progressLine(int done, int total) {
    return 'પંક્તિ $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'ફકરો $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'શેર કરેલો ટેક્સ્ટ $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'પૃષ્ઠ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'પૃષ્ઠ $done/$total – છબીઓમાંનો ટેક્સ્ટ વંચાઈ રહ્યો છે';
  }

  @override
  String get openFile => 'ફાઇલ ખોલો';

  @override
  String get share => 'શેર કરો';

  @override
  String get selectSourceLanguage => 'સ્રોત ભાષા પસંદ કરો';

  @override
  String get selectTargetLanguage => 'લક્ષ્ય ભાષા પસંદ કરો';

  @override
  String get searchLanguage => 'ભાષા શોધો...';

  @override
  String get detectLanguage => 'ભાષા ઓળખો';

  @override
  String get settingsTitle => 'સેટિંગ્સ';

  @override
  String get aiModel => 'AI મોડેલ';

  @override
  String get downloadModel => 'મોડેલ ડાઉનલોડ કરો (1.05 GB)';

  @override
  String get pickGguf => 'ઉપકરણમાંથી .gguf પસંદ કરો';

  @override
  String get cancelDownload => 'ડાઉનલોડ રદ કરો';

  @override
  String get defaultLanguages => 'ડિફૉલ્ટ ભાષાઓ';

  @override
  String get defaultSourceLanguage => 'ડિફૉલ્ટ સ્રોત ભાષા';

  @override
  String get defaultTargetLanguage => 'ડિફૉલ્ટ લક્ષ્ય ભાષા';

  @override
  String get documentsOcr => 'દસ્તાવેજો અને OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR સપોર્ટ';

  @override
  String get pdfOcrSupportDesc =>
      'સ્કૅન કરેલા PDF અને છબીઓમાંના ટેક્સ્ટનો અનુવાદ કરો';

  @override
  String get sheetNames => 'Excel શીટના નામોનો અનુવાદ કરો';

  @override
  String get sheetNamesDesc => 'સ્પ્રેડશીટ ટૅબના શીર્ષકોનો પણ અનુવાદ કરે છે';

  @override
  String get appearance => 'દેખાવ';

  @override
  String get appTheme => 'ઍપ થીમ';

  @override
  String get themeSystem => 'સિસ્ટમ';

  @override
  String get themeLight => 'લાઇટ';

  @override
  String get themeDark => 'ડાર્ક';

  @override
  String get appLanguage => 'ઍપની ભાષા';

  @override
  String get systemDefault => 'સિસ્ટમ ડિફૉલ્ટ';

  @override
  String get about => 'વિશે';

  @override
  String get aboutDescription =>
      'સંપૂર્ણપણે ઑફલાઇન અને ઉપકરણ પર ચાલતી AI અનુવાદ ઍપ. Tencent HunYuan MT2 1.8B મોડેલ અને llama.cpp FFI એન્જિન દ્વારા સંચાલિત. કોઈ ટેક્સ્ટ કે દસ્તાવેજ ઇન્ટરનેટ પર મોકલાતો નથી.';

  @override
  String get modelNotInstalled => 'મોડેલ ઇન્સ્ટૉલ કરેલું નથી';

  @override
  String get modelNotDownloaded => 'મોડેલ હજુ ડાઉનલોડ થયું નથી';

  @override
  String modelFileNotFound(String path) {
    return 'મોડેલ ફાઇલ મળી નથી: $path';
  }

  @override
  String get modelLoading => 'મોડેલ મેમરીમાં લોડ થઈ રહ્યું છે...';

  @override
  String get modelReady => 'મોડેલ તૈયાર છે (HunYuan MT2 1.8B ઑફલાઇન)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ફાઇલ પસંદ કરતી વખતે ભૂલ: $error';
  }

  @override
  String get downloadStarting => 'ડાઉનલોડ શરૂ થઈ રહ્યું છે...';

  @override
  String get downloadCancelledKept => 'ડાઉનલોડ રદ કરાયું (પ્રગતિ સાચવેલી છે)';

  @override
  String downloadingPercent(String percent) {
    return 'ડાઉનલોડ થઈ રહ્યું છે: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 ચકાસાઈ રહ્યું છે...';

  @override
  String get downloadCompleteLoading =>
      'ડાઉનલોડ પૂર્ણ, મોડેલ લોડ થઈ રહ્યું છે...';

  @override
  String get downloadCancelled => 'ડાઉનલોડ રદ કરાયું';

  @override
  String downloadError(String error) {
    return 'ડાઉનલોડમાં ભૂલ: $error';
  }

  @override
  String get cancellingDownload => 'ડાઉનલોડ રદ થઈ રહ્યું છે...';

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
