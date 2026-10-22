import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/model/model_manager.dart';
import 'package:hy_translate/core/settings/settings_manager.dart';
import 'package:hy_translate/main.dart';
import 'package:hy_translate/ui/widgets/dock_metrics.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<(SettingsManager, ModelManager)> _pumpApp(
  WidgetTester tester, {
  Map<String, Object> prefs = const {},
}) async {
  SharedPreferences.setMockInitialValues(prefs);
  final settingsManager = SettingsManager();
  await settingsManager.load();
  final modelManager = ModelManager(settingsManager);
  modelManager.setStatusForTesting(
    status: ModelStatus.ready,
    isReady: true,
  );

  await tester.pumpWidget(
    HyTranslateApp(
      settingsManager: settingsManager,
      modelManager: modelManager,
      hasConfiguredModelOverride: () => true,
    ),
  );
  await tester.pumpAndSettle();
  return (settingsManager, modelManager);
}

void main() {
  testWidgets(
      'While keyboard is open, dock and signature are hidden, and input card stays usable',
      (tester) async {
    await _pumpApp(tester);

    // Initial state: dock and signature are visible
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Made by 4pp'), findsOneWidget);

    final BuildContext initialCtx = tester.element(find.byType(TextField));
    expect(DockMetrics.clearance(initialCtx), greaterThan(0));

    // Simulate opening the on-screen keyboard (300px inset)
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    addTearDown(() => tester.view.resetViewInsets());
    await tester.pumpAndSettle();

    // 1. Floating dock and signature must not be shown while keyboard is open
    expect(find.text('Made by 4pp'), findsNothing);
    expect(find.text('Documents'), findsNothing);
    expect(find.text('Settings'), findsNothing);

    // 2. Dock clearance must return 0
    final BuildContext keyboardCtx = tester.element(find.byType(TextField));
    expect(DockMetrics.clearance(keyboardCtx), equals(0.0));

    // 3. Scrollable content area extends all the way down to the keyboard top
    final scrollRect = tester.getRect(find.byType(SingleChildScrollView).first);
    final keyboardTop = (tester.view.physicalSize.height - tester.view.viewInsets.bottom) /
        tester.view.devicePixelRatio;
    expect(scrollRect.bottom, equals(keyboardTop));

    // 4. Input card with long text remains fully visible and usable
    final lines = List.generate(
      15,
      (i) => 'Line ${i + 1}: Long sentence typed into the input card while the keyboard is visible.',
    );
    final longText = lines.join('\n');
    await tester.enterText(find.byType(TextField), longText);
    await tester.pumpAndSettle();

    // The TextField has a healthy height (> 150px) and its top/bottom are in view
    expect(find.byType(TextField), findsOneWidget);
    final textFieldRect = tester.getRect(find.byType(TextField));
    expect(textFieldRect.height, greaterThan(150));
    expect(textFieldRect.top, lessThan(keyboardTop));
    expect(textFieldRect.bottom, greaterThan(scrollRect.top));

    // 5. When keyboard closes, dock, signature, and clearance padding return
    tester.view.resetViewInsets();
    await tester.pumpAndSettle();

    expect(find.text('Made by 4pp'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    final BuildContext closedCtx = tester.element(find.byType(TextField));
    expect(DockMetrics.clearance(closedCtx), greaterThan(0));
  });

  testWidgets('Dock clearance returns 0 with MediaQuery override', (tester) async {
    double? clearanceWithKeyboard;
    double? clearanceWithoutKeyboard;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            clearanceWithoutKeyboard = DockMetrics.clearance(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                viewInsets: const EdgeInsets.only(bottom: 250),
              ),
              child: Builder(
                builder: (innerCtx) {
                  clearanceWithKeyboard = DockMetrics.clearance(innerCtx);
                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ),
      ),
    );

    expect(clearanceWithoutKeyboard, greaterThan(0));
    expect(clearanceWithKeyboard, equals(0.0));
  });

  testWidgets(
      'Documents and Settings tabs also clear dock clearance when keyboard is open',
      (tester) async {
    await _pumpApp(tester);

    // Switch to Documents tab
    await tester.tap(find.text('Documents'));
    await tester.pumpAndSettle();

    final BuildContext docCtx =
        tester.element(find.byType(SingleChildScrollView).first);
    expect(DockMetrics.clearance(docCtx), greaterThan(0));

    // Open keyboard
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    addTearDown(() => tester.view.resetViewInsets());
    await tester.pumpAndSettle();

    expect(DockMetrics.clearance(docCtx), equals(0.0));
    expect(find.text('Made by 4pp'), findsNothing);

    // Switch to Settings tab
    tester.view.resetViewInsets();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    final BuildContext settingsCtx =
        tester.element(find.byType(ListView).first);
    expect(DockMetrics.clearance(settingsCtx), greaterThan(0));

    // Open keyboard
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    await tester.pumpAndSettle();

    expect(DockMetrics.clearance(settingsCtx), equals(0.0));
    expect(find.text('Made by 4pp'), findsNothing);
  });
}
