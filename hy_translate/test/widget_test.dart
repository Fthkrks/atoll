import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hy_translate/core/languages/language_names.g.dart';
import 'package:hy_translate/core/languages/languages.dart';
import 'package:hy_translate/core/model/model_manager.dart';
import 'package:hy_translate/core/settings/settings_manager.dart';
import 'package:hy_translate/l10n/app_localizations.dart';
import 'package:hy_translate/main.dart';
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
  testWidgets('English UI shows Text, Documents and Settings', (tester) async {
    await _pumpApp(tester, prefs: {'app_locale': 'en'});

    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Made by 4pp'), findsOneWidget);
    expect(find.text('Metin'), findsNothing);
  });

  testWidgets('Turkish UI shows Metin, Belge and Ayarlar', (tester) async {
    await _pumpApp(tester, prefs: {'app_locale': 'tr'});

    expect(find.text('Metin'), findsOneWidget);
    expect(find.text('Belge'), findsOneWidget);
    expect(find.text('Ayarlar'), findsOneWidget);
    expect(find.text('4pp tarafından yapılmıştır'), findsOneWidget);
  });

  testWidgets('switching the app language updates the UI immediately',
      (tester) async {
    final (settings, _) = await _pumpApp(tester, prefs: {'app_locale': 'tr'});
    expect(find.text('Metin'), findsOneWidget);

    await settings.updateAppLocale('en');
    await tester.pumpAndSettle();
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    await settings.updateAppLocale('de');
    await tester.pumpAndSettle();
    expect(find.text('Dokumente'), findsOneWidget);
    expect(find.text('Einstellungen'), findsOneWidget);

    // Empty tag = follow the system (test platform locale is en_US).
    await settings.updateAppLocale('');
    await tester.pumpAndSettle();
    expect(find.text('Documents'), findsOneWidget);
  });

  testWidgets('settings screen offers the App language item', (tester) async {
    // No stored choice -> follows the system locale (en_US in tests).
    await _pumpApp(tester);

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    await tester.dragUntilVisible(
      find.text('App language'),
      find.byType(ListView).first,
      const Offset(0, -200),
    );
    await tester.drag(find.byType(ListView).first, const Offset(0, -150));
    await tester.pumpAndSettle();
    expect(find.text('App language'), findsOneWidget);
    expect(find.text('System default'), findsOneWidget);

    await tester.tap(find.text('App language'));
    await tester.pumpAndSettle();
    expect(find.text('System default'), findsWidgets);
    expect(find.text('العربية'), findsOneWidget);
  });

  testWidgets('RTL languages get a right-to-left Directionality',
      (tester) async {
    for (final tag in ['ar', 'fa', 'ur', 'he', 'ug']) {
      await _pumpApp(tester, prefs: {'app_locale': tag});
      final ctx = tester.element(find.byType(Scaffold).first);
      expect(Directionality.of(ctx), TextDirection.rtl, reason: tag);
    }
    await _pumpApp(tester, prefs: {'app_locale': 'ja'});
    final ctx = tester.element(find.byType(Scaffold).first);
    expect(Directionality.of(ctx), TextDirection.ltr);
  });

  test('every translation language is also a UI language with full names', () {
    final codes = Languages.supportedLanguages.map((l) => l.code).toSet();
    final supported = AppLocalizations.supportedLocales
        .map((l) => l.scriptCode == null
            ? l.languageCode
            : '${l.languageCode}-${l.scriptCode}')
        .toSet();
    expect(supported, codes);
    expect(kLanguageNames.keys.toSet(), codes);
    for (final row in kLanguageNames.values) {
      expect(row.keys.toSet(), codes);
      expect(row.values.every((n) => n.isNotEmpty), isTrue);
    }
  });
}
