# minimal_localizations

Localize your Flutter app by providing a map of translations per language, along with methods to retrieve values, strings, and supported locales.

Based on the [minimal localization example](https://github.com/flutter/website/tree/main/examples/internationalization/minimal).

## Features

- Ideal for small projects
- Easy to use without code generation
- No need for assets, just pure code
- Fast performance without asset parsing
- Supports both String and dynamic types
- Automatically generates supported locales
- No external dependencies

## Install

Add `minimal_localizations` and `flutter_localizations` as dependencies to your `pubspec.yaml`.

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  minimal_localizations:
```

### Add translations per language

Declare `MinimalLocalizationsDelegate` given a map of translations per language tag.

> Language tags must be valid [Unicode BCP47](https://www.unicode.org/reports/tr35/)

```Dart
final minimalLocalizationsDelegate = MinimalLocalizationsDelegate({
  'en': {
    'title': 'Localizations',
    'hello': 'Hello',
  },
  'nb-NO': {
    'title': 'Lokaliseringer',
    'hello': 'Hei',
  },
});
```

Add `localizationDelegates` and set `supportedLocales`.

```Dart
MaterialApp(
  localizationsDelegates: [
    ...GlobalMaterialLocalizations.delegates,
    minimalLocalizationsDelegate,
  ],
  supportedLocales: minimalLocalizationsDelegate.supportedLocales,
}
```

### Note on **iOS**

Add supported languages to `ios/Runner/Info.plist` as described
[here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#specifying-supportedlocales)

Example:

```
<key>CFBundleLocalizations</key>
<array>
	<string>en</string>
	<string>nb-NO</string>
</array>
```

### API

Translate `dynamic` values using

```Dart
MinimalLocalizations.of(context).value('some_value')
```

Translate `String` values using

```Dart
MinimalLocalizations.of(context).string('Hi')
```

We keep the API minimal, but you can easily add an `extension` method to `String` like this:

```Dart
extension LocalizedString on String {
  String tr(BuildContext context) => MinimalLocalizations.of(context).string(this);
}
```

So you can translate `String` values like this:

```Dart
'Hi'.tr(context)
```

## Example

See [example](example)
