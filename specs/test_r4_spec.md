# Test round 4 (continue) + release build — TESTER role

You are the TESTER for the Flutter Android app "Atoll". The project is at `C:\Users\asus\Desktop\projeler\translate\Mobil\hy_translate`.

Do NOT modify app source (`lib/`) or tests (`test/`). Only `pubspec.yaml`'s version line may change, and only in Part B.

## Already verified by the previous tester (do not redo)

The keyboard layout fix passed on the emulator. The screenshots are in `Mobil/test_reports/r4/` (`keyboard_*.png`, `dark_mode.png`, `documents_keyboard.png`).

## Part A — remaining checks

1. Run `C:/flutter/bin/flutter.bat analyze` and `flutter.bat test` in the foreground and record the results.
2. **Cancel/retry race.** Review `downloadModel()` and `cancelDownload()` in `lib/core/model/model_manager.dart` and the new tests in `test/onboarding_test.dart` (`_DownloadAttempt`, the per-attempt client, staleness guards, the new attempt awaiting the previous one). Confirm:
   - only one writer to the `.part` file at a time;
   - a stale attempt never touches shared state;
   - no stuck "downloading" or "cancelling" state.
   Optionally test it on the emulator:
   - Back up the valid model first: `adb shell run-as com.fourpp.atoll cp app_flutter/models/hy-mt2-1.8b-q4_k_m.gguf app_flutter/models/backup.bin`. Then move it away to get the download state.
   - Start Download, Cancel, immediately Download again several times.
   - The `.part` size must grow monotonically and the UI must stay consistent.
   - Restore the valid model from the backup afterwards and delete the `.part` and backup copies.
3. **Regression on the emulator with a debug build** (`flutter run -d emulator-5554`, or build a debug apk and `adb install -r` to keep data):
   - The app opens to Home with a ready model.
   - One short EN→TR translation works.
   - Settings shows "Model ready" with no download button.
   - A long translation output is readable above the dock.
4. Write `C:\Users\asus\Desktop\projeler\translate\Mobil\test_reports\r4\report.md` with PASS/FAIL per item and evidence.

## Environment

- **adb:** `C:\Users\asus\AppData\Local\Android\Sdk\platform-tools\adb.exe`.
- **Emulator:** AVD `Medium_Phone_API_36.0`. If it is not running, start it in the background with `C:\Users\asus\AppData\Local\Android\Sdk\emulator\emulator.exe -avd Medium_Phone_API_36.0 -memory 4096 -cores 8 -gpu host`.
- **Package:** `com.fourpp.atoll`.
- **UI driving:** use `adb shell input tap/text`, take screenshots with `adb exec-out screencap -p > file.png`, and dump the UI with `uiautomator dump`.
- **Commands:** run everything in the foreground; never wait idle on background tasks.

## Part B — release build (ONLY if Part A passes)

1. Change `pubspec.yaml` `version: 1.0.1+2` to `version: 1.0.2+3`.
2. Run `C:/flutter/bin/flutter.bat build appbundle --release`. A "failed to strip debug symbols" warning is expected and acceptable.
3. Verify the signature with `"C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe" -printcert -jarfile build\app\outputs\bundle\release\app-release.aab`. The SHA-256 must start with `85:2E:D6:49` and end with `7D:CC`. NEVER read or print keystore passwords or `key.properties`.
4. Confirm versionCode 3 and versionName 1.0.2 from the merged release manifest under `build/app/intermediates`.
5. Copy the AAB to `C:\Users\asus\Desktop\projeler\translate\Mobil\release\atoll-1.0.2-3.aab`.
6. Do not upload anything.

Leave the emulator with the valid, ready model installed.

## Final report

Print PASS/FAIL per item and the AAB path, size, cert SHA-256 and version.
