# HyTranslate Mobil (Çevrimdışı Yapay Zeka Çevirmeni)

HyTranslate Mobil, Windows masaüstü uygulamasının (`../Desktop` - WinUI 3 / C#) tüm çekirdek özelliklerini Flutter platformuna birebir aktaran, **tamamen çevrimdışı (on-device)** çalışan mobil yapay zeka çeviri uygulamasıdır.

Tencent HunYuan MT2 1.8B modeli ve `llama.cpp` yerel FFI motoru ile güçlendirilmiştir. Kullanıcının hiçbir verisi, çevrilen metni veya belgesi internete gönderilmez; model indirildikten sonra cihaz uçak modunda dahi tüm özellikleriyle çalışır.

---

## 🚀 Öne Çıkan Özellikler

### 1. Google Translate (Material 3) Arayüzü & Canlı Metin Çevirisi
- **Material 3 Tasarımı:** Google Translate benzeri sade, akıcı ve sezgisel mobil arayüz.
- **38 Dil Desteği:** Dili otomatik algılama (Auto-detect) ve 38 dil arasında çift yönlü çeviri.
- **Canlı Akış (Streaming) ve Debounce:** Kullanıcı yazarken 600 ms debounce ile otomatik başlar ve token'lar ekrana anlık olarak akar.
- **Pano ve Temizleme:** Tek dokunuşla kopyalama, ters çevirme (swap), temizleme ve dinamik karakter sayacı.

### 2. Model Yönetimi (Model Management)
- **Tek Dokunuşla İndirme:** İlk açılışta veya Ayarlar ekranından HunYuan MT2 1.8B (Q4_K_M, 1.05 GB) modelini tek tıkla doğrudan Ollama Registry üzerinden indirme.
- **Kesintiden Devam Etme (HTTP Range Resume):** Bağlantı kopsa veya kullanıcı iptal etse dahi indirme kaldığı bayttan devam eder (`.part` dosyası).
- **Kriptografik Güvenlik (SHA256):** İndirme bittiğinde modelin SHA256 özeti (`dc5f44fcf1fa496ee7ad725982c0c8c553a4de00259b53af84c4b89fb0c06699`) doğrulanır; bozuk dosya yüklenmez.
- **Cihazdan .gguf Seçme:** Modeli internetten indirmek yerine bilgisayardan veya telefondan var olan `.gguf` dosyasını seçip anında kullanabilme.

### 3. Zengin Format Korumalı Belge Çevirisi (Document Translation)
Masaüstü `HyTranslate.Core` kütüphanesinin tüm format koruma mantığı Dart diline aktarılmıştır:
- **DOCX (Microsoft Word):** OpenXML yapısı korunarak gövde, üstbilgi/altbilgi, tablolar, dipnotlar, sonnotlar ve açıklamalar çevrilir. Arapça, Farsça, İbranice, Urduca gibi hedef dillerde `w:bidi` ve `w:rtl` yön etiketleri otomatik eklenir.
- **PPTX (Microsoft PowerPoint):** Slaytlar, konuşmacı notları, slayt kalıpları (slide masters) ve yerleşimlerdeki tüm metin kutuları yerleşimi bozulmadan çevrilir.
- **XLSX (Microsoft Excel):** Paylaşılan metin tablosu (`xl/sharedStrings.xml`) ve satır içi stringler tercüme edilir. İsteğe bağlı olarak çalışma sayfası (sheet) adları da çevrilebilir.
- **PDF (Adobe Portable Document):** Text extractor ile koordinatlı metin blokları çıkarılır; orijinal metinlerin arkasına beyaz zemin maskesi yerleştirilip aynı koordinata, aynı hizalama ve otomatik ölçeklenen yazı tipi boyutuyla çeviri basılır.
- **TXT & Markdown:** Metin dosyalarında UTF-8/UTF-16 BOM tespiti ve CRLF/LF satır sonu korunur. Markdown dosyalarında YAML frontmatter, ` ``` ` veya `~~~` kod blokları, tablolar ve inline kodlar `⟦N⟧` maskeleriyle korunur.
- **Kaydetme ve Paylaşma:** Çevrilen belge istenen klasöre kaydedilebilir, doğrudan sistem uygulamalarıyla açılabilir (`open_filex`) veya paylaşılabilir (`share_plus`).

### 4. Gelişmiş PDF OCR (Görsel ve Taranmış Sayfalar)
- OCR açıkken her sayfa taranır; PDF metin katmanıyla %30 üzerinde örtüşen OCR satırları elenir, böylece metin + gömülü görsel içeren sayfalar (slaytlar) da çevrilir.
- Taranmış veya metin katmanı olmayan PDF belgeleri için çevrimdışı **Google ML Kit Text Recognition** motoru entegre edilmiştir.
- Sayfalar ~200 DPI bitmap olarak işlenir (`pdfx`), satırlar `OcrBlockBuilder` ile paragraflar halinde kümelenir, satır sonu heceleme tireleri (`algo-` + `rithm` -> `algorithm`) otomatik tamir edilir.
- `OcrPixelSampler` ile metin arka planı ve yazı rengi piksel bazında örneklenerek orijinal kontrast korunur.

### 5. Masaüstünden Port Edilen Güvenlik ve Doğruluk Algoritmaları
- **Prompt Şablonu:** HunYuan modelinin saf formatı uygulanır (`<｜hy_begin▁of▁sentence｜><｜hy_User｜>{prompt}<｜hy_Assistant｜>`). Çince içeren dillerde Çince talimat, diğer dillerde İngilizce talimat kullanılır. Asla harici sistem promptu eklenmez.
- **Echo Guard (Komut Yankısı Koruması):** Modelin çeviri yerine talimatı tekrarlaması durumunda (`without additional explanation`, `不要额外解释` vb.) sistem durumu algılar, otomatik bir kez tekrar dener; düzelmezse kaynak metne dönerek bozuk çıktı oluşmasını engeller.
- **RichParagraphTranslator:** Renkli, kalın, italik gibi farklı stiller içeren paragraflarda en uzun stil grubu "baz stil" olarak etiketsiz bırakılır, diğer stiller `<g1>...</g1>` gibi XML etiketleriyle maskelenir. Modelin dilbilgisel nedenlerle etiket sırasını değiştirmesi desteklenir; etiketler model tarafından silinirse güvenli fallback devreye girer.
- **Eşzamanlılık ve Önbellek:** 2 thread'lik asenkron semafor ile bellek taşması önlenir; çevrilen segmentler LRU önbelleğe alınarak tekrarlanan metinlerde anında sonuç üretilir.

---

## 📦 Paket Seçimleri ve Gerekçeleri

| Paket | Neden Seçildi? |
|---|---|
| `llamadart: ^0.15.3` | Upstream `llama.cpp` native C++ kütüphanesini Dart FFI ile doğrudan bağlar. `hunyuan-dense` mimarisini yerel olarak destekler. Android NDK (ARM64 ve x86_64) derlenmiş ikilileri ile sıfır konfigürasyonla mobil cihazda tam offline model çalıştırma imkanı sunar. |
| `syncfusion_flutter_pdf: ^35.1.40+1` | Saf Dart üzerinde PDF ayrıştırma, metin koordinatları çıkarma ve yeni PDF grafik çizimi (beyaz kutu kapatma ve metin yerleştirme) sağlar; harici C++ bağımlılığı gerektirmez. |
| `pdfx: ^2.11.0` | PDF sayfalarını Android/iOS native platform render API'leri ile bitmap'e dönüştürür. OCR işlemi için yüksek kaliteli sayfa rasterizasyonu sağlar. |
| `google_mlkit_text_recognition: ^0.16.0` | Google'ın cihaz üzerinde (on-device) tamamen offline çalışan, donanım hızlandırmalı optik karakter tanıma motorudur. |
| `archive: ^4.5.2` & `xml: ^7.0.1` | DOCX, PPTX ve XLSX dosyalarının OpenXML Zip yapısını decompress edip, XML düğümlerini manipüle ederek tekrar sıkıştırmak için kullanılır. |
| `file_picker: ^13.1.0` | Android Storage Access Framework (SAF) üzerinden güvenli dosya ve dizin seçimi sağlar. |
| `share_plus: ^13.3.1` & `open_filex: ^5.0.0` | Çevrilen dosyaların doğrudan WhatsApp, e-posta, Drive vb. ile paylaşılmasını ve varsayılan ofis uygulamalarıyla açılmasını sağlar. |
| `shared_preferences: ^2.5.6` | Kullanıcı teması, OCR tercihi, varsayılan diller ve model dosya yolunun kalıcı olarak saklanmasını sağlar. |

---

## 🛠️ Kurulum ve Çalıştırma

### Gereksinimler
- Flutter SDK >= 3.38 (Önerilen: 3.41.2 / Dart 3.11)
- Android SDK (Platform 34-36, NDK 27+)
- Java JDK 17+

### Bağımlılıkları Yükleme
```bash
cd hy_translate
flutter pub get
```

### Statik Kod Analizi
```bash
flutter analyze
```
*(0 hata, 0 uyarı ile tamamlanır)*

### Birim Testlerini Çalıştırma
```bash
flutter test
```
Prompt inşası, echo guard, zengin metin etiketleme mantığı, OCR kümeleme ve dosya yolları için yazılan **23 birim ve widget testinin tamamı** çalıştırılır.

### Debug APK Derleme
```bash
flutter build apk --debug
```
Çıktı dosyası: `build/app/outputs/flutter-apk/app-debug.apk`

---

## Doğrulama Durumu (gerçek test)
- `flutter analyze`: 0 hata; `flutter test`: 23/23 geçti.
- Android emülatörde (x86_64, API 36) `Hello, how are you?` (Dil algıla -> Türkçe) tamamen çevrimdışı olarak `Merhaba, nasılsın?` şeklinde çevrildi. Ekran görüntüleri: `screenshots/`.
- Belge çevirisi ve PDF OCR cihazda uçtan uca denenmedi; yalnızca birim testleri vardır.

## 📱 Ekranlar

1. **Metin Çevirisi (Metin Sekmesi):** Kaynak ve hedef dil seçicileri, dil değiştirme (swap), 600 ms debounce canlı çeviri, token akışı, karakter sayısı, kopyalama ve temizleme.
2. **Belge Çevirisi (Belge Sekmesi):** DOCX, PPTX, XLSX, PDF, TXT, MD dosya seçimi, dosya türü ikonu ve boyutu, çıktı kayıt yeri seçimi, OCR açma/kapama, yüzde ilerleme çubuğu ve iptal butonu, çeviri sonrası Dosyayı Aç ve Paylaş butonları.
3. **Ayarlar (Ayarlar Sekmesi):** Model durumu, dosya konumu, Ollama Registry'den modeli indirme/iptal etme, cihazdan `.gguf` seçme, varsayılan kaynak/hedef dil ayarları, PDF OCR açma/kapama, Excel sayfa isimleri çevirisi, Tema seçimi (Sistem, Açık, Koyu) ve uygulama bilgisi.
