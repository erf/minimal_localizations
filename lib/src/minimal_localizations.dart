import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

/// A minimal localization class.
class MinimalLocalizations {
  final Map<String, Map<String, dynamic>> localizedValues;

  late String _langTag;

  MinimalLocalizations(this.localizedValues);

  static MinimalLocalizations of(BuildContext context) {
    return Localizations.of<MinimalLocalizations>(
        context, MinimalLocalizations)!;
  }

  void setLocale(Locale locale) => _langTag = locale.toLanguageTag();

  List<String> languages() => localizedValues.keys.toList();

  dynamic value(String key) => localizedValues[_langTag]![key]!;

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
      minimalLocalizations.languages().contains(locale.languageCode);

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
