// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get navText => 'உரை';

  @override
  String get navDocuments => 'ஆவணங்கள்';

  @override
  String get navSettings => 'அமைப்புகள்';

  @override
  String get madeBy => '4pp உருவாக்கியது';

  @override
  String get modelRequired =>
      'மொழிபெயர்ப்பதற்கு முன் மாடலைப் பதிவிறக்க வேண்டும் அல்லது தேர்ந்தெடுக்க வேண்டும்.';

  @override
  String translationError(String error) {
    return 'மொழிபெயர்ப்புப் பிழை: $error';
  }

  @override
  String genericError(String error) {
    return 'பிழை: $error';
  }

  @override
  String get download => 'பதிவிறக்கு';

  @override
  String get swapLanguages => 'மொழிகளை மாற்று';

  @override
  String get clear => 'அழி';

  @override
  String get inputHint => 'உரையை உள்ளிடுக...';

  @override
  String get translate => 'மொழிபெயர்';

  @override
  String get copyToClipboard => 'கிளிப்போர்டுக்கு நகலெடு';

  @override
  String get translationCopied =>
      'மொழிபெயர்ப்பு கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது';

  @override
  String get translating => 'மொழிபெயர்க்கிறது...';

  @override
  String get translationPlaceholder => 'மொழிபெயர்ப்பு இங்கே தோன்றும்';

  @override
  String get documentTitle => 'ஆவண மொழிபெயர்ப்பு';

  @override
  String pickFileError(String error) {
    return 'கோப்பைத் தேர்ந்தெடுக்க முடியவில்லை: $error';
  }

  @override
  String get chooseSaveFolder => 'சேமிக்கும் கோப்புறையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get unsupportedFormat => 'இந்தக் கோப்பு வடிவம் ஆதரிக்கப்படவில்லை.';

  @override
  String get documentDone => 'ஆவணம் வெற்றிகரமாக மொழிபெயர்க்கப்பட்டது!';

  @override
  String get translationCancelled => 'மொழிபெயர்ப்பு ரத்துசெய்யப்பட்டது.';

  @override
  String documentError(String error) {
    return 'மொழிபெயர்ப்பின்போது பிழை ஏற்பட்டது: $error';
  }

  @override
  String get tapToPickDocument => 'ஆவணத்தைத் தேர்ந்தெடுக்கத் தட்டவும்';

  @override
  String get saveLocation => 'சேமிக்கும் இடம்:';

  @override
  String get change => 'மாற்று…';

  @override
  String get pdfOcrTitle => 'PDF படங்களில் உள்ள உரையை மொழிபெயர் (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'ஸ்கேன் செய்த பக்கங்கள் மற்றும் வரைபடங்களுக்கு ML Kit OCR';

  @override
  String get sheetNamesShort => 'தாள் பெயர்களை மொழிபெயர்';

  @override
  String get translateDocument => 'ஆவணத்தை மொழிபெயர்';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get preparing => 'மொழிபெயர்ப்பைத் தயார்செய்கிறது...';

  @override
  String progressLine(int done, int total) {
    return 'வரி $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'பத்தி $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'பகிரப்பட்ட உரை $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'பக்கம் $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'பக்கம் $done/$total – படங்களில் உள்ள உரையைப் படிக்கிறது';
  }

  @override
  String get openFile => 'கோப்பைத் திற';

  @override
  String get share => 'பகிர்';

  @override
  String get selectSourceLanguage => 'மூல மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get selectTargetLanguage => 'இலக்கு மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get searchLanguage => 'மொழியைத் தேடு...';

  @override
  String get detectLanguage => 'மொழியைக் கண்டறி';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get aiModel => 'AI மாடல்';

  @override
  String get downloadModel => 'மாடலைப் பதிவிறக்கு (1.05 GB)';

  @override
  String get pickGguf => 'சாதனத்திலிருந்து .gguf தேர்ந்தெடு';

  @override
  String get cancelDownload => 'பதிவிறக்கத்தை ரத்துசெய்';

  @override
  String get defaultLanguages => 'இயல்புநிலை மொழிகள்';

  @override
  String get defaultSourceLanguage => 'இயல்புநிலை மூல மொழி';

  @override
  String get defaultTargetLanguage => 'இயல்புநிலை இலக்கு மொழி';

  @override
  String get documentsOcr => 'ஆவணங்கள் & OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR ஆதரவு';

  @override
  String get pdfOcrSupportDesc =>
      'ஸ்கேன் செய்த PDF மற்றும் படங்களில் உள்ள உரையை மொழிபெயர்';

  @override
  String get sheetNames => 'Excel தாள் பெயர்களை மொழிபெயர்';

  @override
  String get sheetNamesDesc =>
      'விரிதாள் தத்தல்களின் தலைப்புகளையும் மொழிபெயர்க்கும்';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get appTheme => 'ஆப் தீம்';

  @override
  String get themeSystem => 'சிஸ்டம்';

  @override
  String get themeLight => 'வெளிர்';

  @override
  String get themeDark => 'இருண்ட';

  @override
  String get appLanguage => 'ஆப் மொழி';

  @override
  String get systemDefault => 'சிஸ்டம் இயல்புநிலை';

  @override
  String get about => 'பற்றி';

  @override
  String get aboutDescription =>
      'முழுவதும் ஆஃப்லைனில், சாதனத்திலேயே இயங்கும் AI மொழிபெயர்ப்பு ஆப். Tencent HunYuan MT2 1.8B மாடல் மற்றும் llama.cpp FFI இன்ஜினால் இயக்கப்படுகிறது. எந்த உரையோ ஆவணமோ இணையத்திற்கு அனுப்பப்படுவதில்லை.';

  @override
  String get modelNotInstalled => 'மாடல் நிறுவப்படவில்லை';

  @override
  String get modelNotDownloaded => 'மாடல் இன்னும் பதிவிறக்கப்படவில்லை';

  @override
  String modelFileNotFound(String path) {
    return 'மாடல் கோப்பு கிடைக்கவில்லை: $path';
  }

  @override
  String get modelLoading => 'மாடலை நினைவகத்தில் ஏற்றுகிறது...';

  @override
  String get modelReady => 'மாடல் தயார் (HunYuan MT2 1.8B ஆஃப்லைன்)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'கோப்பைத் தேர்ந்தெடுக்கும்போது பிழை: $error';
  }

  @override
  String get downloadStarting => 'பதிவிறக்கத்தைத் தொடங்குகிறது...';

  @override
  String get downloadCancelledKept =>
      'பதிவிறக்கம் ரத்துசெய்யப்பட்டது (முன்னேற்றம் சேமிக்கப்பட்டது)';

  @override
  String downloadingPercent(String percent) {
    return 'பதிவிறக்குகிறது: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 சரிபார்க்கிறது...';

  @override
  String get downloadCompleteLoading =>
      'பதிவிறக்கம் முடிந்தது, மாடலை ஏற்றுகிறது...';

  @override
  String get downloadCancelled => 'பதிவிறக்கம் ரத்துசெய்யப்பட்டது';

  @override
  String downloadError(String error) {
    return 'பதிவிறக்கப் பிழை: $error';
  }

  @override
  String get cancellingDownload => 'பதிவிறக்கத்தை ரத்துசெய்கிறது...';

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
