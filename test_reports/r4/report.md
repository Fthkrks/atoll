# Test Round 4 Report — TESTER

**Date:** 2026-10-20  
**Target:** Atoll (Flutter Android, `com.fourpp.atoll`)  
**AVD:** `Medium_Phone_API_36.0`  
**Tester:** Antigravity (TESTER role)

---

## Executive Summary

| Test Area | Result | Notes |
|:---|:---:|:---|
| **1. Flutter Analyze & Test** | **PASS** | `flutter analyze` 0 issues; all 53 tests passed |
| **2. Cancel / Retry Race Condition** | **PASS** | Code analysis confirmed; emulator monotonic growth and clean cancellation verified |
| **3. Debug Emulator Regression** | **PASS** | Home ready, short EN→TR ("Merhaba dünya"), Settings "Model ready" without download button, long translation readable above dock |
| **4. Final Status for Part A** | **PASS** | All Part A checks passed. Ready for Part B Release Build. |

---

## Detailed Results

### Item 1: Flutter Analyze and Flutter Test
- **Command:** `flutter.bat analyze`
  - **Result:** PASS
  - **Output:** `No issues found! (ran in 122.5s)`
- **Command:** `flutter.bat test`
  - **Result:** PASS
  - **Output:** `00:07 +53: All tests passed!`

### Item 2: Cancel/Retry Race Review & Emulator Verification
- **Code Review (`lib/core/model/model_manager.dart` & `test/onboarding_test.dart`):**
  - **Single writer to `.part`:** Confirmed. Each attempt awaits `_activeAttemptFuture` before opening `partFile.openSync()`. Any active stream is cancelled on attempt abort.
  - **Stale attempt isolation:** Confirmed. Every state mutation checks `if (_currentAttempt != attempt) return;`. An obsolete attempt cannot close a new attempt's HTTP client or modify `_status` / `_message`.
  - **No stuck state:** Confirmed. `cancelDownload()` sets `ModelStatus.notDownloaded` with `ModelMsg.cancelling` and closes `attempt.client`, triggering immediate loop unwinding and completing `completer`.
- **Emulator Verification:**
  - Valid model backed up; removed to enter initial download state.
  - Download started, cancelled: download stopped immediately (size held constant at `298,614,782` bytes).
  - Immediate retries tested: HTTP Range requests resumed properly with strictly monotonic `.part` file growth (`105MB` -> `172MB` -> `226MB` -> `298MB` -> `304MB` -> `379MB` -> `1037MB` -> `1133MB`).
  - Full download completed, SHA-256 checksum verified (`dc5f44fcf1fa496ee7ad725982c0c8c553a4de00259b53af84c4b89fb0c06699`), `.part` renamed to `hy-mt2-1.8b-q4_k_m.gguf`.
  - Backup and `.part` cleaned up; valid model active and functional.

### Item 3: Regression on Emulator with Debug Build
- **Build & Install:** `flutter build apk --debug` -> `adb install -r build/app/outputs/flutter-apk/app-debug.apk` (Success).
- **Home Screen & Ready Model:**
  - PASS. App launched into Home screen (`ready_home.png`), engine initialized the model into memory, tabs (Text, Documents, Settings) active.
- **Short EN→TR Translation:**
  - PASS. Input: `"Hello world"`, Output: `"Merhaba dünya"` (`short_translation.png`).
- **Settings Screen Model State:**
  - PASS. Displays `Model ready (HunYuan MT2 1.8B Offline)`, no download button present (`settings_ready.png`).
- **Long Translation Output:**
  - PASS. Multi-sentence input (442 chars) translated to Turkish output card (`bounds="[42,1061][1038,2101]"`), fully scrollable and clearly readable above the bottom dock (`bounds="[66,2082][1014,2266]"`).
