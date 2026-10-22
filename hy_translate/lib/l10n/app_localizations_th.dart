// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get navText => 'ข้อความ';

  @override
  String get navDocuments => 'เอกสาร';

  @override
  String get navSettings => 'การตั้งค่า';

  @override
  String get madeBy => 'สร้างโดย 4pp';

  @override
  String get modelRequired => 'ต้องดาวน์โหลดหรือเลือกโมเดลก่อนจึงจะแปลได้';

  @override
  String translationError(String error) {
    return 'ข้อผิดพลาดในการแปล: $error';
  }

  @override
  String genericError(String error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String get download => 'ดาวน์โหลด';

  @override
  String get swapLanguages => 'สลับภาษา';

  @override
  String get clear => 'ล้าง';

  @override
  String get inputHint => 'พิมพ์ข้อความ...';

  @override
  String get translate => 'แปล';

  @override
  String get copyToClipboard => 'คัดลอกไปยังคลิปบอร์ด';

  @override
  String get translationCopied => 'คัดลอกคำแปลไปยังคลิปบอร์ดแล้ว';

  @override
  String get translating => 'กำลังแปล...';

  @override
  String get translationPlaceholder => 'คำแปลจะแสดงที่นี่';

  @override
  String get documentTitle => 'แปลเอกสาร';

  @override
  String pickFileError(String error) {
    return 'เลือกไฟล์ไม่ได้: $error';
  }

  @override
  String get chooseSaveFolder => 'เลือกโฟลเดอร์สำหรับบันทึก';

  @override
  String get unsupportedFormat => 'ไม่รองรับรูปแบบไฟล์นี้';

  @override
  String get documentDone => 'แปลเอกสารสำเร็จแล้ว!';

  @override
  String get translationCancelled => 'ยกเลิกการแปลแล้ว';

  @override
  String documentError(String error) {
    return 'เกิดข้อผิดพลาดระหว่างการแปล: $error';
  }

  @override
  String get tapToPickDocument => 'แตะเพื่อเลือกเอกสาร';

  @override
  String get saveLocation => 'ตำแหน่งที่บันทึก:';

  @override
  String get change => 'เปลี่ยน…';

  @override
  String get pdfOcrTitle => 'แปลข้อความในรูปภาพของ PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'ML Kit OCR สำหรับหน้าที่สแกนและแผนภาพ';

  @override
  String get sheetNamesShort => 'แปลชื่อแผ่นงาน';

  @override
  String get translateDocument => 'แปลเอกสาร';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get preparing => 'กำลังเตรียมการแปล...';

  @override
  String progressLine(int done, int total) {
    return 'บรรทัด $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'ย่อหน้า $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'ข้อความที่แชร์ $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'หน้า $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'หน้า $done/$total – กำลังอ่านข้อความในรูปภาพ';
  }

  @override
  String get openFile => 'เปิดไฟล์';

  @override
  String get share => 'แชร์';

  @override
  String get selectSourceLanguage => 'เลือกภาษาต้นทาง';

  @override
  String get selectTargetLanguage => 'เลือกภาษาปลายทาง';

  @override
  String get searchLanguage => 'ค้นหาภาษา...';

  @override
  String get detectLanguage => 'ตรวจหาภาษา';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get aiModel => 'โมเดล AI';

  @override
  String get downloadModel => 'ดาวน์โหลดโมเดล (1.05 GB)';

  @override
  String get pickGguf => 'เลือกไฟล์ .gguf จากอุปกรณ์';

  @override
  String get cancelDownload => 'ยกเลิกการดาวน์โหลด';

  @override
  String get defaultLanguages => 'ภาษาเริ่มต้น';

  @override
  String get defaultSourceLanguage => 'ภาษาต้นทางเริ่มต้น';

  @override
  String get defaultTargetLanguage => 'ภาษาปลายทางเริ่มต้น';

  @override
  String get documentsOcr => 'เอกสารและ OCR';

  @override
  String get pdfOcrSupport => 'รองรับ OCR สำหรับ PDF';

  @override
  String get pdfOcrSupportDesc => 'แปลข้อความใน PDF ที่สแกนและรูปภาพ';

  @override
  String get sheetNames => 'แปลชื่อแผ่นงาน Excel';

  @override
  String get sheetNamesDesc => 'แปลชื่อแท็บของสเปรดชีตด้วย';

  @override
  String get appearance => 'รูปลักษณ์';

  @override
  String get appTheme => 'ธีมของแอป';

  @override
  String get themeSystem => 'ตามระบบ';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get themeDark => 'มืด';

  @override
  String get appLanguage => 'ภาษาของแอป';

  @override
  String get systemDefault => 'ค่าเริ่มต้นของระบบ';

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String get aboutDescription =>
      'แอปแปลภาษาด้วย AI ที่ทำงานบนอุปกรณ์แบบออฟไลน์ทั้งหมด ขับเคลื่อนด้วยโมเดล Tencent HunYuan MT2 1.8B และเอนจิน llama.cpp FFI ไม่มีข้อความหรือเอกสารใดถูกส่งไปยังอินเทอร์เน็ต';

  @override
  String get modelNotInstalled => 'ยังไม่ได้ติดตั้งโมเดล';

  @override
  String get modelNotDownloaded => 'ยังไม่ได้ดาวน์โหลดโมเดล';

  @override
  String modelFileNotFound(String path) {
    return 'ไม่พบไฟล์โมเดล: $path';
  }

  @override
  String get modelLoading => 'กำลังโหลดโมเดลเข้าหน่วยความจำ...';

  @override
  String get modelReady => 'โมเดลพร้อมใช้งาน (HunYuan MT2 1.8B ออฟไลน์)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'เกิดข้อผิดพลาดขณะเลือกไฟล์: $error';
  }

  @override
  String get downloadStarting => 'กำลังเริ่มดาวน์โหลด...';

  @override
  String get downloadCancelledKept =>
      'ยกเลิกการดาวน์โหลดแล้ว (เก็บความคืบหน้าไว้)';

  @override
  String downloadingPercent(String percent) {
    return 'กำลังดาวน์โหลด: $percent%';
  }

  @override
  String get verifyingSha => 'กำลังตรวจสอบ SHA256...';

  @override
  String get downloadCompleteLoading => 'ดาวน์โหลดเสร็จแล้ว กำลังโหลดโมเดล...';

  @override
  String get downloadCancelled => 'ยกเลิกการดาวน์โหลดแล้ว';

  @override
  String downloadError(String error) {
    return 'ข้อผิดพลาดในการดาวน์โหลด: $error';
  }

  @override
  String get cancellingDownload => 'กำลังยกเลิกการดาวน์โหลด...';

  @override
  String get onboardingHeadline => 'Translate without internet';

  @override
  String get onboardingBenefitOffline => 'Works fully offline after setup';

  @override
  String get onboardingBenefitPrivate => 'Private, nothing leaves your device';

  @override
  String get onboardingBenefitFormats => 'Translate text and documents';

  @override
  String onboardingSizeNote(String size) {
    return 'One-time download: about $size GB. Wi-Fi recommended.';
  }

  @override
  String get onboardingDownloadButton => 'Download model';

  @override
  String get onboardingBackgroundNote =>
      'You can leave the app; download will resume where you left off.';

  @override
  String get onboardingTryAgain => 'Try again';

  @override
  String get onboardingHaveGguf => 'I already have a .gguf file';

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
