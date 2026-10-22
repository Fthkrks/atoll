# Spec: UI bug fixes (round 2)

Project: `C:\Users\asus\Desktop\projeler\translate\Mobil\hy_translate`. This is the Flutter app "Atoll".

**Note:** A previous run was interrupted mid-way. It already changed `lib/core/model/model_manager.dart` and some `lib/l10n/*.arb` files. Inspect the current state (diff it against your understanding) and finish the work. Keep what is correct and redo what is incomplete.

Fix ALL of the bugs below. Bugs 1–3 come from the tester's report (`../test_reports/onboarding/report.md`, section "Bugs"). Bugs 4–6 were reported by the user on a real phone.

1. **A saved model that fails to load keeps the user on Home** (`lib/ui/screens/app_gate.dart:37`, `isReady || hasModel`).
   - Gate rules:
     - ready → Home;
     - saved model exists AND status is loading (or `initialize()` is not finished) → Home, or a simple loading splash without an onboarding flash;
     - status error or notDownloaded → OnboardingScreen, showing the localized error with Try again and the .gguf picker.
   - Make sure `initialize()` actually sets `ModelStatus.error` when the saved file fails to load.
2. **The Text tab shows a stale "Loading model into memory…" banner after the model becomes ready.** The Document tab may have the same problem. `HomeScreen` caches the tab widgets.
   - Every widget that reads `modelManager.isReady` or `status` must rebuild on ModelManager changes, using `ListenableBuilder` or a listener in State.
3. **Download errors show the raw exception with a long signed URL** (`model_manager.dart` around line 341; `onboarding_screen.dart` around line 236).
   - Keep the raw error only in `debugPrint`.
   - Expose a concise, localized reason: network error / server error (code) / verification failed.
   - On screen, use maxLines and ellipsis as a safety net.
4. **(User) The model can be downloaded again while it is verifying or loading, or after it is already downloaded.** On a real phone the user accidentally downloaded it twice.
   - In BOTH the Settings screen and the onboarding screen, the Download button must be hidden or disabled while the status is downloading, verifying or loading, and whenever the model file already exists and is valid, or the status is ready.
   - In Settings, when the model is ready, show "Model ready" with no download button. Offer at most a separate, clearly secondary "Re-download" action behind a confirmation dialog, or omit it entirely. Picking a different .gguf may stay available.
   - Also guard inside `ModelManager.downloadModel()`: return immediately if the status is downloading, verifying, loading or ready, or if the target file already exists with the expected size.
5. **(User) After the model is loaded and usable, the UI still says "loading into memory".** This is the same root cause as bug 2. Make sure every status text, in Settings and the Text/Document tabs, reflects the current `ModelManager` state live.
6. **(User) When a long paragraph is translated, the output text is hidden under the floating navbar** and can't be read.
   - The Text translation screen's output area must be scrollable, with bottom padding equal to `DockMetrics.clearance(context)` (`lib/ui/widgets/dock_metrics.dart`), so the last lines can be scrolled above the dock.
   - Check the Document screen and the Settings screen for the same issue.
   - Test with a very long translated text, 30+ lines.

## Requirements

- **Strings:** add any new strings as l10n keys in `app_en.arb` (with `@` descriptions) and `app_tr.arb` (proper Turkish). Use at least the English text for the other locales.
- **Tests:** add or update widget tests for bugs 1, 2/5, 4 (the download button is hidden when ready or loading) and 6 where feasible.
- **Do not change:** the applicationId, signing config, `android/key.properties`, `Mobil/keys`, or the model URL/SHA constants. Add no new dependencies.
- **Finish:** `C:/flutter/bin/flutter.bat analyze` reports no issues and `flutter.bat test` passes. Run commands in the foreground.

## Report

List the files changed, how each bug (1–6) was fixed, and the analyze and test output.
