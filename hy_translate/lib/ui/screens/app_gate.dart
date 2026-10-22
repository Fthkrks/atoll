import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/model/model_manager.dart';
import '../../core/settings/settings_manager.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class AppGate extends StatelessWidget {
  final SettingsManager settingsManager;
  final ModelManager modelManager;
  final bool Function()? hasConfiguredModelOverride;

  const AppGate({
    super.key,
    required this.settingsManager,
    required this.modelManager,
    this.hasConfiguredModelOverride,
  });

  bool _hasConfiguredModel() {
    if (hasConfiguredModelOverride != null) {
      return hasConfiguredModelOverride!();
    }
    final path = settingsManager.settings.modelFilePath;
    return path.isNotEmpty && File(path).existsSync();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([modelManager, settingsManager]),
      builder: (context, _) {
        final isReady = modelManager.isReady;
        final hasModel = _hasConfiguredModel();
        final status = modelManager.status;

        final bool showHome;
        if (isReady) {
          showHome = true;
        } else if (status == ModelStatus.error || status == ModelStatus.notDownloaded) {
          showHome = false;
        } else if (hasModel && (status == ModelStatus.loading || modelManager.isInitializing)) {
          showHome = true;
        } else {
          showHome = false;
        }

        final Widget child;
        if (showHome) {
          child = HomeScreen(
            key: const ValueKey('home_screen'),
            settingsManager: settingsManager,
            modelManager: modelManager,
          );
        } else {
          child = OnboardingScreen(
            key: const ValueKey('onboarding_screen'),
            modelManager: modelManager,
          );
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: child,
        );
      },
    );
  }
}
