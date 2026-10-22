// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get navText => 'Teks';

  @override
  String get navDocuments => 'Dokumen';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get madeBy => 'Dibuat oleh 4pp';

  @override
  String get modelRequired =>
      'Model harus diunduh atau dipilih sebelum menerjemahkan.';

  @override
  String translationError(String error) {
    return 'Kesalahan terjemahan: $error';
  }

  @override
  String genericError(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get download => 'Unduh';

  @override
  String get swapLanguages => 'Tukar bahasa';

  @override
  String get clear => 'Hapus';

  @override
  String get inputHint => 'Masukkan teks...';

  @override
  String get translate => 'Terjemahkan';

  @override
  String get copyToClipboard => 'Salin ke papan klip';

  @override
  String get translationCopied => 'Terjemahan disalin ke papan klip';

  @override
  String get translating => 'Menerjemahkan...';

  @override
  String get translationPlaceholder => 'Terjemahan akan muncul di sini';

  @override
  String get documentTitle => 'Terjemahan dokumen';

  @override
  String pickFileError(String error) {
    return 'Tidak dapat memilih file: $error';
  }

  @override
  String get chooseSaveFolder => 'Pilih folder penyimpanan';

  @override
  String get unsupportedFormat => 'Format file ini tidak didukung.';

  @override
  String get documentDone => 'Dokumen berhasil diterjemahkan!';

  @override
  String get translationCancelled => 'Terjemahan dibatalkan.';

  @override
  String documentError(String error) {
    return 'Terjadi kesalahan saat menerjemahkan: $error';
  }

  @override
  String get tapToPickDocument => 'Ketuk untuk memilih dokumen';

  @override
  String get saveLocation => 'Lokasi simpan:';

  @override
  String get change => 'Ubah…';

  @override
  String get pdfOcrTitle => 'Terjemahkan teks pada gambar PDF (OCR)';

  @override
  String get pdfOcrSubtitle => 'ML Kit OCR untuk halaman pindaian dan diagram';

  @override
  String get sheetNamesShort => 'Terjemahkan nama lembar';

  @override
  String get translateDocument => 'Terjemahkan dokumen';

  @override
  String get cancel => 'Batal';

  @override
  String get preparing => 'Menyiapkan terjemahan...';

  @override
  String progressLine(int done, int total) {
    return 'Baris $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Paragraf $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Teks bersama $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Halaman $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Halaman $done/$total – membaca teks pada gambar';
  }

  @override
  String get openFile => 'Buka file';

  @override
  String get share => 'Bagikan';

  @override
  String get selectSourceLanguage => 'Pilih bahasa sumber';

  @override
  String get selectTargetLanguage => 'Pilih bahasa tujuan';

  @override
  String get searchLanguage => 'Cari bahasa...';

  @override
  String get detectLanguage => 'Deteksi bahasa';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get aiModel => 'Model AI';

  @override
  String get downloadModel => 'Unduh model (1,05 GB)';

  @override
  String get pickGguf => 'Pilih .gguf dari perangkat';

  @override
  String get cancelDownload => 'Batalkan unduhan';

  @override
  String get defaultLanguages => 'Bahasa default';

  @override
  String get defaultSourceLanguage => 'Bahasa sumber default';

  @override
  String get defaultTargetLanguage => 'Bahasa tujuan default';

  @override
  String get documentsOcr => 'Dokumen & OCR';

  @override
  String get pdfOcrSupport => 'Dukungan OCR PDF';

  @override
  String get pdfOcrSupportDesc => 'Terjemahkan teks di PDF pindaian dan gambar';

  @override
  String get sheetNames => 'Terjemahkan nama lembar Excel';

  @override
  String get sheetNamesDesc => 'Juga menerjemahkan judul tab lembar kerja';

  @override
  String get appearance => 'Tampilan';

  @override
  String get appTheme => 'Tema aplikasi';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get appLanguage => 'Bahasa aplikasi';

  @override
  String get systemDefault => 'Default sistem';

  @override
  String get about => 'Tentang';

  @override
  String get aboutDescription =>
      'Aplikasi terjemahan AI yang sepenuhnya offline dan berjalan di perangkat. Didukung oleh model Tencent HunYuan MT2 1.8B dan mesin llama.cpp FFI. Tidak ada teks atau dokumen yang dikirim ke internet.';

  @override
  String get modelNotInstalled => 'Model belum terpasang';

  @override
  String get modelNotDownloaded => 'Model belum diunduh';

  @override
  String modelFileNotFound(String path) {
    return 'File model tidak ditemukan: $path';
  }

  @override
  String get modelLoading => 'Memuat model ke memori...';

  @override
  String get modelReady => 'Model siap (HunYuan MT2 1.8B offline)';

  @override
  String get modelLoadError =>
      'The model file could not be loaded. It may be damaged. Download it again or pick another file.';

  @override
  String modelPickError(String error) {
    return 'Terjadi kesalahan saat memilih file: $error';
  }

  @override
  String get downloadStarting => 'Memulai unduhan...';

  @override
  String get downloadCancelledKept => 'Unduhan dibatalkan (progres disimpan)';

  @override
  String downloadingPercent(String percent) {
    return 'Mengunduh: $percent%';
  }

  @override
  String get verifyingSha => 'Memverifikasi SHA256...';

  @override
  String get downloadCompleteLoading => 'Unduhan selesai, memuat model...';

  @override
  String get downloadCancelled => 'Unduhan dibatalkan';

  @override
  String downloadError(String error) {
    return 'Kesalahan unduhan: $error';
  }

  @override
  String get cancellingDownload => 'Membatalkan unduhan...';

  @override
  String get onboardingHeadline => 'Terjemahkan tanpa internet';

  @override
  String get onboardingBenefitOffline =>
      'Bekerja sepenuhnya offline setelah penyiapan';

  @override
  String get onboardingBenefitPrivate =>
      'Pribadi, tidak ada data yang meninggalkan perangkat Anda';

  @override
  String get onboardingBenefitFormats => 'Terjemahkan teks dan dokumen';

  @override
  String onboardingSizeNote(String size) {
    return 'Unduhan satu kali: sekitar $size GB. Disarankan Wi-Fi.';
  }

  @override
  String get onboardingDownloadButton => 'Unduh model';

  @override
  String get onboardingBackgroundNote =>
      'Anda dapat keluar dari aplikasi; unduhan akan dilanjutkan dari bagian terakhir.';

  @override
  String get onboardingTryAgain => 'Coba lagi';

  @override
  String get onboardingHaveGguf => 'Saya sudah memiliki file .gguf';

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
