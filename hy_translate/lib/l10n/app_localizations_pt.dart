// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get navText => 'Texto';

  @override
  String get navDocuments => 'Documentos';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get madeBy => 'Feito por 4pp';

  @override
  String get modelRequired =>
      'É necessário baixar ou selecionar o modelo antes de traduzir.';

  @override
  String translationError(String error) {
    return 'Erro de tradução: $error';
  }

  @override
  String genericError(String error) {
    return 'Erro: $error';
  }

  @override
  String get download => 'Baixar';

  @override
  String get swapLanguages => 'Trocar idiomas';

  @override
  String get clear => 'Limpar';

  @override
  String get inputHint => 'Digite o texto...';

  @override
  String get translate => 'Traduzir';

  @override
  String get copyToClipboard => 'Copiar para a área de transferência';

  @override
  String get translationCopied =>
      'Tradução copiada para a área de transferência';

  @override
  String get translating => 'Traduzindo...';

  @override
  String get translationPlaceholder => 'A tradução aparecerá aqui';

  @override
  String get documentTitle => 'Tradução de documentos';

  @override
  String pickFileError(String error) {
    return 'Não foi possível escolher o arquivo: $error';
  }

  @override
  String get chooseSaveFolder => 'Escolher pasta de destino';

  @override
  String get unsupportedFormat => 'Este formato de arquivo não é compatível.';

  @override
  String get documentDone => 'Documento traduzido com sucesso!';

  @override
  String get translationCancelled => 'Tradução cancelada.';

  @override
  String documentError(String error) {
    return 'Ocorreu um erro durante a tradução: $error';
  }

  @override
  String get tapToPickDocument => 'Toque para escolher um documento';

  @override
  String get saveLocation => 'Local de salvamento:';

  @override
  String get change => 'Alterar…';

  @override
  String get pdfOcrTitle => 'Traduzir texto em imagens do PDF (OCR)';

  @override
  String get pdfOcrSubtitle =>
      'OCR do ML Kit para páginas digitalizadas e diagramas';

  @override
  String get sheetNamesShort => 'Traduzir nomes das planilhas';

  @override
  String get translateDocument => 'Traduzir documento';

  @override
  String get cancel => 'Cancelar';

  @override
  String get preparing => 'Preparando a tradução...';

  @override
  String progressLine(int done, int total) {
    return 'Linha $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Parágrafo $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Texto compartilhado $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Página $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Página $done/$total – lendo o texto das imagens';
  }

  @override
  String get openFile => 'Abrir arquivo';

  @override
  String get share => 'Compartilhar';

  @override
  String get selectSourceLanguage => 'Escolher idioma de origem';

  @override
  String get selectTargetLanguage => 'Escolher idioma de destino';

  @override
  String get searchLanguage => 'Pesquisar idioma...';

  @override
  String get detectLanguage => 'Detectar idioma';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get aiModel => 'Modelo de IA';

  @override
  String get downloadModel => 'Baixar modelo (1,05 GB)';

  @override
  String get pickGguf => 'Escolher .gguf do dispositivo';

  @override
  String get cancelDownload => 'Cancelar download';

  @override
  String get defaultLanguages => 'Idiomas padrão';

  @override
  String get defaultSourceLanguage => 'Idioma de origem padrão';

  @override
  String get defaultTargetLanguage => 'Idioma de destino padrão';

  @override
  String get documentsOcr => 'Documentos e OCR';

  @override
  String get pdfOcrSupport => 'Suporte a OCR em PDF';

  @override
  String get pdfOcrSupportDesc =>
      'Traduzir texto de PDFs digitalizados e imagens';

  @override
  String get sheetNames => 'Traduzir nomes das planilhas do Excel';

  @override
  String get sheetNamesDesc => 'Também traduz os títulos das abas da planilha';

  @override
  String get appearance => 'Aparência';

  @override
  String get appTheme => 'Tema do app';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get appLanguage => 'Idioma do app';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get about => 'Sobre';

  @override
  String get aboutDescription =>
      'App de tradução com IA totalmente offline e no próprio dispositivo. Desenvolvido com o modelo Tencent HunYuan MT2 1.8B e o motor FFI llama.cpp. Nenhum texto ou documento é enviado à internet.';

  @override
  String get modelNotInstalled => 'Modelo não instalado';

  @override
  String get modelNotDownloaded => 'Modelo ainda não baixado';

  @override
  String modelFileNotFound(String path) {
    return 'Arquivo do modelo não encontrado: $path';
  }

  @override
  String get modelLoading => 'Carregando o modelo na memória...';

  @override
  String get modelReady => 'Modelo pronto (HunYuan MT2 1.8B offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Erro ao escolher o arquivo: $error';
  }

  @override
  String get downloadStarting => 'Iniciando o download...';

  @override
  String get downloadCancelledKept => 'Download cancelado (progresso mantido)';

  @override
  String downloadingPercent(String percent) {
    return 'Baixando: $percent%';
  }

  @override
  String get verifyingSha => 'Verificando SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Download concluído, carregando o modelo...';

  @override
  String get downloadCancelled => 'Download cancelado';

  @override
  String downloadError(String error) {
    return 'Erro de download: $error';
  }

  @override
  String get cancellingDownload => 'Cancelando o download...';

  @override
  String get onboardingHeadline => 'Traduza sem internet';

  @override
  String get onboardingBenefitOffline =>
      'Funciona totalmente offline após a configuração';

  @override
  String get onboardingBenefitPrivate =>
      'Privado, nenhum dado sai do seu dispositivo';

  @override
  String get onboardingBenefitFormats => 'Traduza textos e documentos';

  @override
  String onboardingSizeNote(String size) {
    return 'Download único: cerca de $size GB. Wi-Fi recomendado.';
  }

  @override
  String get onboardingDownloadButton => 'Baixar modelo';

  @override
  String get onboardingBackgroundNote =>
      'Você pode sair do aplicativo; o download será retomado.';

  @override
  String get onboardingTryAgain => 'Tentar novamente';

  @override
  String get onboardingHaveGguf => 'Já tenho um arquivo .gguf';

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
