// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yue Chinese Cantonese (`yue`).
class AppLocalizationsYue extends AppLocalizations {
  AppLocalizationsYue([String locale = 'yue']) : super(locale);

  @override
  String get navText => '文字';

  @override
  String get navDocuments => '文件';

  @override
  String get navSettings => '設定';

  @override
  String get madeBy => '由 4pp 製作';

  @override
  String get modelRequired => '翻譯之前，要先下載或者揀選模型。';

  @override
  String translationError(String error) {
    return '翻譯出錯：$error';
  }

  @override
  String genericError(String error) {
    return '錯誤：$error';
  }

  @override
  String get download => '下載';

  @override
  String get swapLanguages => '對調語言';

  @override
  String get clear => '清除';

  @override
  String get inputHint => '輸入文字...';

  @override
  String get translate => '翻譯';

  @override
  String get copyToClipboard => '複製去剪貼簿';

  @override
  String get translationCopied => '譯文已經複製去剪貼簿';

  @override
  String get translating => '翻譯緊...';

  @override
  String get translationPlaceholder => '譯文會喺呢度顯示';

  @override
  String get documentTitle => '文件翻譯';

  @override
  String pickFileError(String error) {
    return '揀唔到檔案：$error';
  }

  @override
  String get chooseSaveFolder => '揀選儲存資料夾';

  @override
  String get unsupportedFormat => '唔支援呢個檔案格式。';

  @override
  String get documentDone => '文件翻譯成功！';

  @override
  String get translationCancelled => '翻譯已經取消。';

  @override
  String documentError(String error) {
    return '翻譯途中出錯：$error';
  }

  @override
  String get tapToPickDocument => '撳一下揀選文件';

  @override
  String get saveLocation => '儲存位置：';

  @override
  String get change => '更改…';

  @override
  String get pdfOcrTitle => '翻譯 PDF 圖片入面嘅文字 (OCR)';

  @override
  String get pdfOcrSubtitle => '用 ML Kit OCR 處理掃描頁面同圖表';

  @override
  String get sheetNamesShort => '翻譯工作表名稱';

  @override
  String get translateDocument => '翻譯文件';

  @override
  String get cancel => '取消';

  @override
  String get preparing => '準備緊翻譯...';

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
    return '第 $done/$total 頁 – 認緊圖片入面嘅文字';
  }

  @override
  String get openFile => '開啟檔案';

  @override
  String get share => '分享';

  @override
  String get selectSourceLanguage => '揀選來源語言';

  @override
  String get selectTargetLanguage => '揀選目標語言';

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
  String get pickGguf => '由裝置揀選 .gguf';

  @override
  String get cancelDownload => '取消下載';

  @override
  String get defaultLanguages => '預設語言';

  @override
  String get defaultSourceLanguage => '預設來源語言';

  @override
  String get defaultTargetLanguage => '預設目標語言';

  @override
  String get documentsOcr => '文件同 OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR 支援';

  @override
  String get pdfOcrSupportDesc => '翻譯掃描版 PDF 同圖片入面嘅文字';

  @override
  String get sheetNames => '翻譯 Excel 工作表名稱';

  @override
  String get sheetNamesDesc => '同時翻譯試算表分頁嘅標題';

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
      '完全離線、喺裝置上面運行嘅 AI 翻譯應用程式。由騰訊混元 MT2 1.8B 模型同 llama.cpp FFI 引擎驅動。任何文字或者文件都唔會傳送去互聯網。';

  @override
  String get modelNotInstalled => '未安裝模型';

  @override
  String get modelNotDownloaded => '未下載模型';

  @override
  String modelFileNotFound(String path) {
    return '搵唔到模型檔案：$path';
  }

  @override
  String get modelLoading => '將模型載入記憶體緊...';

  @override
  String get modelReady => '模型準備好 (HunYuan MT2 1.8B 離線)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return '揀選檔案時出錯：$error';
  }

  @override
  String get downloadStarting => '開始下載緊...';

  @override
  String get downloadCancelledKept => '下載已取消（已保留進度）';

  @override
  String downloadingPercent(String percent) {
    return '下載緊：$percent%';
  }

  @override
  String get verifyingSha => '驗證緊 SHA256...';

  @override
  String get downloadCompleteLoading => '下載完成，載入緊模型...';

  @override
  String get downloadCancelled => '下載已取消';

  @override
  String downloadError(String error) {
    return '下載出錯：$error';
  }

  @override
  String get cancellingDownload => '取消緊下載...';

  @override
  String get onboardingHeadline => '唔使上網，離線翻譯';

  @override
  String get onboardingBenefitOffline => '設定好之後完全離線運作';

  @override
  String get onboardingBenefitPrivate => '保障私隱，任何資料都唔會離開你部裝置';

  @override
  String get onboardingBenefitFormats => '支援文字同文件翻譯';

  @override
  String onboardingSizeNote(String size) {
    return '單次下載：大約 $size GB。建議用 Wi-Fi。';
  }

  @override
  String get onboardingDownloadButton => '下載模型';

  @override
  String get onboardingBackgroundNote => '你可以離開應用程式，下載會喺斷點繼續。';

  @override
  String get onboardingTryAgain => '重試';

  @override
  String get onboardingHaveGguf => '我已經有 .gguf 檔案';

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
