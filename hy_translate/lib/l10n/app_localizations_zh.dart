// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get navText => '文本';

  @override
  String get navDocuments => '文档';

  @override
  String get navSettings => '设置';

  @override
  String get madeBy => '由 4pp 制作';

  @override
  String get modelRequired => '翻译前需要先下载或选择模型。';

  @override
  String translationError(String error) {
    return '翻译出错：$error';
  }

  @override
  String genericError(String error) {
    return '错误：$error';
  }

  @override
  String get download => '下载';

  @override
  String get swapLanguages => '互换语言';

  @override
  String get clear => '清除';

  @override
  String get inputHint => '输入文本...';

  @override
  String get translate => '翻译';

  @override
  String get copyToClipboard => '复制到剪贴板';

  @override
  String get translationCopied => '译文已复制到剪贴板';

  @override
  String get translating => '正在翻译...';

  @override
  String get translationPlaceholder => '译文将显示在这里';

  @override
  String get documentTitle => '文档翻译';

  @override
  String pickFileError(String error) {
    return '无法选择文件：$error';
  }

  @override
  String get chooseSaveFolder => '选择保存文件夹';

  @override
  String get unsupportedFormat => '不支持此文件格式。';

  @override
  String get documentDone => '文档翻译成功！';

  @override
  String get translationCancelled => '翻译已取消。';

  @override
  String documentError(String error) {
    return '翻译过程中出错：$error';
  }

  @override
  String get tapToPickDocument => '点按以选择文档';

  @override
  String get saveLocation => '保存位置：';

  @override
  String get change => '更改…';

  @override
  String get pdfOcrTitle => '翻译 PDF 图片中的文字 (OCR)';

  @override
  String get pdfOcrSubtitle => '使用 ML Kit OCR 处理扫描页面和图表';

  @override
  String get sheetNamesShort => '翻译工作表名称';

  @override
  String get translateDocument => '翻译文档';

  @override
  String get cancel => '取消';

  @override
  String get preparing => '正在准备翻译...';

  @override
  String progressLine(int done, int total) {
    return '第 $done/$total 行';
  }

  @override
  String progressParagraph(int done, int total) {
    return '第 $done/$total 段';
  }

  @override
  String progressSharedText(int done, int total) {
    return '共享文本 $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return '第 $done/$total 页';
  }

  @override
  String progressPageOcr(int done, int total) {
    return '第 $done/$total 页 – 正在识别图片中的文字';
  }

  @override
  String get openFile => '打开文件';

  @override
  String get share => '分享';

  @override
  String get selectSourceLanguage => '选择源语言';

  @override
  String get selectTargetLanguage => '选择目标语言';

  @override
  String get searchLanguage => '搜索语言...';

  @override
  String get detectLanguage => '检测语言';

  @override
  String get settingsTitle => '设置';

  @override
  String get aiModel => 'AI 模型';

  @override
  String get downloadModel => '下载模型 (1.05 GB)';

  @override
  String get pickGguf => '从设备选择 .gguf';

  @override
  String get cancelDownload => '取消下载';

  @override
  String get defaultLanguages => '默认语言';

  @override
  String get defaultSourceLanguage => '默认源语言';

  @override
  String get defaultTargetLanguage => '默认目标语言';

  @override
  String get documentsOcr => '文档与 OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR 支持';

  @override
  String get pdfOcrSupportDesc => '翻译扫描版 PDF 和图片中的文字';

  @override
  String get sheetNames => '翻译 Excel 工作表名称';

  @override
  String get sheetNamesDesc => '同时翻译表格标签页的标题';

  @override
  String get appearance => '外观';

  @override
  String get appTheme => '应用主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get appLanguage => '应用语言';

  @override
  String get systemDefault => '跟随系统';

  @override
  String get about => '关于';

  @override
  String get aboutDescription =>
      '完全离线、在设备上运行的 AI 翻译应用。由腾讯混元 MT2 1.8B 模型和 llama.cpp FFI 引擎提供支持。任何文本或文档都不会发送到互联网。';

  @override
  String get modelNotInstalled => '未安装模型';

  @override
  String get modelNotDownloaded => '尚未下载模型';

  @override
  String modelFileNotFound(String path) {
    return '找不到模型文件：$path';
  }

  @override
  String get modelLoading => '正在将模型加载到内存...';

  @override
  String get modelReady => '模型已就绪 (HunYuan MT2 1.8B 离线)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return '选择文件时出错：$error';
  }

  @override
  String get downloadStarting => '正在开始下载...';

  @override
  String get downloadCancelledKept => '下载已取消（已保留进度）';

  @override
  String downloadingPercent(String percent) {
    return '正在下载：$percent%';
  }

  @override
  String get verifyingSha => '正在校验 SHA256...';

  @override
  String get downloadCompleteLoading => '下载完成，正在加载模型...';

  @override
  String get downloadCancelled => '下载已取消';

  @override
  String downloadError(String error) {
    return '下载出错：$error';
  }

  @override
  String get cancellingDownload => '正在取消下载...';

  @override
  String get onboardingHeadline => '无需网络，离线翻译';

  @override
  String get onboardingBenefitOffline => '设置完成后完全离线运行';

  @override
  String get onboardingBenefitPrivate => '保护隐私，任何数据都不会离开您的设备';

  @override
  String get onboardingBenefitFormats => '支持文本与文档翻译';

  @override
  String onboardingSizeNote(String size) {
    return '单次下载：约 $size GB。建议使用 Wi-Fi。';
  }

  @override
  String get onboardingDownloadButton => '下载模型';

  @override
  String get onboardingBackgroundNote => '您可以离开应用，下载将从断点处继续。';

  @override
  String get onboardingTryAgain => '重试';

  @override
  String get onboardingHaveGguf => '我已有 .gguf 文件';

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

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get navText => '文字';

  @override
  String get navDocuments => '文件';

  @override
  String get navSettings => '設定';

  @override
  String get madeBy => '由 4pp 製作';

  @override
  String get modelRequired => '翻譯前需要先下載或選擇模型。';

  @override
  String translationError(String error) {
    return '翻譯錯誤：$error';
  }

  @override
  String genericError(String error) {
    return '錯誤：$error';
  }

  @override
  String get download => '下載';

  @override
  String get swapLanguages => '互換語言';

  @override
  String get clear => '清除';

  @override
  String get inputHint => '輸入文字...';

  @override
  String get translate => '翻譯';

  @override
  String get copyToClipboard => '複製到剪貼簿';

  @override
  String get translationCopied => '譯文已複製到剪貼簿';

  @override
  String get translating => '翻譯中...';

  @override
  String get translationPlaceholder => '譯文將顯示在這裡';

  @override
  String get documentTitle => '文件翻譯';

  @override
  String pickFileError(String error) {
    return '無法選擇檔案：$error';
  }

  @override
  String get chooseSaveFolder => '選擇儲存資料夾';

  @override
  String get unsupportedFormat => '不支援此檔案格式。';

  @override
  String get documentDone => '文件翻譯成功！';

  @override
  String get translationCancelled => '翻譯已取消。';

  @override
  String documentError(String error) {
    return '翻譯過程中發生錯誤：$error';
  }

  @override
  String get tapToPickDocument => '點一下以選擇文件';

  @override
  String get saveLocation => '儲存位置：';

  @override
  String get change => '變更…';

  @override
  String get pdfOcrTitle => '翻譯 PDF 圖片中的文字 (OCR)';

  @override
  String get pdfOcrSubtitle => '使用 ML Kit OCR 處理掃描頁面和圖表';

  @override
  String get sheetNamesShort => '翻譯工作表名稱';

  @override
  String get translateDocument => '翻譯文件';

  @override
  String get cancel => '取消';

  @override
  String get preparing => '正在準備翻譯...';

  @override
  String progressLine(int done, int total) {
    return '第 $done/$total 行';
  }

  @override
  String progressParagraph(int done, int total) {
    return '第 $done/$total 段';
  }

  @override
  String progressSharedText(int done, int total) {
    return '共用文字 $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return '第 $done/$total 頁';
  }

  @override
  String progressPageOcr(int done, int total) {
    return '第 $done/$total 頁 – 正在辨識圖片中的文字';
  }

  @override
  String get openFile => '開啟檔案';

  @override
  String get share => '分享';

  @override
  String get selectSourceLanguage => '選擇來源語言';

  @override
  String get selectTargetLanguage => '選擇目標語言';

  @override
  String get searchLanguage => '搜尋語言...';

  @override
  String get detectLanguage => '偵測語言';

  @override
  String get settingsTitle => '設定';

  @override
  String get aiModel => 'AI 模型';

  @override
  String get downloadModel => '下載模型 (1.05 GB)';

  @override
  String get pickGguf => '從裝置選擇 .gguf';

  @override
  String get cancelDownload => '取消下載';

  @override
  String get defaultLanguages => '預設語言';

  @override
  String get defaultSourceLanguage => '預設來源語言';

  @override
  String get defaultTargetLanguage => '預設目標語言';

  @override
  String get documentsOcr => '文件與 OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR 支援';

  @override
  String get pdfOcrSupportDesc => '翻譯掃描版 PDF 和圖片中的文字';

  @override
  String get sheetNames => '翻譯 Excel 工作表名稱';

  @override
  String get sheetNamesDesc => '同時翻譯試算表分頁的標題';

  @override
  String get appearance => '外觀';

  @override
  String get appTheme => '應用程式主題';

  @override
  String get themeSystem => '系統';

  @override
  String get themeLight => '淺色';

  @override
  String get themeDark => '深色';

  @override
  String get appLanguage => '應用程式語言';

  @override
  String get systemDefault => '系統預設';

  @override
  String get about => '關於';

  @override
  String get aboutDescription =>
      '完全離線、在裝置上執行的 AI 翻譯應用程式。由騰訊混元 MT2 1.8B 模型和 llama.cpp FFI 引擎提供支援。任何文字或文件都不會傳送到網際網路。';

  @override
  String get modelNotInstalled => '尚未安裝模型';

  @override
  String get modelNotDownloaded => '尚未下載模型';

  @override
  String modelFileNotFound(String path) {
    return '找不到模型檔案：$path';
  }

  @override
  String get modelLoading => '正在將模型載入記憶體...';

  @override
  String get modelReady => '模型已就緒 (HunYuan MT2 1.8B 離線)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return '選擇檔案時發生錯誤：$error';
  }

  @override
  String get downloadStarting => '正在開始下載...';

  @override
  String get downloadCancelledKept => '下載已取消（已保留進度）';

  @override
  String downloadingPercent(String percent) {
    return '下載中：$percent%';
  }

  @override
  String get verifyingSha => '正在驗證 SHA256...';

  @override
  String get downloadCompleteLoading => '下載完成，正在載入模型...';

  @override
  String get downloadCancelled => '下載已取消';

  @override
  String downloadError(String error) {
    return '下載錯誤：$error';
  }

  @override
  String get cancellingDownload => '正在取消下載...';

  @override
  String get onboardingHeadline => '無需網路，離線翻譯';

  @override
  String get onboardingBenefitOffline => '設定完成後完全離線運作';

  @override
  String get onboardingBenefitPrivate => '隱私安全，任何資料都不會離開您的裝置';

  @override
  String get onboardingBenefitFormats => '支援文字與文件翻譯';

  @override
  String onboardingSizeNote(String size) {
    return '單次下載：約 $size GB。建議使用 Wi-Fi。';
  }

  @override
  String get onboardingDownloadButton => '下載模型';

  @override
  String get onboardingBackgroundNote => '您可以離開應用程式，下載將自斷點處繼續。';

  @override
  String get onboardingTryAgain => '重試';

  @override
  String get onboardingHaveGguf => '我已有 .gguf 檔案';

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
