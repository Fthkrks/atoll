import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bo.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_yue.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('bo'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fil'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kk'),
    Locale('km'),
    Locale('ko'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('my'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('yue'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @navText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get navText;

  /// No description provided for @navDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get navDocuments;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Made by 4pp'**
  String get madeBy;

  /// No description provided for @modelRequired.
  ///
  /// In en, this message translates to:
  /// **'The model needs to be downloaded or selected before translating.'**
  String get modelRequired;

  /// No description provided for @translationError.
  ///
  /// In en, this message translates to:
  /// **'Translation error: {error}'**
  String translationError(String error);

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String genericError(String error);

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @swapLanguages.
  ///
  /// In en, this message translates to:
  /// **'Swap languages'**
  String get swapLanguages;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @inputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter text...'**
  String get inputHint;

  /// No description provided for @translate.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translate;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get copyToClipboard;

  /// No description provided for @translationCopied.
  ///
  /// In en, this message translates to:
  /// **'Translation copied to clipboard'**
  String get translationCopied;

  /// No description provided for @translating.
  ///
  /// In en, this message translates to:
  /// **'Translating...'**
  String get translating;

  /// No description provided for @translationPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'The translation will appear here'**
  String get translationPlaceholder;

  /// No description provided for @documentTitle.
  ///
  /// In en, this message translates to:
  /// **'Document translation'**
  String get documentTitle;

  /// No description provided for @pickFileError.
  ///
  /// In en, this message translates to:
  /// **'Could not pick the file: {error}'**
  String pickFileError(String error);

  /// No description provided for @chooseSaveFolder.
  ///
  /// In en, this message translates to:
  /// **'Choose save folder'**
  String get chooseSaveFolder;

  /// No description provided for @unsupportedFormat.
  ///
  /// In en, this message translates to:
  /// **'This file format is not supported.'**
  String get unsupportedFormat;

  /// No description provided for @documentDone.
  ///
  /// In en, this message translates to:
  /// **'Document translated successfully!'**
  String get documentDone;

  /// No description provided for @translationCancelled.
  ///
  /// In en, this message translates to:
  /// **'Translation cancelled.'**
  String get translationCancelled;

  /// No description provided for @documentError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during translation: {error}'**
  String documentError(String error);

  /// No description provided for @tapToPickDocument.
  ///
  /// In en, this message translates to:
  /// **'Tap to choose a document'**
  String get tapToPickDocument;

  /// No description provided for @saveLocation.
  ///
  /// In en, this message translates to:
  /// **'Save location:'**
  String get saveLocation;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change…'**
  String get change;

  /// No description provided for @pdfOcrTitle.
  ///
  /// In en, this message translates to:
  /// **'Translate text in PDF images (OCR)'**
  String get pdfOcrTitle;

  /// No description provided for @pdfOcrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ML Kit OCR for scanned pages and diagrams'**
  String get pdfOcrSubtitle;

  /// No description provided for @sheetNamesShort.
  ///
  /// In en, this message translates to:
  /// **'Translate sheet names'**
  String get sheetNamesShort;

  /// No description provided for @translateDocument.
  ///
  /// In en, this message translates to:
  /// **'Translate document'**
  String get translateDocument;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing translation...'**
  String get preparing;

  /// No description provided for @progressLine.
  ///
  /// In en, this message translates to:
  /// **'Line {done}/{total}'**
  String progressLine(int done, int total);

  /// No description provided for @progressParagraph.
  ///
  /// In en, this message translates to:
  /// **'Paragraph {done}/{total}'**
  String progressParagraph(int done, int total);

  /// No description provided for @progressSharedText.
  ///
  /// In en, this message translates to:
  /// **'Shared text {done}/{total}'**
  String progressSharedText(int done, int total);

  /// No description provided for @progressPage.
  ///
  /// In en, this message translates to:
  /// **'Page {done}/{total}'**
  String progressPage(int done, int total);

  /// No description provided for @progressPageOcr.
  ///
  /// In en, this message translates to:
  /// **'Page {done}/{total} – reading text in images'**
  String progressPageOcr(int done, int total);

  /// No description provided for @openFile.
  ///
  /// In en, this message translates to:
  /// **'Open file'**
  String get openFile;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @selectSourceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose source language'**
  String get selectSourceLanguage;

  /// No description provided for @selectTargetLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose target language'**
  String get selectTargetLanguage;

  /// No description provided for @searchLanguage.
  ///
  /// In en, this message translates to:
  /// **'Search language...'**
  String get searchLanguage;

  /// No description provided for @detectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Detect language'**
  String get detectLanguage;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @aiModel.
  ///
  /// In en, this message translates to:
  /// **'AI model'**
  String get aiModel;

  /// No description provided for @downloadModel.
  ///
  /// In en, this message translates to:
  /// **'Download model (1.05 GB)'**
  String get downloadModel;

  /// No description provided for @pickGguf.
  ///
  /// In en, this message translates to:
  /// **'Choose .gguf from device'**
  String get pickGguf;

  /// No description provided for @cancelDownload.
  ///
  /// In en, this message translates to:
  /// **'Cancel download'**
  String get cancelDownload;

  /// No description provided for @defaultLanguages.
  ///
  /// In en, this message translates to:
  /// **'Default languages'**
  String get defaultLanguages;

  /// No description provided for @defaultSourceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Default source language'**
  String get defaultSourceLanguage;

  /// No description provided for @defaultTargetLanguage.
  ///
  /// In en, this message translates to:
  /// **'Default target language'**
  String get defaultTargetLanguage;

  /// No description provided for @documentsOcr.
  ///
  /// In en, this message translates to:
  /// **'Documents & OCR'**
  String get documentsOcr;

  /// No description provided for @pdfOcrSupport.
  ///
  /// In en, this message translates to:
  /// **'PDF OCR support'**
  String get pdfOcrSupport;

  /// No description provided for @pdfOcrSupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Translate text in scanned PDFs and images'**
  String get pdfOcrSupportDesc;

  /// No description provided for @sheetNames.
  ///
  /// In en, this message translates to:
  /// **'Translate Excel sheet names'**
  String get sheetNames;

  /// No description provided for @sheetNamesDesc.
  ///
  /// In en, this message translates to:
  /// **'Also translates the titles of spreadsheet tabs'**
  String get sheetNamesDesc;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @appTheme.
  ///
  /// In en, this message translates to:
  /// **'App theme'**
  String get appTheme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Fully offline, on-device AI translation app. Powered by the Tencent HunYuan MT2 1.8B model and the llama.cpp FFI engine. No text or document is ever sent to the internet.'**
  String get aboutDescription;

  /// No description provided for @modelNotInstalled.
  ///
  /// In en, this message translates to:
  /// **'Model not installed'**
  String get modelNotInstalled;

  /// No description provided for @modelNotDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Model not downloaded yet'**
  String get modelNotDownloaded;

  /// No description provided for @modelFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Model file not found: {path}'**
  String modelFileNotFound(String path);

  /// No description provided for @modelLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading model into memory...'**
  String get modelLoading;

  /// No description provided for @modelReady.
  ///
  /// In en, this message translates to:
  /// **'Model ready (HunYuan MT2 1.8B Offline)'**
  String get modelReady;

  /// Short user-facing error message when model file fails to load
  ///
  /// In en, this message translates to:
  /// **'The model file could not be loaded. It may be damaged. Download it again or pick another file.'**
  String get modelLoadError;

  /// No description provided for @modelPickError.
  ///
  /// In en, this message translates to:
  /// **'Error while picking the file: {error}'**
  String modelPickError(String error);

  /// No description provided for @downloadStarting.
  ///
  /// In en, this message translates to:
  /// **'Starting download...'**
  String get downloadStarting;

  /// No description provided for @downloadCancelledKept.
  ///
  /// In en, this message translates to:
  /// **'Download cancelled (progress kept)'**
  String get downloadCancelledKept;

  /// No description provided for @downloadingPercent.
  ///
  /// In en, this message translates to:
  /// **'Downloading: {percent}%'**
  String downloadingPercent(String percent);

  /// No description provided for @verifyingSha.
  ///
  /// In en, this message translates to:
  /// **'Verifying SHA256...'**
  String get verifyingSha;

  /// No description provided for @downloadCompleteLoading.
  ///
  /// In en, this message translates to:
  /// **'Download complete, loading model...'**
  String get downloadCompleteLoading;

  /// No description provided for @downloadCancelled.
  ///
  /// In en, this message translates to:
  /// **'Download cancelled'**
  String get downloadCancelled;

  /// No description provided for @downloadError.
  ///
  /// In en, this message translates to:
  /// **'Download error: {error}'**
  String downloadError(String error);

  /// No description provided for @cancellingDownload.
  ///
  /// In en, this message translates to:
  /// **'Cancelling download...'**
  String get cancellingDownload;

  /// Headline on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Translate without internet'**
  String get onboardingHeadline;

  /// First benefit: offline usage
  ///
  /// In en, this message translates to:
  /// **'Works fully offline after setup'**
  String get onboardingBenefitOffline;

  /// Second benefit: privacy
  ///
  /// In en, this message translates to:
  /// **'Private, nothing leaves your device'**
  String get onboardingBenefitPrivate;

  /// Third benefit: text and documents
  ///
  /// In en, this message translates to:
  /// **'Translate text and documents'**
  String get onboardingBenefitFormats;

  /// Download size note with computed size
  ///
  /// In en, this message translates to:
  /// **'One-time download: about {size} GB. Wi-Fi recommended.'**
  String onboardingSizeNote(String size);

  /// Primary button to start model download
  ///
  /// In en, this message translates to:
  /// **'Download model'**
  String get onboardingDownloadButton;

  /// Note that download can be resumed if app is closed
  ///
  /// In en, this message translates to:
  /// **'You can leave the app; download will resume where you left off.'**
  String get onboardingBackgroundNote;

  /// Button to retry model download after error
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get onboardingTryAgain;

  /// Secondary button to pick a local gguf model file
  ///
  /// In en, this message translates to:
  /// **'I already have a .gguf file'**
  String get onboardingHaveGguf;

  /// Short error message when download fails due to network issues
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get downloadErrorNetwork;

  /// Short error message when download fails with HTTP error code
  ///
  /// In en, this message translates to:
  /// **'Server error ({code}). Please try again later.'**
  String downloadErrorServer(String code);

  /// Short error message when SHA256 checksum fails
  ///
  /// In en, this message translates to:
  /// **'Verification failed. The downloaded file is corrupted.'**
  String get downloadErrorVerification;

  /// Generic short error message for download failure
  ///
  /// In en, this message translates to:
  /// **'Download failed. Please try again.'**
  String get downloadErrorGeneric;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'bo',
    'cs',
    'de',
    'en',
    'es',
    'fa',
    'fil',
    'fr',
    'gu',
    'he',
    'hi',
    'id',
    'it',
    'ja',
    'kk',
    'km',
    'ko',
    'mn',
    'mr',
    'ms',
    'my',
    'nl',
    'pl',
    'pt',
    'ru',
    'ta',
    'te',
    'th',
    'tr',
    'ug',
    'uk',
    'ur',
    'vi',
    'yue',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'bo':
      return AppLocalizationsBo();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kk':
      return AppLocalizationsKk();
    case 'km':
      return AppLocalizationsKm();
    case 'ko':
      return AppLocalizationsKo();
    case 'mn':
      return AppLocalizationsMn();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'my':
      return AppLocalizationsMy();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'yue':
      return AppLocalizationsYue();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
