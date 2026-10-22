// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class AppLocalizationsKm extends AppLocalizations {
  AppLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get navText => 'អត្ថបទ';

  @override
  String get navDocuments => 'ឯកសារ';

  @override
  String get navSettings => 'ការកំណត់';

  @override
  String get madeBy => 'បង្កើតដោយ 4pp';

  @override
  String get modelRequired =>
      'ត្រូវទាញយក ឬជ្រើសរើសម៉ូដែលជាមុនសិន មុនពេលបកប្រែ។';

  @override
  String translationError(String error) {
    return 'កំហុសក្នុងការបកប្រែ៖ $error';
  }

  @override
  String genericError(String error) {
    return 'កំហុស៖ $error';
  }

  @override
  String get download => 'ទាញយក';

  @override
  String get swapLanguages => 'ប្ដូរភាសា';

  @override
  String get clear => 'សម្អាត';

  @override
  String get inputHint => 'បញ្ចូលអត្ថបទ...';

  @override
  String get translate => 'បកប្រែ';

  @override
  String get copyToClipboard => 'ចម្លងទៅក្ដារតម្បៀតខ្ទាស់';

  @override
  String get translationCopied => 'បានចម្លងការបកប្រែទៅក្ដារតម្បៀតខ្ទាស់';

  @override
  String get translating => 'កំពុងបកប្រែ...';

  @override
  String get translationPlaceholder => 'ការបកប្រែនឹងបង្ហាញនៅទីនេះ';

  @override
  String get documentTitle => 'ការបកប្រែឯកសារ';

  @override
  String pickFileError(String error) {
    return 'មិនអាចជ្រើសរើសឯកសារបាន៖ $error';
  }

  @override
  String get chooseSaveFolder => 'ជ្រើសរើសថតសម្រាប់រក្សាទុក';

  @override
  String get unsupportedFormat => 'មិនគាំទ្រទម្រង់ឯកសារនេះទេ។';

  @override
  String get documentDone => 'បានបកប្រែឯកសារដោយជោគជ័យ!';

  @override
  String get translationCancelled => 'បានបោះបង់ការបកប្រែ។';

  @override
  String documentError(String error) {
    return 'មានកំហុសកើតឡើងអំឡុងពេលបកប្រែ៖ $error';
  }

  @override
  String get tapToPickDocument => 'ចុចដើម្បីជ្រើសរើសឯកសារ';

  @override
  String get saveLocation => 'ទីតាំងរក្សាទុក៖';

  @override
  String get change => 'ប្ដូរ…';

  @override
  String get pdfOcrTitle => 'បកប្រែអត្ថបទក្នុងរូបភាពរបស់ PDF (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'ML Kit OCR សម្រាប់ទំព័រដែលបានស្កេន និងដ្យាក្រាម';

  @override
  String get sheetNamesShort => 'បកប្រែឈ្មោះសន្លឹក';

  @override
  String get translateDocument => 'បកប្រែឯកសារ';

  @override
  String get cancel => 'បោះបង់';

  @override
  String get preparing => 'កំពុងរៀបចំការបកប្រែ...';

  @override
  String progressLine(int done, int total) {
    return 'បន្ទាត់ $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'កថាខណ្ឌ $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'អត្ថបទដែលបានចែករំលែក $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'ទំព័រ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'ទំព័រ $done/$total – កំពុងអានអត្ថបទក្នុងរូបភាព';
  }

  @override
  String get openFile => 'បើកឯកសារ';

  @override
  String get share => 'ចែករំលែក';

  @override
  String get selectSourceLanguage => 'ជ្រើសរើសភាសាប្រភព';

  @override
  String get selectTargetLanguage => 'ជ្រើសរើសភាសាគោលដៅ';

  @override
  String get searchLanguage => 'ស្វែងរកភាសា...';

  @override
  String get detectLanguage => 'រកឃើញភាសា';

  @override
  String get settingsTitle => 'ការកំណត់';

  @override
  String get aiModel => 'ម៉ូដែល AI';

  @override
  String get downloadModel => 'ទាញយកម៉ូដែល (1.05 GB)';

  @override
  String get pickGguf => 'ជ្រើសរើស .gguf ពីឧបករណ៍';

  @override
  String get cancelDownload => 'បោះបង់ការទាញយក';

  @override
  String get defaultLanguages => 'ភាសាលំនាំដើម';

  @override
  String get defaultSourceLanguage => 'ភាសាប្រភពលំនាំដើម';

  @override
  String get defaultTargetLanguage => 'ភាសាគោលដៅលំនាំដើម';

  @override
  String get documentsOcr => 'ឯកសារ និង OCR';

  @override
  String get pdfOcrSupport => 'ការគាំទ្រ PDF OCR';

  @override
  String get pdfOcrSupportDesc => 'បកប្រែអត្ថបទក្នុង PDF ដែលបានស្កេន និងរូបភាព';

  @override
  String get sheetNames => 'បកប្រែឈ្មោះសន្លឹករបស់ Excel';

  @override
  String get sheetNamesDesc => 'បកប្រែចំណងជើងផ្ទាំងរបស់សៀវភៅបញ្ជីផងដែរ';

  @override
  String get appearance => 'រូបរាង';

  @override
  String get appTheme => 'ស្បែកកម្មវិធី';

  @override
  String get themeSystem => 'ប្រព័ន្ធ';

  @override
  String get themeLight => 'ភ្លឺ';

  @override
  String get themeDark => 'ងងឹត';

  @override
  String get appLanguage => 'ភាសាកម្មវិធី';

  @override
  String get systemDefault => 'លំនាំដើមរបស់ប្រព័ន្ធ';

  @override
  String get about => 'អំពី';

  @override
  String get aboutDescription =>
      'កម្មវិធីបកប្រែដោយ AI ដែលដំណើរការលើឧបករណ៍ទាំងស្រុងដោយគ្មានអ៊ីនធឺណិត។ ដំណើរការដោយម៉ូដែល Tencent HunYuan MT2 1.8B និងម៉ាស៊ីន llama.cpp FFI។ គ្មានអត្ថបទ ឬឯកសារណាត្រូវបានផ្ញើទៅអ៊ីនធឺណិតឡើយ។';

  @override
  String get modelNotInstalled => 'មិនទាន់បានដំឡើងម៉ូដែល';

  @override
  String get modelNotDownloaded => 'មិនទាន់បានទាញយកម៉ូដែល';

  @override
  String modelFileNotFound(String path) {
    return 'រកមិនឃើញឯកសារម៉ូដែល៖ $path';
  }

  @override
  String get modelLoading => 'កំពុងផ្ទុកម៉ូដែលចូលក្នុងអង្គចងចាំ...';

  @override
  String get modelReady => 'ម៉ូដែលរួចរាល់ (HunYuan MT2 1.8B ក្រៅបណ្ដាញ)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'កំហុសពេលជ្រើសរើសឯកសារ៖ $error';
  }

  @override
  String get downloadStarting => 'កំពុងចាប់ផ្ដើមទាញយក...';

  @override
  String get downloadCancelledKept => 'បានបោះបង់ការទាញយក (រក្សាទុកដំណើរការ)';

  @override
  String downloadingPercent(String percent) {
    return 'កំពុងទាញយក៖ $percent%';
  }

  @override
  String get verifyingSha => 'កំពុងផ្ទៀងផ្ទាត់ SHA256...';

  @override
  String get downloadCompleteLoading => 'ការទាញយករួចរាល់ កំពុងផ្ទុកម៉ូដែល...';

  @override
  String get downloadCancelled => 'បានបោះបង់ការទាញយក';

  @override
  String downloadError(String error) {
    return 'កំហុសក្នុងការទាញយក៖ $error';
  }

  @override
  String get cancellingDownload => 'កំពុងបោះបង់ការទាញយក...';

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
