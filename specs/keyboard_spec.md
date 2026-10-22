# Spec: Keyboard hides the text being typed (Text tab)

Project: `C:\Users\asus\Desktop\projeler\translate\Mobil\hy_translate`

## Bug (reported by the user, with an emulator screenshot)

On the Text tab, when the on-screen keyboard is open and the user types a long text:
- the input card shrinks to a tiny strip (about 2–3 lines) at the top;
- a large EMPTY area appears between the card and the keyboard;
- the user cannot see what they are typing.

## Likely cause (verify)

`home_screen.dart` uses `Scaffold(extendBody: true, bottomNavigationBar: SafeArea(Column[_FloatingDock, signature]))`. The tab content adds bottom padding of `DockMetrics.clearance(context)` (`text_translation_screen.dart:223`, `document_translation_screen.dart:259`, `settings_screen.dart:56`).

When the keyboard opens:
- the Scaffold resizes the body by `viewInsets.bottom`;
- the bottom bar and/or the dock clearance padding still reserve space;
- so the content gets squeezed twice and the blank area appears.

## Required behaviour

1. **While the keyboard is visible** (`MediaQuery.viewInsetsOf(context).bottom > 0`):
   - Hide the floating dock and the signature. Animate this with a quick fade or slide, or hide them immediately.
   - Use no dock clearance padding; use the normal 16 px.
   - All remaining height above the keyboard goes to the content.
2. **The input card must stay usable:**
   - The text field grows to use the available space, or the content scrolls.
   - The caret/current line always stays visible: scroll it into view as the user types; `TextField` usually handles this if it is inside a scrollable with correct insets.
   - No large blank gap may remain between the content and the keyboard.
3. **When the keyboard closes:** the dock and signature come back and the clearance padding applies again. The long-output fix from the previous round must keep working, i.e. the last line stays readable above the dock.
4. **Check the other screens:** apply the same logic to the Documents and Settings screens wherever they use the clearance. Ideally make `DockMetrics.clearance(context)` itself return 0 when the keyboard is visible, and make `HomeScreen` hide the dock when the keyboard is visible.
5. **Tests:** add a widget test that simulates keyboard insets (`tester.view.viewInsets`, or a `MediaQuery` override) and checks:
   - the dock is not shown, or has zero size, while the keyboard is open;
   - the text field remains visible and has a reasonable height.
6. **Do not change:** the applicationId, signing config, keys, or the model URL/SHA. Add no new dependencies.
7. **Finish:** `C:/flutter/bin/flutter.bat analyze` is clean and `flutter.bat test` passes. Run commands in the foreground.

## Report

List the files changed, the root cause found, the fix, and the analyze and test output.
