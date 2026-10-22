import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/languages/language_item.dart';
import '../core/languages/language_names.g.dart';
import '../core/languages/languages.dart';
import 'app_localizations.dart';

/// Converts a stored language tag (`en`, `zh-Hant`) into a [Locale].
Locale localeFromTag(String tag) {
  final parts = tag.split(RegExp('[-_]'));
  if (parts.length >= 2 && parts[1].length == 4) {
    return Locale.fromSubtags(languageCode: parts[0], scriptCode: parts[1]);
  }
  return Locale(parts[0]);
}

/// Inverse of [localeFromTag].
String tagFromLocale(Locale locale) => locale.scriptCode == null
    ? locale.languageCode
    : '${locale.languageCode}-${locale.scriptCode}';

/// Key into [kLanguageNames] / the translation language code for a UI locale.
String languageKeyOf(Locale locale) {
  if (locale.languageCode == 'zh' &&
      (locale.scriptCode == 'Hant' ||
          (locale.scriptCode == null &&
              const {'TW', 'HK', 'MO'}.contains(locale.countryCode)))) {
    return 'zh-Hant';
  }
  return locale.languageCode;
}

/// Native name of a language (e.g. `de` -> `Deutsch`).
String nativeLanguageName(String code) =>
    kLanguageNames[code]?[code] ?? Languages.findByCode(code)?.englishName ?? code;

/// Name of [item] in the current UI language.
String languageName(BuildContext context, LanguageItem item) {
  if (item.code == Languages.autoCode) {
    return AppLocalizations.of(context).detectLanguage;
  }
  final row = kLanguageNames[languageKeyOf(Localizations.localeOf(context))] ??
      kLanguageNames['en']!;
  return row[item.code] ?? item.englishName;
}

/// Picks the app locale: first system locale whose language we ship, else English.
Locale resolveAppLocale(List<Locale>? locales, Iterable<Locale> supported) {
  for (final l in locales ?? const <Locale>[]) {
    if (supported.any((s) => s.languageCode == l.languageCode)) {
      if (l.languageCode == 'zh' && languageKeyOf(l) == 'zh-Hant') {
        return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
      }
      return basicLocaleListResolution([l], supported);
    }
  }
  return const Locale('en');
}

/// Locales for the Flutter framework widgets (Material/Cupertino/Widgets).
/// Falls back where the framework has no translation (Cantonese -> zh-Hant,
/// otherwise English) and forces RTL for Uyghur.
const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates = [
  AppLocalizations.delegate,
  _FallbackMaterialDelegate(),
  _FallbackWidgetsDelegate(),
  _FallbackCupertinoDelegate(),
];

Locale _frameworkLocale(Locale l, bool Function(Locale) isSupported) {
  if (isSupported(l)) return l;
  if (l.languageCode == 'yue') {
    return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
  }
  return const Locale('en');
}

class _FallbackMaterialDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _FallbackMaterialDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) => GlobalMaterialLocalizations.delegate
      .load(_frameworkLocale(locale, GlobalMaterialLocalizations.delegate.isSupported));

  @override
  bool shouldReload(covariant LocalizationsDelegate<MaterialLocalizations> old) => false;
}

class _FallbackCupertinoDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _FallbackCupertinoDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) => GlobalCupertinoLocalizations.delegate
      .load(_frameworkLocale(locale, GlobalCupertinoLocalizations.delegate.isSupported));

  @override
  bool shouldReload(covariant LocalizationsDelegate<CupertinoLocalizations> old) => false;
}

class _FallbackWidgetsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const _FallbackWidgetsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<WidgetsLocalizations> load(Locale locale) async {
    final inner = await GlobalWidgetsLocalizations.delegate
        .load(_frameworkLocale(locale, GlobalWidgetsLocalizations.delegate.isSupported));
    // Uyghur is written right-to-left but is missing from Flutter's RTL list.
    if (locale.languageCode == 'ug') return _RtlWidgetsLocalizations(inner);
    return inner;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<WidgetsLocalizations> old) => false;
}

class _RtlWidgetsLocalizations implements WidgetsLocalizations {
  final WidgetsLocalizations _inner;
  _RtlWidgetsLocalizations(this._inner);

  @override
  TextDirection get textDirection => TextDirection.rtl;
  @override
  String get reorderItemToStart => _inner.reorderItemToStart;
  @override
  String get reorderItemToEnd => _inner.reorderItemToEnd;
  @override
  String get reorderItemUp => _inner.reorderItemUp;
  @override
  String get reorderItemDown => _inner.reorderItemDown;
  @override
  String get reorderItemLeft => _inner.reorderItemLeft;
  @override
  String get reorderItemRight => _inner.reorderItemRight;
  @override
  String get searchResultsFound => _inner.searchResultsFound;
  @override
  String get noResultsFound => _inner.noResultsFound;
  @override
  String get copyButtonLabel => _inner.copyButtonLabel;
  @override
  String get cutButtonLabel => _inner.cutButtonLabel;
  @override
  String get pasteButtonLabel => _inner.pasteButtonLabel;
  @override
  String get selectAllButtonLabel => _inner.selectAllButtonLabel;
  @override
  String get lookUpButtonLabel => _inner.lookUpButtonLabel;
  @override
  String get searchWebButtonLabel => _inner.searchWebButtonLabel;
  @override
  String get shareButtonLabel => _inner.shareButtonLabel;
  @override
  String get radioButtonUnselectedLabel => _inner.radioButtonUnselectedLabel;
}
