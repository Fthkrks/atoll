// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get navText => 'Текст';

  @override
  String get navDocuments => 'Документы';

  @override
  String get navSettings => 'Настройки';

  @override
  String get madeBy => 'Создано 4pp';

  @override
  String get modelRequired =>
      'Перед переводом нужно скачать или выбрать модель.';

  @override
  String translationError(String error) {
    return 'Ошибка перевода: $error';
  }

  @override
  String genericError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get download => 'Скачать';

  @override
  String get swapLanguages => 'Поменять языки местами';

  @override
  String get clear => 'Очистить';

  @override
  String get inputHint => 'Введите текст...';

  @override
  String get translate => 'Перевести';

  @override
  String get copyToClipboard => 'Копировать в буфер обмена';

  @override
  String get translationCopied => 'Перевод скопирован в буфер обмена';

  @override
  String get translating => 'Перевод...';

  @override
  String get translationPlaceholder => 'Здесь появится перевод';

  @override
  String get documentTitle => 'Перевод документов';

  @override
  String pickFileError(String error) {
    return 'Не удалось выбрать файл: $error';
  }

  @override
  String get chooseSaveFolder => 'Выберите папку для сохранения';

  @override
  String get unsupportedFormat => 'Этот формат файла не поддерживается.';

  @override
  String get documentDone => 'Документ успешно переведён!';

  @override
  String get translationCancelled => 'Перевод отменён.';

  @override
  String documentError(String error) {
    return 'Во время перевода произошла ошибка: $error';
  }

  @override
  String get tapToPickDocument => 'Нажмите, чтобы выбрать документ';

  @override
  String get saveLocation => 'Место сохранения:';

  @override
  String get change => 'Изменить…';

  @override
  String get pdfOcrTitle => 'Переводить текст на изображениях в PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'OCR ML Kit для отсканированных страниц и схем';

  @override
  String get sheetNamesShort => 'Переводить названия листов';

  @override
  String get translateDocument => 'Перевести документ';

  @override
  String get cancel => 'Отмена';

  @override
  String get preparing => 'Подготовка перевода...';

  @override
  String progressLine(int done, int total) {
    return 'Строка $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Абзац $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Общий текст $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Страница $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Страница $done/$total – чтение текста на изображениях';
  }

  @override
  String get openFile => 'Открыть файл';

  @override
  String get share => 'Поделиться';

  @override
  String get selectSourceLanguage => 'Выберите исходный язык';

  @override
  String get selectTargetLanguage => 'Выберите язык перевода';

  @override
  String get searchLanguage => 'Поиск языка...';

  @override
  String get detectLanguage => 'Определить язык';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get aiModel => 'Модель ИИ';

  @override
  String get downloadModel => 'Скачать модель (1,05 ГБ)';

  @override
  String get pickGguf => 'Выбрать .gguf на устройстве';

  @override
  String get cancelDownload => 'Отменить загрузку';

  @override
  String get defaultLanguages => 'Языки по умолчанию';

  @override
  String get defaultSourceLanguage => 'Исходный язык по умолчанию';

  @override
  String get defaultTargetLanguage => 'Язык перевода по умолчанию';

  @override
  String get documentsOcr => 'Документы и OCR';

  @override
  String get pdfOcrSupport => 'Поддержка OCR для PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Переводить текст в отсканированных PDF и изображениях';

  @override
  String get sheetNames => 'Переводить названия листов Excel';

  @override
  String get sheetNamesDesc => 'Также переводит названия вкладок таблицы';

  @override
  String get appearance => 'Оформление';

  @override
  String get appTheme => 'Тема приложения';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get appLanguage => 'Язык приложения';

  @override
  String get systemDefault => 'Как в системе';

  @override
  String get about => 'О приложении';

  @override
  String get aboutDescription =>
      'Полностью автономное приложение для перевода с ИИ, работающее на устройстве. Основано на модели Tencent HunYuan MT2 1.8B и движке llama.cpp FFI. Никакие тексты или документы не отправляются в интернет.';

  @override
  String get modelNotInstalled => 'Модель не установлена';

  @override
  String get modelNotDownloaded => 'Модель ещё не скачана';

  @override
  String modelFileNotFound(String path) {
    return 'Файл модели не найден: $path';
  }

  @override
  String get modelLoading => 'Загрузка модели в память...';

  @override
  String get modelReady => 'Модель готова (HunYuan MT2 1.8B, офлайн)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Ошибка при выборе файла: $error';
  }

  @override
  String get downloadStarting => 'Запуск загрузки...';

  @override
  String get downloadCancelledKept => 'Загрузка отменена (прогресс сохранён)';

  @override
  String downloadingPercent(String percent) {
    return 'Загрузка: $percent%';
  }

  @override
  String get verifyingSha => 'Проверка SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Загрузка завершена, модель загружается...';

  @override
  String get downloadCancelled => 'Загрузка отменена';

  @override
  String downloadError(String error) {
    return 'Ошибка загрузки: $error';
  }

  @override
  String get cancellingDownload => 'Отмена загрузки...';

  @override
  String get onboardingHeadline => 'Перевод без интернета';

  @override
  String get onboardingBenefitOffline =>
      'Работает полностью офлайн после настройки';

  @override
  String get onboardingBenefitPrivate =>
      'Конфиденциально, данные не покидают устройство';

  @override
  String get onboardingBenefitFormats => 'Перевод текста и документов';

  @override
  String onboardingSizeNote(String size) {
    return 'Однократная загрузка: около $size ГБ. Рекомендуется Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Скачать модель';

  @override
  String get onboardingBackgroundNote =>
      'Вы можете свернуть приложение; загрузка возобновится с места остановки.';

  @override
  String get onboardingTryAgain => 'Повторить';

  @override
  String get onboardingHaveGguf => 'У меня уже есть файл .gguf';

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
