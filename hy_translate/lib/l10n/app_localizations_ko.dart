// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get navText => '텍스트';

  @override
  String get navDocuments => '문서';

  @override
  String get navSettings => '설정';

  @override
  String get madeBy => '4pp 제작';

  @override
  String get modelRequired => '번역하기 전에 모델을 다운로드하거나 선택해야 합니다.';

  @override
  String translationError(String error) {
    return '번역 오류: $error';
  }

  @override
  String genericError(String error) {
    return '오류: $error';
  }

  @override
  String get download => '다운로드';

  @override
  String get swapLanguages => '언어 바꾸기';

  @override
  String get clear => '지우기';

  @override
  String get inputHint => '텍스트를 입력하세요...';

  @override
  String get translate => '번역';

  @override
  String get copyToClipboard => '클립보드에 복사';

  @override
  String get translationCopied => '번역을 클립보드에 복사했습니다';

  @override
  String get translating => '번역 중...';

  @override
  String get translationPlaceholder => '여기에 번역이 표시됩니다';

  @override
  String get documentTitle => '문서 번역';

  @override
  String pickFileError(String error) {
    return '파일을 선택할 수 없습니다: $error';
  }

  @override
  String get chooseSaveFolder => '저장 폴더 선택';

  @override
  String get unsupportedFormat => '이 파일 형식은 지원되지 않습니다.';

  @override
  String get documentDone => '문서를 성공적으로 번역했습니다!';

  @override
  String get translationCancelled => '번역이 취소되었습니다.';

  @override
  String documentError(String error) {
    return '번역 중 오류가 발생했습니다: $error';
  }

  @override
  String get tapToPickDocument => '탭하여 문서 선택';

  @override
  String get saveLocation => '저장 위치:';

  @override
  String get change => '변경…';

  @override
  String get pdfOcrTitle => 'PDF 이미지 속 텍스트 번역 (OCR)';

  @override
  String get pdfOcrSubtitle => '스캔한 페이지와 도표를 위한 ML Kit OCR';

  @override
  String get sheetNamesShort => '시트 이름 번역';

  @override
  String get translateDocument => '문서 번역';

  @override
  String get cancel => '취소';

  @override
  String get preparing => '번역을 준비하는 중...';

  @override
  String progressLine(int done, int total) {
    return '줄 $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return '단락 $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return '공유 텍스트 $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return '페이지 $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return '페이지 $done/$total – 이미지 속 텍스트 읽는 중';
  }

  @override
  String get openFile => '파일 열기';

  @override
  String get share => '공유';

  @override
  String get selectSourceLanguage => '원본 언어 선택';

  @override
  String get selectTargetLanguage => '번역 언어 선택';

  @override
  String get searchLanguage => '언어 검색...';

  @override
  String get detectLanguage => '언어 감지';

  @override
  String get settingsTitle => '설정';

  @override
  String get aiModel => 'AI 모델';

  @override
  String get downloadModel => '모델 다운로드 (1.05GB)';

  @override
  String get pickGguf => '기기에서 .gguf 선택';

  @override
  String get cancelDownload => '다운로드 취소';

  @override
  String get defaultLanguages => '기본 언어';

  @override
  String get defaultSourceLanguage => '기본 원본 언어';

  @override
  String get defaultTargetLanguage => '기본 번역 언어';

  @override
  String get documentsOcr => '문서 및 OCR';

  @override
  String get pdfOcrSupport => 'PDF OCR 지원';

  @override
  String get pdfOcrSupportDesc => '스캔한 PDF와 이미지 속 텍스트 번역';

  @override
  String get sheetNames => 'Excel 시트 이름 번역';

  @override
  String get sheetNamesDesc => '스프레드시트 탭 제목도 함께 번역합니다';

  @override
  String get appearance => '화면 설정';

  @override
  String get appTheme => '앱 테마';

  @override
  String get themeSystem => '시스템';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get appLanguage => '앱 언어';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get about => '정보';

  @override
  String get aboutDescription =>
      '완전한 오프라인으로 기기에서 작동하는 AI 번역 앱입니다. Tencent HunYuan MT2 1.8B 모델과 llama.cpp FFI 엔진으로 구동됩니다. 어떤 텍스트나 문서도 인터넷으로 전송되지 않습니다.';

  @override
  String get modelNotInstalled => '모델이 설치되지 않았습니다';

  @override
  String get modelNotDownloaded => '모델이 아직 다운로드되지 않았습니다';

  @override
  String modelFileNotFound(String path) {
    return '모델 파일을 찾을 수 없습니다: $path';
  }

  @override
  String get modelLoading => '모델을 메모리에 불러오는 중...';

  @override
  String get modelReady => '모델 준비 완료 (HunYuan MT2 1.8B 오프라인)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return '파일을 선택하는 중 오류가 발생했습니다: $error';
  }

  @override
  String get downloadStarting => '다운로드를 시작하는 중...';

  @override
  String get downloadCancelledKept => '다운로드가 취소되었습니다 (진행 상황 보존됨)';

  @override
  String downloadingPercent(String percent) {
    return '다운로드 중: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 확인 중...';

  @override
  String get downloadCompleteLoading => '다운로드 완료, 모델을 불러오는 중...';

  @override
  String get downloadCancelled => '다운로드가 취소되었습니다';

  @override
  String downloadError(String error) {
    return '다운로드 오류: $error';
  }

  @override
  String get cancellingDownload => '다운로드를 취소하는 중...';

  @override
  String get onboardingHeadline => '인터넷 없이 번역';

  @override
  String get onboardingBenefitOffline => '설정 후 완전 오프라인으로 작동합니다';

  @override
  String get onboardingBenefitPrivate => '개인정보 보호: 어떤 데이터도 기기 외부로 나가지 않습니다';

  @override
  String get onboardingBenefitFormats => '텍스트 및 문서 번역';

  @override
  String onboardingSizeNote(String size) {
    return '1회 다운로드: 약 $size GB. Wi-Fi 권장.';
  }

  @override
  String get onboardingDownloadButton => '모델 다운로드';

  @override
  String get onboardingBackgroundNote => '앱을 벗어나도 다운로드는 중단된 지점부터 다시 시작됩니다.';

  @override
  String get onboardingTryAgain => '다시 시도';

  @override
  String get onboardingHaveGguf => '이미 .gguf 파일이 있습니다';

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
