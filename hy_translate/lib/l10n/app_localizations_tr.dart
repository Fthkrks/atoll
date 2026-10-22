// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get navText => 'Metin';

  @override
  String get navDocuments => 'Belge';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get madeBy => '4pp tarafından yapılmıştır';

  @override
  String get modelRequired =>
      'Çeviri için modelin indirilmesi veya seçilmesi gerekiyor.';

  @override
  String translationError(String error) {
    return 'Çeviri hatası: $error';
  }

  @override
  String genericError(String error) {
    return 'Hata: $error';
  }

  @override
  String get download => 'İndir';

  @override
  String get swapLanguages => 'Dilleri değiştir';

  @override
  String get clear => 'Temizle';

  @override
  String get inputHint => 'Metin girin...';

  @override
  String get translate => 'Çevir';

  @override
  String get copyToClipboard => 'Panoya kopyala';

  @override
  String get translationCopied => 'Çeviri panoya kopyalandı';

  @override
  String get translating => 'Çevriliyor...';

  @override
  String get translationPlaceholder => 'Çeviri burada görünecektir';

  @override
  String get documentTitle => 'Belge Çevirisi';

  @override
  String pickFileError(String error) {
    return 'Dosya seçilemedi: $error';
  }

  @override
  String get chooseSaveFolder => 'Kayıt klasörünü seçin';

  @override
  String get unsupportedFormat => 'Bu dosya formatı desteklenmiyor.';

  @override
  String get documentDone => 'Belge başarıyla çevrildi!';

  @override
  String get translationCancelled => 'Çeviri iptal edildi.';

  @override
  String documentError(String error) {
    return 'Çeviri sırasında hata oluştu: $error';
  }

  @override
  String get tapToPickDocument => 'Belge Seçmek İçin Dokunun';

  @override
  String get saveLocation => 'Kayıt Yeri:';

  @override
  String get change => 'Değiştir…';

  @override
  String get pdfOcrTitle => 'PDF görsellerindeki metinleri çevir (OCR)';

  @override
  String get pdfOcrSubtitle => 'Taranmış sayfalar ve şemalar için ML Kit OCR';

  @override
  String get sheetNamesShort => 'Sayfa adlarını çevir';

  @override
  String get translateDocument => 'Belgeyi Çevir';

  @override
  String get cancel => 'İptal';

  @override
  String get preparing => 'Çeviri hazırlanıyor...';

  @override
  String progressLine(int done, int total) {
    return 'Satır $done/$total';
  }

  @override
  String progressParagraph(int done, int total) {
    return 'Paragraf $done/$total';
  }

  @override
  String progressSharedText(int done, int total) {
    return 'Paylaşılan Metin $done/$total';
  }

  @override
  String progressPage(int done, int total) {
    return 'Sayfa $done/$total';
  }

  @override
  String progressPageOcr(int done, int total) {
    return 'Sayfa $done/$total – görsel metni okunuyor';
  }

  @override
  String get openFile => 'Dosyayı Aç';

  @override
  String get share => 'Paylaş';

  @override
  String get selectSourceLanguage => 'Kaynak Dil Seçin';

  @override
  String get selectTargetLanguage => 'Hedef Dil Seçin';

  @override
  String get searchLanguage => 'Dil ara...';

  @override
  String get detectLanguage => 'Dili algıla';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get aiModel => 'Yapay Zeka Modeli';

  @override
  String get downloadModel => 'Modeli İndir (1.05 GB)';

  @override
  String get pickGguf => 'Cihazdan .gguf Seç';

  @override
  String get cancelDownload => 'İptal Et';

  @override
  String get defaultLanguages => 'Varsayılan Diller';

  @override
  String get defaultSourceLanguage => 'Varsayılan Kaynak Dil';

  @override
  String get defaultTargetLanguage => 'Varsayılan Hedef Dil';

  @override
  String get documentsOcr => 'Belge ve OCR Ayarları';

  @override
  String get pdfOcrSupport => 'PDF OCR Desteği';

  @override
  String get pdfOcrSupportDesc =>
      'Taranmış PDF ve görsellerdeki metinleri çevir';

  @override
  String get sheetNames => 'Excel Sayfa İsimlerini Çevir';

  @override
  String get sheetNamesDesc =>
      'Tablo sayfalarının başlıklarını da tercüme eder';

  @override
  String get appearance => 'Görünüm';

  @override
  String get appTheme => 'Uygulama Teması';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get appLanguage => 'Uygulama Dili';

  @override
  String get systemDefault => 'Sistem varsayılanı';

  @override
  String get about => 'Hakkında';

  @override
  String get aboutDescription =>
      'Tamamen çevrimdışı ve cihaz üzerinde çalışan yapay zeka çeviri uygulaması. Tencent HunYuan MT2 1.8B modeli ve llama.cpp FFI motoru ile güçlendirilmiştir. Hiçbir metin veya belge internete gönderilmez.';

  @override
  String get modelNotInstalled => 'Model yüklü değil';

  @override
  String get modelNotDownloaded => 'Model henüz indirilmedi';

  @override
  String modelFileNotFound(String path) {
    return 'Model dosyası bulunamadı: $path';
  }

  @override
  String get modelLoading => 'Model belleğe yükleniyor...';

  @override
  String get modelReady => 'Model hazır (HunYuan MT2 1.8B Offline)';

  @override
  String get modelLoadError =>
      'Model dosyası yüklenemedi. Bozulmuş olabilir. Yeniden indirin veya başka bir dosya seçin.';

  @override
  String modelPickError(String error) {
    return 'Dosya seçilirken hata: $error';
  }

  @override
  String get downloadStarting => 'İndirme başlatılıyor...';

  @override
  String get downloadCancelledKept =>
      'İndirme iptal edildi (kaldığı yer saklandı)';

  @override
  String downloadingPercent(String percent) {
    return 'İndiriliyor: $percent%';
  }

  @override
  String get verifyingSha => 'SHA256 doğrulanıyor...';

  @override
  String get downloadCompleteLoading =>
      'İndirme tamamlandı, model yükleniyor...';

  @override
  String get downloadCancelled => 'İndirme iptal edildi';

  @override
  String downloadError(String error) {
    return 'İndirme hatası: $error';
  }

  @override
  String get cancellingDownload => 'İndirme iptal ediliyor...';

  @override
  String get onboardingHeadline => 'İnternetsiz çeviri';

  @override
  String get onboardingBenefitOffline =>
      'Kurulumdan sonra tamamen çevrimdışı çalışır';

  @override
  String get onboardingBenefitPrivate =>
      'Gizlidir, hiçbir veri cihazınızdan ayrılmaz';

  @override
  String get onboardingBenefitFormats => 'Metin ve belgeleri çevirin';

  @override
  String onboardingSizeNote(String size) {
    return 'Tek seferlik indirme: yaklaşık $size GB. Wi-Fi önerilir.';
  }

  @override
  String get onboardingDownloadButton => 'Modeli indir';

  @override
  String get onboardingBackgroundNote =>
      'Uygulamadan ayrılabilirsiniz; indirme kaldığı yerden devam eder.';

  @override
  String get onboardingTryAgain => 'Tekrar dene';

  @override
  String get onboardingHaveGguf => 'Zaten bir .gguf dosyam var';

  @override
  String get downloadErrorNetwork =>
      'Ağ hatası. Lütfen bağlantınızı kontrol edin.';

  @override
  String downloadErrorServer(String code) {
    return 'Sunucu hatası ($code). Lütfen daha sonra tekrar deneyin.';
  }

  @override
  String get downloadErrorVerification =>
      'Doğrulama başarısız oldu. İndirilen dosya bozuk.';

  @override
  String get downloadErrorGeneric =>
      'İndirme başarısız oldu. Lütfen tekrar deneyin.';
}
