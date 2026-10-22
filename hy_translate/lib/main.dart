import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/model/model_manager.dart';
import 'core/settings/settings_manager.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n_support.dart';
import 'ui/screens/app_gate.dart';
import 'ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final settingsManager = SettingsManager();
  await settingsManager.load();

  final modelManager = ModelManager(settingsManager);
  unawaited(modelManager.initialize());

  runApp(
    HyTranslateApp(
      settingsManager: settingsManager,
      modelManager: modelManager,
    ),
  );
}

class HyTranslateApp extends StatelessWidget {
  final SettingsManager settingsManager;
  final ModelManager modelManager;
  final bool Function()? hasConfiguredModelOverride;

  const HyTranslateApp({
    super.key,
    required this.settingsManager,
    required this.modelManager,
    this.hasConfiguredModelOverride,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsManager,
      builder: (context, _) {
        final settings = settingsManager.settings;
        return MaterialApp(
          title: 'Atoll',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.themeMode,
          locale: settings.appLocale.isEmpty
              ? null
              : localeFromTag(settings.appLocale),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: appLocalizationsDelegates,
          localeListResolutionCallback: resolveAppLocale,
          onGenerateTitle: (context) => 'Atoll',
          home: AppGate(
            settingsManager: settingsManager,
            modelManager: modelManager,
            hasConfiguredModelOverride: hasConfiguredModelOverride,
          ),
        );
      },
    );
  }
}
