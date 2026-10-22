# Spec: First-run onboarding screen (model download)

Project: `C:\Users\asus\Desktop\projeler\translate\Mobil\hy_translate`. This is the Flutter app "Atoll", an offline translator.

## Problem

After installing from Play, the app has no model. Today the user must discover by themselves that the model is downloaded under Settings. Until they do, the text and document screens don't work, and they don't know why.

## Goal

Add a first-run onboarding screen that is shown whenever no model is ready. It offers a one-tap model download with clear progress and the message "download once, then use offline forever".

## Existing code to reuse (do NOT reimplement the download)

- `lib/core/model/model_manager.dart` (`ModelManager`, a `ChangeNotifier`):
  - `status` (`ModelStatus`: notDownloaded, downloading, verifying, loading, ready, error), `isReady`, `downloadProgress` (`ModelDownloadProgress`: `downloadedBytes`, `totalBytes`, `fraction`, `speedMbPerSec`), and `statusMessageOf(AppLocalizations)`.
  - `downloadModel()` already supports resume through a `.part` file and an HTTP Range request, plus a SHA-256 check.
  - Also available: `cancelDownload()`, `pickModelFile()`, `initialize()`.
  - `expectedSize` = 1,133,080,448 bytes (about 1.1 GB).
- `lib/main.dart` builds `MaterialApp(home: HomeScreen(...))`. `ModelManager.initialize()` is started with `unawaited` before `runApp`.
- `lib/ui/screens/settings_screen.dart` already shows download, progress and cancel UI. Use it as a style reference and keep it working.
- Localization: `lib/l10n/app_*.arb` files with `app_en.arb` as the template, plus gen-l10n (`l10n.yaml`). Look at how existing keys are declared.

## Requirements

1. **New screen `lib/ui/screens/onboarding_screen.dart`.** Make it visually consistent with the app theme (`lib/ui/theme/app_theme.dart`, Material 3, light and dark). It contains:
   - The Atoll logo or icon at the top. If there is an asset, use it; otherwise use a tasteful `Icon`.
   - A headline like "Translate without internet".
   - Three short bullet benefits: works fully offline after setup; private, nothing leaves your device; text and documents.
   - A size note: "One-time download: about 1.1 GB. Wi-Fi recommended." Compute the size from `ModelManager.expectedSize`; do not hard-code the string.
   - A primary button "Download model" that calls `modelManager.downloadModel()`.
   - While downloading:
     - Show a linear progress bar, "X MB / Y MB", the percentage, the speed, and a Cancel button that calls `cancelDownload()`.
     - Keep the screen awake if a wake-lock package is already a dependency. Do NOT add new dependencies for this.
     - Show a note that the user may leave the app and the download resumes where it left off.
   - While verifying or loading: show an indeterminate progress indicator with the localized status text.
   - On error: show the localized error and a "Try again" button. Resume works automatically because of the `.part` file.
   - A secondary text button "I already have a .gguf file" that calls `pickModelFile()`.
2. **Gating, in `main.dart` or a small wrapper widget.**
   - Listen to `modelManager`.
   - If `modelManager.isReady`, show `HomeScreen`.
   - Show `OnboardingScreen` when the status is notDownloaded, downloading, verifying or error, and no model is configured.
   - While `initialize()` is still loading an already-downloaded model (status loading or ready with a saved path), do NOT flash the onboarding screen. Show a simple splash or loading state, or go straight to HomeScreen as before. Decide this from `settingsManager.settings.modelFilePath` being non-empty and the file existing.
   - When the download finishes and the status becomes ready, switch to HomeScreen automatically. Use an `AnimatedSwitcher` fade.
3. **Localization.**
   - Add every new string as keys in `app_en.arb` with `@` descriptions.
   - Add a proper Turkish translation in `app_tr.arb`.
   - For all other locales, add translations. At minimum provide the English text so gen-l10n doesn't fail; a good translation for each is better.
   - Run `flutter gen-l10n` if the project needs it, or rely on `flutter pub get` or the build if generation is automatic. Check `l10n.yaml`.
4. **Settings screen:** keep the existing download and pick UI unchanged. It is still useful to re-download or switch models.
5. **No behaviour changes elsewhere.** Do not change the applicationId, the signing config, `android/key.properties`, anything in `Mobil/keys`, or the model URL or SHA constants. Do not add new pub dependencies unless truly necessary; if you do, justify it in the report.
6. **Tests:** add widget tests in `test/`, for example `test/onboarding_test.dart`. If ModelManager is hard to fake, make the gating logic a small pure function or a widget that takes a `Listenable` plus status getters so it can be tested. The tests cover:
   - Not ready: the onboarding screen is shown with the download button.
   - Downloading: progress is shown and a Cancel button exists.
   - Ready: HomeScreen is shown, or the gate returns the home branch.
7. **Finish:** `flutter analyze` must report no issues and `flutter test` must pass.

## Tooling

- Flutter is at `C:/flutter/bin/flutter.bat`. In Git Bash use `/c/flutter/bin/flutter.bat`.
- In PowerShell, call `flutter.bat` explicitly and do not pipe its output.

## Report back

List the files changed or added, the new l10n keys, how gating decides between onboarding, loading and home, and the analyze and test output summary.
