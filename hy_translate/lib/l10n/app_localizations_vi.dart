// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get navText => 'Văn bản';

  @override
  String get navDocuments => 'Tài liệu';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get madeBy => 'Phát triển bởi 4pp';

  @override
  String get modelRequired => 'Cần tải xuống hoặc chọn mô hình trước khi dịch.';

  @override
  String translationError(String error) {
    return 'Lỗi dịch: $error';
  }

  @override
  String genericError(String error) {
    return 'Lỗi: $error';
  }

  @override
  String get download => 'Tải xuống';

  @override
  String get swapLanguages => 'Hoán đổi ngôn ngữ';

  @override
  String get clear => 'Xóa';

  @override
  String get inputHint => 'Nhập văn bản...';

  @override
  String get translate => 'Dịch';

  @override
  String get copyToClipboard => 'Sao chép vào bộ nhớ tạm';

  @override
  String get translationCopied => 'Đã sao chép bản dịch vào bộ nhớ tạm';

  @override
  String get translating => 'Đang dịch...';

  @override
  String get translationPlaceholder => 'Bản dịch sẽ xuất hiện ở đây';

  @override
  String get documentTitle => 'Dịch tài liệu';

  @override
  String pickFileError(String error) {
    return 'Không thể chọn tệp: $error';
  }

  @override
  String get chooseSaveFolder => 'Chọn thư mục lưu';

  @override
  String get unsupportedFormat => 'Định dạng tệp này không được hỗ trợ.';

  @override
  String get documentDone => 'Đã dịch tài liệu thành công!';

  @override
  String get translationCancelled => 'Đã hủy dịch.';

  @override
  String documentError(String error) {
    return 'Đã xảy ra lỗi trong khi dịch: $error';
  }

  @override
  String get tapToPickDocument => 'Nhấn để chọn tài liệu';

  @override
  String get saveLocation => 'Vị trí lưu:';

  @override
  String get change => 'Thay đổi…';

  @override
  String get pdfOcrTitle => 'Dịch văn bản trong hình ảnh của PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'ML Kit OCR cho trang quét và sơ đồ';

  @override
  String get sheetNamesShort => 'Dịch tên trang tính';

  @override
  String get translateDocument => 'Dịch tài liệu';

  @override
  String get cancel => 'Hủy';

  @override
  String get preparing => 'Đang chuẩn bị bản dịch...';

  @override
  String progressLine(int done, int total) {
    return 'Dòng $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Đoạn $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Văn bản dùng chung $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Trang $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Trang $done/$total – đang đọc văn bản trong hình ảnh';
  }

  @override
  String get openFile => 'Mở tệp';

  @override
  String get share => 'Chia sẻ';

  @override
  String get selectSourceLanguage => 'Chọn ngôn ngữ nguồn';

  @override
  String get selectTargetLanguage => 'Chọn ngôn ngữ đích';

  @override
  String get searchLanguage => 'Tìm ngôn ngữ...';

  @override
  String get detectLanguage => 'Phát hiện ngôn ngữ';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get aiModel => 'Mô hình AI';

  @override
  String get downloadModel => 'Tải mô hình (1,05 GB)';

  @override
  String get pickGguf => 'Chọn tệp .gguf từ thiết bị';

  @override
  String get cancelDownload => 'Hủy tải xuống';

  @override
  String get defaultLanguages => 'Ngôn ngữ mặc định';

  @override
  String get defaultSourceLanguage => 'Ngôn ngữ nguồn mặc định';

  @override
  String get defaultTargetLanguage => 'Ngôn ngữ đích mặc định';

  @override
  String get documentsOcr => 'Tài liệu và OCR';

  @override
  String get pdfOcrSupport => 'Hỗ trợ OCR cho PDF';

  @override
  String get pdfOcrSupportDesc => 'Dịch văn bản trong PDF quét và hình ảnh';

  @override
  String get sheetNames => 'Dịch tên trang tính Excel';

  @override
  String get sheetNamesDesc => 'Dịch cả tiêu đề các thẻ của bảng tính';

  @override
  String get appearance => 'Giao diện';

  @override
  String get appTheme => 'Chủ đề ứng dụng';

  @override
  String get themeSystem => 'Hệ thống';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get appLanguage => 'Ngôn ngữ ứng dụng';

  @override
  String get systemDefault => 'Mặc định của hệ thống';

  @override
  String get about => 'Giới thiệu';

  @override
  String get aboutDescription =>
      'Ứng dụng dịch bằng AI hoàn toàn ngoại tuyến, chạy ngay trên thiết bị. Được vận hành bởi mô hình Tencent HunYuan MT2 1.8B và công cụ llama.cpp FFI. Không có văn bản hay tài liệu nào được gửi lên internet.';

  @override
  String get modelNotInstalled => 'Chưa cài đặt mô hình';

  @override
  String get modelNotDownloaded => 'Mô hình chưa được tải xuống';

  @override
  String modelFileNotFound(String path) {
    return 'Không tìm thấy tệp mô hình: $path';
  }

  @override
  String get modelLoading => 'Đang nạp mô hình vào bộ nhớ...';

  @override
  String get modelReady => 'Mô hình đã sẵn sàng (HunYuan MT2 1.8B ngoại tuyến)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Lỗi khi chọn tệp: $error';
  }

  @override
  String get downloadStarting => 'Đang bắt đầu tải xuống...';

  @override
  String get downloadCancelledKept => 'Đã hủy tải xuống (giữ nguyên tiến độ)';

  @override
  String downloadingPercent(String percent) {
    return 'Đang tải xuống: $percent%';
  }

  @override
  String get verifyingSha => 'Đang xác minh SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Tải xuống hoàn tất, đang nạp mô hình...';

  @override
  String get downloadCancelled => 'Đã hủy tải xuống';

  @override
  String downloadError(String error) {
    return 'Lỗi tải xuống: $error';
  }

  @override
  String get cancellingDownload => 'Đang hủy tải xuống...';

  @override
  String get onboardingHeadline => 'Dịch không cần internet';

  @override
  String get onboardingBenefitOffline =>
      'Hoạt động hoàn toàn ngoại tuyến sau khi thiết lập';

  @override
  String get onboardingBenefitPrivate =>
      'Riêng tư, không có dữ liệu nào rời khỏi thiết bị của bạn';

  @override
  String get onboardingBenefitFormats => 'Dịch văn bản và tài liệu';

  @override
  String onboardingSizeNote(String size) {
    return 'Tải xuống một lần: khoảng $size GB. Khuyên dùng Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Tải xuống mô hình';

  @override
  String get onboardingBackgroundNote =>
      'Bạn có thể rời khỏi ứng dụng; quá trình tải xuống sẽ tiếp tục từ nơi tạm dừng.';

  @override
  String get onboardingTryAgain => 'Thử lại';

  @override
  String get onboardingHaveGguf => 'Tôi đã có tệp .gguf';

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
