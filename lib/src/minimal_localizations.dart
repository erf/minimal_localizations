import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'locale_ext.dart';

/// A minimal localization class.
class MinimalLocalizations {
  final Map<String, Map<String, dynamic>> localizedValues;

  late String _langTag;

  MinimalLocalizations(this.localizedValues);

  static MinimalLocalizations of(BuildContext context) =>
      Localizations.of<MinimalLocalizations>(context, MinimalLocalizations)!;

  /// Given a locale, set the current language tag.
  void setLocale(Locale locale) => _langTag = locale.toLanguageTag();

  /// Get the supported locales.
  Iterable<String> get languageTags => localizedValues.keys;

  /// Get a list of supported locales.
  Iterable<Locale> get supportedLocales =>
      languageTags.map((tag) => LocaleExt.fromLanguageTag(tag));

  /// Get a localized value for the given key.
  dynamic value(String key) => localizedValues[_langTag]![key]!;

  /// Get a localized string for the given key.
  String string(String key) => value(key);
}

/// A minimal localization delegate.
class MinimalLocalizationsDelegate
    extends LocalizationsDelegate<MinimalLocalizations> {
  final MinimalLocalizations minimalLocalizations;

  MinimalLocalizationsDelegate(Map<String, Map<String, String>> localizedValues)
      : minimalLocalizations = MinimalLocalizations(localizedValues);

  @override
  bool isSupported(Locale locale) =>
      minimalLocalizations.languageTags.contains(locale.toLanguageTag());

  /// Get a list of the supported locales.
  Iterable<Locale> supportedLocales() => minimalLocalizations.supportedLocales;

  @override
  Future<MinimalLocalizations> load(Locale locale) {
    minimalLocalizations.setLocale(locale);
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<MinimalLocalizations>(minimalLocalizations);
  }

  @override
  bool shouldReload(MinimalLocalizationsDelegate old) => false;
}
