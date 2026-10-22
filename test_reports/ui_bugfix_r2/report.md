# Atoll UI bug-fix re-test — 2026-10-20

Device: `Medium_Phone_API_36.0` (Android API 36, 1080×2400). Tested a newly built debug APK with `adb install -r`, preserving app data. No app source or test files were edited. The valid 1,133,080,448-byte GGUF was backed up inside app data before corruption tests and restored afterward.

## Bug results

| # | Result | Emulator evidence |
| --- | --- | --- |
| 1. Failed saved model opens onboarding with a localized error | **FAIL — recovery route and actions pass; error detail is not localized.** Replacing the saved model with an empty file opened onboarding with Try again and the `.gguf` picker. In Turkish, the error card still displayed English `LlamaException: Failed to load model from /data/user/0/...`, truncated after three lines. | [English](bad_saved_model_onboarding.png), [Turkish](bad_saved_model_tr.png) |
| 2. Text and Document loading banners clear themselves | **PASS.** On a valid-model relaunch, Text showed “Loading model into memory…” and cleared it without typing. Documents showed no stale banner once ready; its loading interval was too short to capture on the warm relaunch. The Document transition is also covered by the passing widget test. | [Text loading](relaunch_ready_text.png), [Text ready](relaunch_after_ready_text.png), [Documents ready](document_ready_direct.png) |
| 3. Download errors are short and localized | **PASS.** Airplane mode produced a one-line network error in English and Turkish, with retry and no URL on screen. | [English](offline_error_en.png), [Turkish dark](offline_error_tr_dark.png) |
| 4. Model cannot be downloaded twice | **FAIL — UI guards pass, manager guard has a race.** Eight rapid emulator taps left one visible download state: Download was replaced by Cancel and one `.part` file grew from 74,313,380 to 80,547,493 bytes. Ready Settings showed “Model ready” and no Download button. Loading/verifying UI branches were covered by widget tests. A second `downloadModel()` call can nevertheless enter before the first call sets `downloading`; see remaining bug below. No duplicate network request was confirmed during the adb tap sequence. | [Active download](download_rapid_taps_active.png), [ready Settings](settings_ready.png) |
| 5. Status text is live in Settings, Text, Documents | **PASS.** Text's banner vanished without input, Documents had no stale banner after load, and Settings said “Model ready” with no loading text. | [Text before](relaunch_ready_text.png), [Text after](relaunch_after_ready_text.png), [Documents](document_ready.png), [Settings](settings_ready.png) |
| 6. Long output clears floating navbar | **PASS.** A 2,402-character EN→TR paragraph generated 36 numbered translated sentences, over 30 wrapped output lines. After scrolling to the end, the last `taşıdı.` line was fully readable above the dock. The initial Documents card was above the dock, and the last Settings/About card scrolled fully above it. | [Long output at end](long_translation_bottom_padding.png), [Documents](document_ready.png), [Settings bottom](settings_bottom.png) |

## Remaining bugs

### 1. Corrupt-model error detail remains English and technical

Reproduce: force-stop, save the valid GGUF, replace the active saved file with an empty `.gguf`, set the app locale to Turkish, and relaunch. Expected: onboarding with a fully localized, user-facing load error plus Try again and the picker. Actual: onboarding and both actions appear, but the card says `Model yüklenirken hata oluştu: LlamaException: Failed to load model from /data/user/0/...`. The technical detail is cut off by the three-line limit. See [screenshot](bad_saved_model_tr.png). `ModelManager` keeps the exception text in [`model_manager.dart:244`](../../hy_translate/lib/core/model/model_manager.dart#L244); [`statusMessageOf()` at line 130](../../hy_translate/lib/core/model/model_manager.dart#L130) inserts it into the localized template. [`onboarding_screen.dart:243`](../../hy_translate/lib/ui/screens/onboarding_screen.dart#L243) only truncates the text.

### 4. Concurrent download starts are still possible

Reproduce at the manager boundary: when status is `notDownloaded`, invoke `downloadModel()` twice before the first `_getDefaultModelFile()` future resolves, as two very close Download taps can do on a slow device. Expected: the second call returns without starting another request. Actual by code inspection: both calls can pass the status check at [`model_manager.dart:268–274`](../../hy_translate/lib/core/model/model_manager.dart#L268); status is not changed until after the await at [line 277](../../hy_translate/lib/core/model/model_manager.dart#L277), at [line 282](../../hy_translate/lib/core/model/model_manager.dart#L282). Both calls can then open clients and write the same `.part` path. This was **not reproduced** with eight sequential adb taps, so duplicate-request occurrence on this emulator remains unconfirmed. The guard needs to claim the downloading state before its first await.

## Regression checks and cleanup

- `flutter analyze`: **PASS**, `No issues found!`.
- `flutter test --concurrency=1`: **PASS**, `+46: All tests passed!`. An initial parallel test attempt ran out of host disk space; after `flutter clean`, the serial run passed.
- First-run onboarding layout: **PASS** in a simulated fresh state made by temporarily removing the saved preferences and active model while preserving backups. Both actions were visible in [Turkish dark mode](fresh_tr_dark.png). No uninstall or full 1.13 GB re-download was needed.
- Short EN→TR translation: **PASS**, “Good morning” → “Günaydın” in [Text](short_translation.png).
- Tab switching: **PASS**, Text → Documents → Settings and back.
- Dark mode: **PASS**, [onboarding](fresh_tr_dark.png) and [ready Settings](settings_ready_dark.png).
- Final state: airplane mode off, light theme, saved preferences restored, only the valid 1,133,080,448-byte GGUF present in `app_flutter/models`; [Settings reports “Model ready”](final_ready.png). A document file was not selected for translation, so the Documents bottom check covers its initial screen rather than a completed-document view.
