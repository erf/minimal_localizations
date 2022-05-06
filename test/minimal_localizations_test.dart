import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:minimal_localizations/minimal_localizations.dart';

final minimalLocalizationsDelegate = MinimalLocalizationsDelegate(
  {
    'en': {'title': 'Localizations'},
    'nb-NO': {'title': 'Lokaliseringer'},
  },
);

Widget buildTestWidgetWithLocale(Locale locale) {
  return MaterialApp(
    locale: locale,
    localizationsDelegates: [
      ...GlobalMaterialLocalizations.delegates,
      minimalLocalizationsDelegate,
    ],
    supportedLocales: minimalLocalizationsDelegate.supportedLocales(),
    home: Scaffold(
      body: Builder(
        builder: (context) => Text(
          MinimalLocalizations.of(context).string('title'),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('MyTestApp find [en] text', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidgetWithLocale(const Locale('en')));
    await tester.pump();
    final hiFinder = find.text('Localizations');
    expect(hiFinder, findsOneWidget);
  });

  testWidgets('MyTestApp find [nb-NO] text', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestWidgetWithLocale(const Locale('nb', 'NO')));
    await tester.pump();
    final hiFinder = find.text('Lokaliseringer');
    expect(hiFinder, findsOneWidget);
  });

  test('Test MinimalLocalizationsDelegate is supported', () {
    final delegate = MinimalLocalizationsDelegate({
      'en': {'title': 'Minimal Localizations'},
      'nb-NO': {'title': 'Minimal Lokaliseringer'},
    });
    expect(delegate.isSupported(const Locale('en')), true);
    expect(delegate.isSupported(const Locale('nb', 'NO')), true);
    expect(delegate.isSupported(const Locale('nb')), false);
  });
}
