# Atoll UI bug-fix round 3 — 2026-10-20

## Part A: FAIL

Device: Android 16 emulator (`emulator-5554`, 1080×2400). Installed a newly built debug APK with `adb install -r`, preserving app data. No app source or test files were edited.

| Check | Result | Evidence |
| --- | --- | --- |
| `flutter analyze` | PASS — `No issues found!` | Analyzer output |
| `flutter test` (default concurrency) | PASS — 48 tests | Test runner output. No parallel-only failure or flaky-test finding. |
| Bug 1: empty saved GGUF, Turkish locale, relaunch | PASS — onboarding showed “Model dosyası yüklenemedi. Bozulmuş olabilir. Yeniden indirin veya başka bir dosya seçin.” with “Tekrar dene” and the `.gguf` picker. No `LlamaException` or file path in the error. | [Screenshot](bad_model_tr.png) |
| Home with ready model | PASS — restored valid model loaded into Home. | [Screenshot](ready_home.png) |
| Short EN→TR translation | PASS — “Good morning” → “Günaydın”. | [Screenshot](short_translation.png) |
| Long EN→TR translation and dock spacing | PASS — a 2,052-character paragraph with 26 numbered sentences produced a 2,357-character Turkish result. The final line was fully visible above the floating dock after scrolling to the end. | [Screenshot](long_translation_bottom.png) |
| Settings ready state | PASS — “Model ready” with no Download button. | [Screenshot](settings_ready_en.png) |
| Bug 4: immediate concurrent `downloadModel()` calls | PASS — status is claimed synchronously at `model_manager.dart:297`, before the first await; the new test at `onboarding_test.dart:530` verifies one client and one request for two overlapping calls. | Code review and passing test |
| Bug 4: cancel followed by immediate retry | **FAIL — overlapping calls remain possible.** `cancelDownload()` sets status to `notDownloaded` at `model_manager.dart:448` before the old `downloadModel()` completes. A retry enters, sets `downloading`, and clears the shared `_isCancelRequested` flag at line 299. The old call can then pass its cancel check at line 304 or 316 and start another request. Its `finally` can also close the retry's shared `_activeClient` at line 440. The new test does not cover this sequence. | Code review; not exercised on emulator |

The normal cancel and error branches leave `downloading` (`notDownloaded` on cancel, `error` on failure), so no stuck `downloading` state was found in those branches. The quick cancel-and-retry sequence can still corrupt the active state or start a second request, so Part A does not pass.

## Part B: not run

Stopped before the release build as requested because Part A failed. `pubspec.yaml` remains `1.0.1+2`; no AAB was built or copied, and nothing was uploaded.

## Cleanup

The valid 1,133,080,448-byte GGUF was restored as the only file in `app_flutter/models`. The app locale was returned to system default, and the emulator was left on Home with the ready model.
