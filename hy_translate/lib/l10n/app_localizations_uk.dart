// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get navText => 'Текст';

  @override
  String get navDocuments => 'Документи';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get madeBy => 'Створено 4pp';

  @override
  String get modelRequired =>
      'Перед перекладом потрібно завантажити або вибрати модель.';

  @override
  String translationError(String error) {
    return 'Помилка перекладу: $error';
  }

  @override
  String genericError(String error) {
    return 'Помилка: $error';
  }

  @override
  String get download => 'Завантажити';

  @override
  String get swapLanguages => 'Поміняти мови місцями';

  @override
  String get clear => 'Очистити';

  @override
  String get inputHint => 'Введіть текст...';

  @override
  String get translate => 'Перекласти';

  @override
  String get copyToClipboard => 'Копіювати в буфер обміну';

  @override
  String get translationCopied => 'Переклад скопійовано в буфер обміну';

  @override
  String get translating => 'Триває переклад...';

  @override
  String get translationPlaceholder => 'Тут з’явиться переклад';

  @override
  String get documentTitle => 'Переклад документів';

  @override
  String pickFileError(String error) {
    return 'Не вдалося вибрати файл: $error';
  }

  @override
  String get chooseSaveFolder => 'Виберіть папку для збереження';

  @override
  String get unsupportedFormat => 'Цей формат файлу не підтримується.';

  @override
  String get documentDone => 'Документ успішно перекладено!';

  @override
  String get translationCancelled => 'Переклад скасовано.';

  @override
  String documentError(String error) {
    return 'Під час перекладу сталася помилка: $error';
  }

  @override
  String get tapToPickDocument => 'Торкніться, щоб вибрати документ';

  @override
  String get saveLocation => 'Місце збереження:';

  @override
  String get change => 'Змінити…';

  @override
  String get pdfOcrTitle => 'Перекладати текст на зображеннях у PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'OCR ML Kit для відсканованих сторінок і схем';

  @override
  String get sheetNamesShort => 'Перекладати назви аркушів';

  @override
  String get translateDocument => 'Перекласти документ';

  @override
  String get cancel => 'Скасувати';

  @override
  String get preparing => 'Підготовка перекладу...';

  @override
  String progressLine(int done, int total) {
    return 'Рядок $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Абзац $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Спільний текст $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Сторінка $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Сторінка $done/$total – читання тексту на зображеннях';
  }

  @override
  String get openFile => 'Відкрити файл';

  @override
  String get share => 'Поділитися';

  @override
  String get selectSourceLanguage => 'Виберіть мову оригіналу';

  @override
  String get selectTargetLanguage => 'Виберіть мову перекладу';

  @override
  String get searchLanguage => 'Пошук мови...';

  @override
  String get detectLanguage => 'Визначити мову';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get aiModel => 'Модель ШІ';

  @override
  String get downloadModel => 'Завантажити модель (1,05 ГБ)';

  @override
  String get pickGguf => 'Вибрати .gguf на пристрої';

  @override
  String get cancelDownload => 'Скасувати завантаження';

  @override
  String get defaultLanguages => 'Мови за замовчуванням';

  @override
  String get defaultSourceLanguage => 'Мова оригіналу за замовчуванням';

  @override
  String get defaultTargetLanguage => 'Мова перекладу за замовчуванням';

  @override
  String get documentsOcr => 'Документи й OCR';

  @override
  String get pdfOcrSupport => 'Підтримка OCR для PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Перекладати текст у відсканованих PDF та зображеннях';

  @override
  String get sheetNames => 'Перекладати назви аркушів Excel';

  @override
  String get sheetNamesDesc => 'Також перекладає назви вкладок таблиці';

  @override
  String get appearance => 'Вигляд';

  @override
  String get appTheme => 'Тема застосунку';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get appLanguage => 'Мова застосунку';

  @override
  String get systemDefault => 'Як у системі';

  @override
  String get about => 'Про застосунок';

  @override
  String get aboutDescription =>
      'Повністю автономний застосунок для перекладу зі ШІ, що працює на пристрої. Працює на моделі Tencent HunYuan MT2 1.8B та рушії llama.cpp FFI. Жодні тексти чи документи не надсилаються в інтернет.';

  @override
  String get modelNotInstalled => 'Модель не встановлено';

  @override
  String get modelNotDownloaded => 'Модель ще не завантажено';

  @override
  String modelFileNotFound(String path) {
    return 'Файл моделі не знайдено: $path';
  }

  @override
  String get modelLoading => 'Завантаження моделі в пам’ять...';

  @override
  String get modelReady => 'Модель готова (HunYuan MT2 1.8B, офлайн)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Помилка під час вибору файлу: $error';
  }

  @override
  String get downloadStarting => 'Початок завантаження...';

  @override
  String get downloadCancelledKept =>
      'Завантаження скасовано (прогрес збережено)';

  @override
  String downloadingPercent(String percent) {
    return 'Завантаження: $percent%';
  }

  @override
  String get verifyingSha => 'Перевірка SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Завантаження завершено, модель завантажується...';

  @override
  String get downloadCancelled => 'Завантаження скасовано';

  @override
  String downloadError(String error) {
    return 'Помилка завантаження: $error';
  }

  @override
  String get cancellingDownload => 'Скасування завантаження...';

  @override
  String get onboardingHeadline => 'Переклад без інтернету';

  @override
  String get onboardingBenefitOffline =>
      'Працює повністю офлайн після налаштування';

  @override
  String get onboardingBenefitPrivate =>
      'Конфіденційно, жодні дані не залишають ваш пристрій';

  @override
  String get onboardingBenefitFormats => 'Перекладайте текст та документи';

  @override
  String onboardingSizeNote(String size) {
    return 'Одноразове завантаження: близько $size ГБ. Рекомендовано Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Завантажити модель';

  @override
  String get onboardingBackgroundNote =>
      'Ви можете вийти з програми; завантаження відновиться з місця зупинки.';

  @override
  String get onboardingTryAgain => 'Спробувати знову';

  @override
  String get onboardingHaveGguf => 'У мене вже є файл .gguf';

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
