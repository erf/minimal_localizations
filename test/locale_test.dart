import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_localizations/src/locale_ext.dart';

void main() {
  group('Locale', () {
    test('create Locale from language / country tag', () {
      const locale = Locale('en', 'US');
      expect(locale.languageCode, 'en');
      expect(locale.countryCode, 'US');
    });

    test('create Locale from language / country tag', () {
      const locale = Locale.fromSubtags(languageCode: 'en', countryCode: 'US');
      expect(locale.languageCode, 'en');
      expect(locale.countryCode, 'US');
    });

    test('LocaleExt from/to language tag', () {
      final locale = LocaleExt.fromLanguageTag('nb-NO');
      expect(locale.languageCode, 'nb');
      expect(locale.countryCode, 'NO');
      final locale2 = LocaleExt.fromLanguageTag('en');
      expect(locale2.languageCode, 'en');
      expect(locale2.countryCode, null);
      final locale3 = LocaleExt.fromLanguageTag('en-US');
      expect(locale3.languageCode, 'en');
      expect(locale3.countryCode, 'US');
      final String languageTag = locale3.toLanguageTag();
      expect(languageTag, 'en-US');
    });
  });
}
