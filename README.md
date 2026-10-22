# Atoll: Offline Translator (Android)

Atoll translates text and documents fully offline. The Tencent Hy-MT2 1.8B model runs on your device through llama.cpp. There is no account, no ads and no tracking. Made by [4pp Studio](https://www.4pp.studio).

Website: https://atoll-one.vercel.app

- 38 languages, with automatic source-language detection
- Document translation that keeps the layout: DOCX, PPTX, XLSX, PDF, TXT, MD
- On-device OCR for scanned PDFs
- A one-time model download of about 1.1 GB inside the app; after that, everything works offline

## Repository layout

| Path | Contents |
|---|---|
| `hy_translate/` | Flutter app (`com.fourpp.atoll`) |
| `store_listing/` | Play Store texts, graphics, privacy policy |
| `specs/`, `test_reports/` | Development specs and test reports |

## Build

```sh
cd hy_translate
flutter pub get
flutter run            # debug
flutter build appbundle --release
```

Release signing reads `android/key.properties`, which is not included in this repository. Without it, use debug builds.

## Atoll projects

- [atoll](https://github.com/Fthkrks/atoll): Android app (Flutter + llama.cpp via llamadart)
- [atoll-desktop](https://github.com/Fthkrks/atoll-desktop): Windows app (WinUI 3 + LLamaSharp)
- [atoll-web](https://github.com/Fthkrks/atoll-web): website (Next.js), https://atoll-one.vercel.app
- [atoll-releases](https://github.com/Fthkrks/atoll-releases): Windows downloads

## License

The source code is released under the [MIT License](LICENSE). The translation model is not part of this repository. It is the Tencent Hy-MT2 1.8B GGUF model ([tencent/Hy-MT2-1.8B-GGUF](https://huggingface.co/tencent/Hy-MT2-1.8B-GGUF)), released by Tencent under the Apache License 2.0.
