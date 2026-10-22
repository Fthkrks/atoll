// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navText => 'Texto';

  @override
  String get navDocuments => 'Documentos';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get madeBy => 'Hecho por 4pp';

  @override
  String get modelRequired =>
      'Hay que descargar o seleccionar el modelo antes de traducir.';

  @override
  String translationError(String error) {
    return 'Error de traducción: $error';
  }

  @override
  String genericError(String error) {
    return 'Error: $error';
  }

  @override
  String get download => 'Descargar';

  @override
  String get swapLanguages => 'Intercambiar idiomas';

  @override
  String get clear => 'Borrar';

  @override
  String get inputHint => 'Escribe un texto...';

  @override
  String get translate => 'Traducir';

  @override
  String get copyToClipboard => 'Copiar al portapapeles';

  @override
  String get translationCopied => 'Traducción copiada al portapapeles';

  @override
  String get translating => 'Traduciendo...';

  @override
  String get translationPlaceholder => 'La traducción aparecerá aquí';

  @override
  String get documentTitle => 'Traducción de documentos';

  @override
  String pickFileError(String error) {
    return 'No se pudo elegir el archivo: $error';
  }

  @override
  String get chooseSaveFolder => 'Elegir carpeta de destino';

  @override
  String get unsupportedFormat => 'Este formato de archivo no es compatible.';

  @override
  String get documentDone => '¡Documento traducido correctamente!';

  @override
  String get translationCancelled => 'Traducción cancelada.';

  @override
  String documentError(String error) {
    return 'Se produjo un error durante la traducción: $error';
  }

  @override
  String get tapToPickDocument => 'Toca para elegir un documento';

  @override
  String get saveLocation => 'Ubicación de guardado:';

  @override
  String get change => 'Cambiar…';

  @override
  String get pdfOcrTitle => 'Traducir el texto de las imágenes del PDF (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'OCR de ML Kit para páginas escaneadas y diagramas';

  @override
  String get sheetNamesShort => 'Traducir nombres de hojas';

  @override
  String get translateDocument => 'Traducir documento';

  @override
  String get cancel => 'Cancelar';

  @override
  String get preparing => 'Preparando la traducción...';

  @override
  String progressLine(int done, int total) {
    return 'Línea $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Párrafo $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Texto compartido $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Página $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Página $done/$total – leyendo el texto de las imágenes';
  }

  @override
  String get openFile => 'Abrir archivo';

  @override
  String get share => 'Compartir';

  @override
  String get selectSourceLanguage => 'Elegir idioma de origen';

  @override
  String get selectTargetLanguage => 'Elegir idioma de destino';

  @override
  String get searchLanguage => 'Buscar idioma...';

  @override
  String get detectLanguage => 'Detectar idioma';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get aiModel => 'Modelo de IA';

  @override
  String get downloadModel => 'Descargar modelo (1,05 GB)';

  @override
  String get pickGguf => 'Elegir .gguf del dispositivo';

  @override
  String get cancelDownload => 'Cancelar descarga';

  @override
  String get defaultLanguages => 'Idiomas predeterminados';

  @override
  String get defaultSourceLanguage => 'Idioma de origen predeterminado';

  @override
  String get defaultTargetLanguage => 'Idioma de destino predeterminado';

  @override
  String get documentsOcr => 'Documentos y OCR';

  @override
  String get pdfOcrSupport => 'Compatibilidad con OCR en PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Traduce el texto de PDF escaneados e imágenes';

  @override
  String get sheetNames => 'Traducir nombres de hojas de Excel';

  @override
  String get sheetNamesDesc =>
      'También traduce los títulos de las pestañas de la hoja de cálculo';

  @override
  String get appearance => 'Apariencia';

  @override
  String get appTheme => 'Tema de la aplicación';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get appLanguage => 'Idioma de la aplicación';

  @override
  String get systemDefault => 'Predeterminado del sistema';

  @override
  String get about => 'Acerca de';

  @override
  String get aboutDescription =>
      'Aplicación de traducción con IA que funciona totalmente sin conexión y en el dispositivo. Impulsada por el modelo Tencent HunYuan MT2 1.8B y el motor FFI llama.cpp. Ningún texto ni documento se envía nunca a Internet.';

  @override
  String get modelNotInstalled => 'Modelo no instalado';

  @override
  String get modelNotDownloaded => 'El modelo aún no se ha descargado';

  @override
  String modelFileNotFound(String path) {
    return 'No se encontró el archivo del modelo: $path';
  }

  @override
  String get modelLoading => 'Cargando el modelo en la memoria...';

  @override
  String get modelReady => 'Modelo listo (HunYuan MT2 1.8B sin conexión)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Error al elegir el archivo: $error';
  }

  @override
  String get downloadStarting => 'Iniciando la descarga...';

  @override
  String get downloadCancelledKept =>
      'Descarga cancelada (se conservó el progreso)';

  @override
  String downloadingPercent(String percent) {
    return 'Descargando: $percent %';
  }

  @override
  String get verifyingSha => 'Verificando SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Descarga completada, cargando el modelo...';

  @override
  String get downloadCancelled => 'Descarga cancelada';

  @override
  String downloadError(String error) {
    return 'Error de descarga: $error';
  }

  @override
  String get cancellingDownload => 'Cancelando la descarga...';

  @override
  String get onboardingHeadline => 'Traduce sin internet';

  @override
  String get onboardingBenefitOffline =>
      'Funciona totalmente sin conexión tras la configuración';

  @override
  String get onboardingBenefitPrivate =>
      'Privado, ningún dato sale de tu dispositivo';

  @override
  String get onboardingBenefitFormats => 'Traduce texto y documentos';

  @override
  String onboardingSizeNote(String size) {
    return 'Descarga única: aprox. $size GB. Se recomienda Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Descargar modelo';

  @override
  String get onboardingBackgroundNote =>
      'Puedes salir de la app; la descarga se reanudará donde se quedó.';

  @override
  String get onboardingTryAgain => 'Reintentar';

  @override
  String get onboardingHaveGguf => 'Ya tengo un archivo .gguf';

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
