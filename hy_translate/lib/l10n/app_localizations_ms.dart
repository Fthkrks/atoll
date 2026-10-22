// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get navText => 'Teks';

  @override
  String get navDocuments => 'Dokumen';

  @override
  String get navSettings => 'Tetapan';

  @override
  String get madeBy => 'Dibuat oleh 4pp';

  @override
  String get modelRequired =>
      'Model perlu dimuat turun atau dipilih sebelum menterjemah.';

  @override
  String translationError(String error) {
    return 'Ralat terjemahan: $error';
  }

  @override
  String genericError(String error) {
    return 'Ralat: $error';
  }

  @override
  String get download => 'Muat turun';

  @override
  String get swapLanguages => 'Tukar bahasa';

  @override
  String get clear => 'Kosongkan';

  @override
  String get inputHint => 'Masukkan teks...';

  @override
  String get translate => 'Terjemah';

  @override
  String get copyToClipboard => 'Salin ke papan keratan';

  @override
  String get translationCopied => 'Terjemahan disalin ke papan keratan';

  @override
  String get translating => 'Sedang menterjemah...';

  @override
  String get translationPlaceholder => 'Terjemahan akan dipaparkan di sini';

  @override
  String get documentTitle => 'Terjemahan dokumen';

  @override
  String pickFileError(String error) {
    return 'Tidak dapat memilih fail: $error';
  }

  @override
  String get chooseSaveFolder => 'Pilih folder simpanan';

  @override
  String get unsupportedFormat => 'Format fail ini tidak disokong.';

  @override
  String get documentDone => 'Dokumen berjaya diterjemahkan!';

  @override
  String get translationCancelled => 'Terjemahan dibatalkan.';

  @override
  String documentError(String error) {
    return 'Ralat berlaku semasa menterjemah: $error';
  }

  @override
  String get tapToPickDocument => 'Ketik untuk memilih dokumen';

  @override
  String get saveLocation => 'Lokasi simpanan:';

  @override
  String get change => 'Tukar…';

  @override
  String get pdfOcrTitle => 'Terjemah teks dalam imej PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'ML Kit OCR untuk halaman imbasan dan rajah';

  @override
  String get sheetNamesShort => 'Terjemah nama helaian';

  @override
  String get translateDocument => 'Terjemah dokumen';

  @override
  String get cancel => 'Batal';

  @override
  String get preparing => 'Menyediakan terjemahan...';

  @override
  String progressLine(int done, int total) {
    return 'Baris $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Perenggan $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Teks kongsi $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Halaman $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Halaman $done/$total – membaca teks dalam imej';
  }

  @override
  String get openFile => 'Buka fail';

  @override
  String get share => 'Kongsi';

  @override
  String get selectSourceLanguage => 'Pilih bahasa sumber';

  @override
  String get selectTargetLanguage => 'Pilih bahasa sasaran';

  @override
  String get searchLanguage => 'Cari bahasa...';

  @override
  String get detectLanguage => 'Kesan bahasa';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get aiModel => 'Model AI';

  @override
  String get downloadModel => 'Muat turun model (1.05 GB)';

  @override
  String get pickGguf => 'Pilih .gguf daripada peranti';

  @override
  String get cancelDownload => 'Batalkan muat turun';

  @override
  String get defaultLanguages => 'Bahasa lalai';

  @override
  String get defaultSourceLanguage => 'Bahasa sumber lalai';

  @override
  String get defaultTargetLanguage => 'Bahasa sasaran lalai';

  @override
  String get documentsOcr => 'Dokumen & OCR';

  @override
  String get pdfOcrSupport => 'Sokongan OCR PDF';

  @override
  String get pdfOcrSupportDesc => 'Terjemah teks dalam PDF imbasan dan imej';

  @override
  String get sheetNames => 'Terjemah nama helaian Excel';

  @override
  String get sheetNamesDesc => 'Turut menterjemah tajuk tab hamparan';

  @override
  String get appearance => 'Penampilan';

  @override
  String get appTheme => 'Tema aplikasi';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Cerah';

  @override
  String get themeDark => 'Gelap';

  @override
  String get appLanguage => 'Bahasa aplikasi';

  @override
  String get systemDefault => 'Lalai sistem';

  @override
  String get about => 'Perihal';

  @override
  String get aboutDescription =>
      'Aplikasi terjemahan AI yang berfungsi sepenuhnya luar talian pada peranti. Dikuasakan oleh model Tencent HunYuan MT2 1.8B dan enjin llama.cpp FFI. Tiada teks atau dokumen dihantar ke internet.';

  @override
  String get modelNotInstalled => 'Model belum dipasang';

  @override
  String get modelNotDownloaded => 'Model belum dimuat turun';

  @override
  String modelFileNotFound(String path) {
    return 'Fail model tidak ditemui: $path';
  }

  @override
  String get modelLoading => 'Memuatkan model ke dalam memori...';

  @override
  String get modelReady => 'Model sedia (HunYuan MT2 1.8B luar talian)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Ralat semasa memilih fail: $error';
  }

  @override
  String get downloadStarting => 'Memulakan muat turun...';

  @override
  String get downloadCancelledKept =>
      'Muat turun dibatalkan (kemajuan disimpan)';

  @override
  String downloadingPercent(String percent) {
    return 'Memuat turun: $percent%';
  }

  @override
  String get verifyingSha => 'Mengesahkan SHA256...';

  @override
  String get downloadCompleteLoading =>
      'Muat turun selesai, memuatkan model...';

  @override
  String get downloadCancelled => 'Muat turun dibatalkan';

  @override
  String downloadError(String error) {
    return 'Ralat muat turun: $error';
  }

  @override
  String get cancellingDownload => 'Membatalkan muat turun...';

  @override
  String get onboardingHeadline => 'Terjemah tanpa internet';

  @override
  String get onboardingBenefitOffline =>
      'Berfungsi di luar talian sepenuhnya selepas persediaan';

  @override
  String get onboardingBenefitPrivate =>
      'Peribadi, tiada data meninggalkan peranti anda';

  @override
  String get onboardingBenefitFormats => 'Terjemah teks dan dokumen';

  @override
  String onboardingSizeNote(String size) {
    return 'Muat turun sekali sahaja: kira-kira $size GB. Wi-Fi disyorkan.';
  }

  @override
  String get onboardingDownloadButton => 'Muat turun model';

  @override
  String get onboardingBackgroundNote =>
      'Anda boleh keluar dari aplikasi; muat turun akan disambung semula.';

  @override
  String get onboardingTryAgain => 'Cuba lagi';

  @override
  String get onboardingHaveGguf => 'Saya sudah mempunyai fail .gguf';

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
