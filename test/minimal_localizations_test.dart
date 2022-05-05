import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:minimal_localizations/minimal_localizations.dart';

void main() {
  test('Test MinimalLocalizationsDelegate', () {
    final delegate = MinimalLocalizationsDelegate({
      'en': {'title': 'Minimal Localizations'},
    });
    expect(delegate.isSupported(const Locale('en')), true);
    expect(delegate.isSupported(const Locale('nb')), false);
  });
}
