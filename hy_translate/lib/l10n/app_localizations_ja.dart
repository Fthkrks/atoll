// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get navText => 'テキスト';

  @override
  String get navDocuments => 'ドキュメント';

  @override
  String get navSettings => '設定';

  @override
  String get madeBy => '4pp 制作';

  @override
  String get modelRequired => '翻訳する前に、モデルをダウンロードするか選択する必要があります。';

  @override
  String translationError(String error) {
    return '翻訳エラー: $error';
  }

  @override
  String genericError(String error) {
    return 'エラー: $error';
  }

  @override
  String get download => 'ダウンロード';

  @override
  String get swapLanguages => '言語を入れ替え';

  @override
  String get clear => 'クリア';

  @override
  String get inputHint => 'テキストを入力...';

  @override
  String get translate => '翻訳';

  @override
  String get copyToClipboard => 'クリップボードにコピー';

  @override
  String get translationCopied => '翻訳をクリップボードにコピーしました';

  @override
  String get translating => '翻訳中...';

  @override
  String get translationPlaceholder => 'ここに翻訳が表示されます';

  @override
  String get documentTitle => 'ドキュメント翻訳';

  @override
  String pickFileError(String error) {
    return 'ファイルを選択できませんでした: $error';
  }

  @override
  String get chooseSaveFolder => '保存先フォルダを選択';

  @override
  String get unsupportedFormat => 'このファイル形式には対応していません。';

  @override
  String get documentDone => 'ドキュメントを翻訳しました！';

  @override
  String get translationCancelled => '翻訳をキャンセルしました。';

  @override
  String documentError(String error) {
    return '翻訳中にエラーが発生しました: $error';
  }

  @override
  String get tapToPickDocument => 'タップしてドキュメントを選択';

  @override
  String get saveLocation => '保存先:';

  @override
  String get change => '変更…';

  @override
  String get pdfOcrTitle => 'PDF 内の画像のテキストを翻訳 (OCR)';

  @override
  String get pdfOcrSubtitle => 'スキャンしたページや図表向けの ML Kit OCR';

  @override
  String get sheetNamesShort => 'シート名を翻訳';

  @override
  String get translateDocument => 'ドキュメントを翻訳';

  @override
  String get cancel => 'キャンセル';

  @override
  String get preparing => '翻訳を準備しています...';

  @override
  String progressLine(int done, int total) {
    return '行 $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return '段落 $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return '共有テキスト $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'ページ $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'ページ $done/$total – 画像内のテキストを読み取り中';
  }

  @override
  String get openFile => 'ファイルを開く';

  @override
  String get share => '共有';

  @override
  String get selectSourceLanguage => '翻訳元の言語を選択';

  @override
  String get selectTargetLanguage => '翻訳先の言語を選択';

  @override
  String get searchLanguage => '言語を検索...';

  @override
  String get detectLanguage => '言語を自動検出';

  @override
  String get settingsTitle => '設定';

  @override
  String get aiModel => 'AI モデル';

  @override
  String get downloadModel => 'モデルをダウンロード (1.05 GB)';

  @override
  String get pickGguf => '端末から .gguf を選択';

  @override
  String get cancelDownload => 'ダウンロードをキャンセル';

  @override
  String get defaultLanguages => 'デフォルトの言語';

  @override
  String get defaultSourceLanguage => 'デフォルトの翻訳元言語';

  @override
  String get defaultTargetLanguage => 'デフォルトの翻訳先言語';

  @override
  String get documentsOcr => 'ドキュメントと OCR';

  @override
  String get pdfOcrSupport => 'PDF の OCR 対応';

  @override
  String get pdfOcrSupportDesc => 'スキャンした PDF や画像内のテキストを翻訳します';

  @override
  String get sheetNames => 'Excel のシート名を翻訳';

  @override
  String get sheetNamesDesc => 'スプレッドシートのタブ名も翻訳します';

  @override
  String get appearance => '表示';

  @override
  String get appTheme => 'アプリのテーマ';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get appLanguage => 'アプリの言語';

  @override
  String get systemDefault => 'システムの設定に従う';

  @override
  String get about => 'このアプリについて';

  @override
  String get aboutDescription =>
      '完全オフラインで端末上で動作する AI 翻訳アプリです。Tencent HunYuan MT2 1.8B モデルと llama.cpp FFI エンジンを搭載しています。テキストやドキュメントがインターネットに送信されることはありません。';

  @override
  String get modelNotInstalled => 'モデルが未インストールです';

  @override
  String get modelNotDownloaded => 'モデルはまだダウンロードされていません';

  @override
  String modelFileNotFound(String path) {
    return 'モデルファイルが見つかりません: $path';
  }

  @override
  String get modelLoading => 'モデルをメモリに読み込んでいます...';

  @override
  String get modelReady => 'モデルの準備完了 (HunYuan MT2 1.8B オフライン)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'ファイルの選択中にエラーが発生しました: $error';
  }

  @override
  String get downloadStarting => 'ダウンロードを開始しています...';

  @override
  String get downloadCancelledKept => 'ダウンロードをキャンセルしました (進行状況は保持されています)';

  @override
  String downloadingPercent(String percent) {
    return 'ダウンロード中: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 を検証しています...';

  @override
  String get downloadCompleteLoading => 'ダウンロードが完了しました。モデルを読み込んでいます...';

  @override
  String get downloadCancelled => 'ダウンロードをキャンセルしました';

  @override
  String downloadError(String error) {
    return 'ダウンロードエラー: $error';
  }

  @override
  String get cancellingDownload => 'ダウンロードをキャンセルしています...';

  @override
  String get onboardingHeadline => 'オフラインで翻訳';

  @override
  String get onboardingBenefitOffline => '設定後は完全にオフラインで動作します';

  @override
  String get onboardingBenefitPrivate => 'プライバシー重視：データは端末外に出ません';

  @override
  String get onboardingBenefitFormats => 'テキストとドキュメントを翻訳';

  @override
  String onboardingSizeNote(String size) {
    return '初回ダウンロード：約 $size GB。Wi-Fi推奨。';
  }

  @override
  String get onboardingDownloadButton => 'モデルをダウンロード';

  @override
  String get onboardingBackgroundNote => 'アプリを閉じても、ダウンロードは中断したところから再開されます。';

  @override
  String get onboardingTryAgain => '再試行';

  @override
  String get onboardingHaveGguf => 'すでに .gguf ファイルがあります';

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
