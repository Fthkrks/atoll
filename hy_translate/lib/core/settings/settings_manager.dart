import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_settings.dart';

class SettingsManager with ChangeNotifier {
  static const String _keyModelPath = 'model_file_path';
  static const String _keyOcrEnabled = 'ocr_enabled';
  static const String _keyThemeMode = 'theme_mode';
  static const String _keySourceLang = 'default_source_lang';
  static const String _keyTargetLang = 'default_target_lang';
  static const String _keySheetNames = 'translate_sheet_names';
  static const String _keyAppLocale = 'app_locale';

  AppSettings _settings = const AppSettings();

  AppSettings get settings => _settings;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final modelPath = prefs.getString(_keyModelPath) ?? '';
    final ocrEnabled = prefs.getBool(_keyOcrEnabled) ?? true;
    final themeStr = prefs.getString(_keyThemeMode) ?? 'system';
    final sourceLang = prefs.getString(_keySourceLang) ?? 'auto';
    final targetLang = prefs.getString(_keyTargetLang) ?? 'tr';
    final sheetNames = prefs.getBool(_keySheetNames) ?? false;
    final appLocale = prefs.getString(_keyAppLocale) ?? '';

    ThemeMode mode;
    switch (themeStr) {
      case 'light':
        mode = ThemeMode.light;
        break;
      case 'dark':
        mode = ThemeMode.dark;
        break;
      default:
        mode = ThemeMode.system;
        break;
    }

    _settings = AppSettings(
      modelFilePath: modelPath,
      ocrEnabled: ocrEnabled,
      themeMode: mode,
      defaultSourceLang: sourceLang,
      defaultTargetLang: targetLang,
      translateSheetNames: sheetNames,
      appLocale: appLocale,
    );

    notifyListeners();
  }

  Future<void> updateModelPath(String path) async {
    _settings = _settings.copyWith(modelFilePath: path);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyModelPath, path);
    notifyListeners();
  }

  Future<void> updateOcrEnabled(bool enabled) async {
    _settings = _settings.copyWith(ocrEnabled: enabled);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOcrEnabled, enabled);
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    _settings = _settings.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    String str = 'system';
    if (mode == ThemeMode.light) str = 'light';
    if (mode == ThemeMode.dark) str = 'dark';
    await prefs.setString(_keyThemeMode, str);
    notifyListeners();
  }

  Future<void> updateDefaultLanguages({
    String? sourceLang,
    String? targetLang,
  }) async {
    _settings = _settings.copyWith(
      defaultSourceLang: sourceLang,
      defaultTargetLang: targetLang,
    );
    final prefs = await SharedPreferences.getInstance();
    if (sourceLang != null) await prefs.setString(_keySourceLang, sourceLang);
    if (targetLang != null) await prefs.setString(_keyTargetLang, targetLang);
    notifyListeners();
  }

  Future<void> updateTranslateSheetNames(bool enabled) async {
    _settings = _settings.copyWith(translateSheetNames: enabled);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keySheetNames, enabled);
    notifyListeners();
  }

  /// Sets the UI language ([tag] like `en` / `zh-Hant`); empty = system default.
  Future<void> updateAppLocale(String tag) async {
    _settings = _settings.copyWith(appLocale: tag);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAppLocale, tag);
    notifyListeners();
  }
}
