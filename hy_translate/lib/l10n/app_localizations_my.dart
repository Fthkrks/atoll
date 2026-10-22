// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get navText => 'စာသား';

  @override
  String get navDocuments => 'စာရွက်စာတမ်းများ';

  @override
  String get navSettings => 'ဆက်တင်များ';

  @override
  String get madeBy => '4pp က ပြုလုပ်သည်';

  @override
  String get modelRequired =>
      'ဘာသာပြန်မည့်အရင် မော်ဒယ်ကို ဒေါင်းလုဒ်လုပ်ရန် သို့မဟုတ် ရွေးချယ်ရန် လိုအပ်ပါသည်။';

  @override
  String translationError(String error) {
    return 'ဘာသာပြန်ချက် အမှား- $error';
  }

  @override
  String genericError(String error) {
    return 'အမှား- $error';
  }

  @override
  String get download => 'ဒေါင်းလုဒ်';

  @override
  String get swapLanguages => 'ဘာသာစကားများ လဲလှယ်ရန်';

  @override
  String get clear => 'ရှင်းလင်းရန်';

  @override
  String get inputHint => 'စာသား ရိုက်ထည့်ပါ...';

  @override
  String get translate => 'ဘာသာပြန်ရန်';

  @override
  String get copyToClipboard => 'ကလစ်ဘုတ်သို့ ကူးယူရန်';

  @override
  String get translationCopied => 'ဘာသာပြန်ချက်ကို ကလစ်ဘုတ်သို့ ကူးယူပြီးပါပြီ';

  @override
  String get translating => 'ဘာသာပြန်နေသည်...';

  @override
  String get translationPlaceholder => 'ဘာသာပြန်ချက် ဤနေရာတွင် ပေါ်ပါမည်';

  @override
  String get documentTitle => 'စာရွက်စာတမ်း ဘာသာပြန်ခြင်း';

  @override
  String pickFileError(String error) {
    return 'ဖိုင်ကို ရွေး၍မရပါ- $error';
  }

  @override
  String get chooseSaveFolder => 'သိမ်းဆည်းမည့် ဖိုလ်ဒါကို ရွေးပါ';

  @override
  String get unsupportedFormat => 'ဤဖိုင်ပုံစံကို ပံ့ပိုးမထားပါ။';

  @override
  String get documentDone => 'စာရွက်စာတမ်းကို အောင်မြင်စွာ ဘာသာပြန်ပြီးပါပြီ။';

  @override
  String get translationCancelled => 'ဘာသာပြန်ခြင်းကို ပယ်ဖျက်လိုက်ပါပြီ။';

  @override
  String documentError(String error) {
    return 'ဘာသာပြန်နေစဉ် အမှားတစ်ခု ဖြစ်ပွားခဲ့သည်- $error';
  }

  @override
  String get tapToPickDocument => 'စာရွက်စာတမ်း ရွေးရန် ထိပါ';

  @override
  String get saveLocation => 'သိမ်းဆည်းမည့်နေရာ-';

  @override
  String get change => 'ပြောင်းရန်…';

  @override
  String get pdfOcrTitle => 'PDF ပုံများထဲရှိ စာသားကို ဘာသာပြန်ရန် (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'စကင်ဖတ်ထားသော စာမျက်နှာများနှင့် ပုံကြမ်းများအတွက် ML Kit OCR';

  @override
  String get sheetNamesShort => 'စာရွက်အမည်များကို ဘာသာပြန်ရန်';

  @override
  String get translateDocument => 'စာရွက်စာတမ်းကို ဘာသာပြန်ရန်';

  @override
  String get cancel => 'ပယ်ဖျက်ရန်';

  @override
  String get preparing => 'ဘာသာပြန်ခြင်းကို ပြင်ဆင်နေသည်...';

  @override
  String progressLine(int done, int total) {
    return 'စာကြောင်း $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'စာပိုဒ် $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'မျှဝေထားသော စာသား $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'စာမျက်နှာ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'စာမျက်နှာ $done/$total – ပုံများထဲရှိ စာသားကို ဖတ်နေသည်';
  }

  @override
  String get openFile => 'ဖိုင်ဖွင့်ရန်';

  @override
  String get share => 'မျှဝေရန်';

  @override
  String get selectSourceLanguage => 'ရင်းမြစ်ဘာသာစကား ရွေးပါ';

  @override
  String get selectTargetLanguage => 'ပန်းတိုင်ဘာသာစကား ရွေးပါ';

  @override
  String get searchLanguage => 'ဘာသာစကား ရှာရန်...';

  @override
  String get detectLanguage => 'ဘာသာစကား သိရှိရန်';

  @override
  String get settingsTitle => 'ဆက်တင်များ';

  @override
  String get aiModel => 'AI မော်ဒယ်';

  @override
  String get downloadModel => 'မော်ဒယ် ဒေါင်းလုဒ်လုပ်ရန် (1.05 GB)';

  @override
  String get pickGguf => 'စက်ထဲမှ .gguf ရွေးရန်';

  @override
  String get cancelDownload => 'ဒေါင်းလုဒ်ကို ပယ်ဖျက်ရန်';

  @override
  String get defaultLanguages => 'မူလဘာသာစကားများ';

  @override
  String get defaultSourceLanguage => 'မူလ ရင်းမြစ်ဘာသာစကား';

  @override
  String get defaultTargetLanguage => 'မူလ ပန်းတိုင်ဘာသာစကား';

  @override
  String get documentsOcr => 'စာရွက်စာတမ်းများနှင့် OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR ပံ့ပိုးမှု';

  @override
  String get pdfOcrSupportDesc =>
      'စကင်ဖတ်ထားသော PDF နှင့် ပုံများထဲရှိ စာသားကို ဘာသာပြန်ရန်';

  @override
  String get sheetNames => 'Excel စာရွက်အမည်များကို ဘာသာပြန်ရန်';

  @override
  String get sheetNamesDesc =>
      'စာရင်းဇယားတက်ဘ်များ၏ ခေါင်းစဉ်များကိုပါ ဘာသာပြန်ပေးသည်';

  @override
  String get appearance => 'အသွင်အပြင်';

  @override
  String get appTheme => 'အက်ပ်အပြင်အဆင်';

  @override
  String get themeSystem => 'စနစ်';

  @override
  String get themeLight => 'အလင်း';

  @override
  String get themeDark => 'အမှောင်';

  @override
  String get appLanguage => 'အက်ပ်ဘာသာစကား';

  @override
  String get systemDefault => 'စနစ်၏ မူလအတိုင်း';

  @override
  String get about => 'အကြောင်း';

  @override
  String get aboutDescription =>
      'အင်တာနက်မလိုဘဲ စက်ပေါ်တွင်ပင် အပြည့်အဝ အလုပ်လုပ်သော AI ဘာသာပြန်အက်ပ် ဖြစ်သည်။ Tencent HunYuan MT2 1.8B မော်ဒယ်နှင့် llama.cpp FFI အင်ဂျင်တို့ဖြင့် လည်ပတ်သည်။ မည်သည့်စာသား သို့မဟုတ် စာရွက်စာတမ်းကိုမျှ အင်တာနက်သို့ မပို့ပါ။';

  @override
  String get modelNotInstalled => 'မော်ဒယ် မထည့်သွင်းရသေးပါ';

  @override
  String get modelNotDownloaded => 'မော်ဒယ်ကို မဒေါင်းလုဒ်လုပ်ရသေးပါ';

  @override
  String modelFileNotFound(String path) {
    return 'မော်ဒယ်ဖိုင် ရှာမတွေ့ပါ- $path';
  }

  @override
  String get modelLoading => 'မော်ဒယ်ကို မှတ်ဉာဏ်ထဲသို့ ထည့်နေသည်...';

  @override
  String get modelReady =>
      'မော်ဒယ် အဆင်သင့်ဖြစ်ပါပြီ (HunYuan MT2 1.8B အော့ဖ်လိုင်း)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ဖိုင်ရွေးချယ်ရာတွင် အမှား- $error';
  }

  @override
  String get downloadStarting => 'ဒေါင်းလုဒ် စတင်နေသည်...';

  @override
  String get downloadCancelledKept =>
      'ဒေါင်းလုဒ်ကို ပယ်ဖျက်လိုက်ပါပြီ (တိုးတက်မှုကို သိမ်းထားသည်)';

  @override
  String downloadingPercent(String percent) {
    return 'ဒေါင်းလုဒ်လုပ်နေသည်- $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 စစ်ဆေးနေသည်...';

  @override
  String get downloadCompleteLoading =>
      'ဒေါင်းလုဒ်ပြီးပါပြီ၊ မော်ဒယ်ကို ထည့်သွင်းနေသည်...';

  @override
  String get downloadCancelled => 'ဒေါင်းလုဒ်ကို ပယ်ဖျက်လိုက်ပါပြီ';

  @override
  String downloadError(String error) {
    return 'ဒေါင်းလုဒ် အမှား- $error';
  }

  @override
  String get cancellingDownload => 'ဒေါင်းလုဒ်ကို ပယ်ဖျက်နေသည်...';

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
