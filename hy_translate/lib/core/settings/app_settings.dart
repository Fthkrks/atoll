import 'package:flutter/material.dart';

class AppSettings {
  final String modelFilePath;
  final bool ocrEnabled;
  final ThemeMode themeMode;
  final String defaultSourceLang;
  final String defaultTargetLang;
  final bool translateSheetNames;

  /// UI language tag (e.g. `en`, `zh-Hant`); empty = follow the system.
  final String appLocale;

  const AppSettings({
    this.modelFilePath = '',
    this.ocrEnabled = true,
    this.themeMode = ThemeMode.system,
    this.defaultSourceLang = 'auto',
    this.defaultTargetLang = 'tr',
    this.translateSheetNames = false,
    this.appLocale = '',
  });

  AppSettings copyWith({
    String? modelFilePath,
    bool? ocrEnabled,
    ThemeMode? themeMode,
    String? defaultSourceLang,
    String? defaultTargetLang,
    bool? translateSheetNames,
    String? appLocale,
  }) {
    return AppSettings(
      modelFilePath: modelFilePath ?? this.modelFilePath,
      ocrEnabled: ocrEnabled ?? this.ocrEnabled,
      themeMode: themeMode ?? this.themeMode,
      defaultSourceLang: defaultSourceLang ?? this.defaultSourceLang,
      defaultTargetLang: defaultTargetLang ?? this.defaultTargetLang,
      translateSheetNames: translateSheetNames ?? this.translateSheetNames,
      appLocale: appLocale ?? this.appLocale,
    );
  }
}
