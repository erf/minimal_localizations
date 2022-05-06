# minimal_localizations

Localize your Flutter app given a `Map` of translations per language.

It's based on the [minimal localization example](https://github.com/flutter/website/tree/main/examples/internationalization/minimal), but lets you pass a map of translations in the constructor.

We've also added methods to get a `value`, a `string` or a list of `supportedLocales`.

## Features

- Great for smaller projects to get started with localization
- Simple to use (no code gen)
- Just code (no assets)
- Supports both String and dynamic type
- Create supportedLocales automatically
- No dependencies

## Usage

See [example](example).

### Install

Add to your `pubspec.yaml`

```yaml
dependencies:
  minimal_localizations:
```

### Add translations-per-language Map to MaterialApp

Declare a `MinimalLocalizationsDelegate` variable given a map of translations
per language tag.

> The language tag must be a valid Unicode BCP47. See [https://www.unicode.org/reports/tr35/](https://www.unicode.org/reports/tr35/) for details.

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

Add it to `MaterialApp` and call `supportedLocales`.

```Dart
MaterialApp(
  localizationsDelegates: [
    ...GlobalMaterialLocalizations.delegates,
    minimalLocalizationsDelegate,
  ],
  supportedLocales: minimalLocalizationsDelegate.supportedLocales(),
}
```

### API

Translate dynamic values using

```Dart
MinimalLocalizations.of(context).value('some_value')
```

Translate strings using

```Dart
MinimalLocalizations.of(context).string('Hi')
```

We keep the API simple, but you can easily add an extension method to `String`
like this:

```Dart
extension LocalizedString on String {
  String tr(BuildContext context) => MinimalLocalizations.of(context).string(this);
}
```

### Note on **iOS**

Add supported languages to `ios/Runner/Info.plist` as described
[here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#specifying-supportedlocales).

Example:

```
<key>CFBundleLocalizations</key>
<array>
	<string>en</string>
	<string>nb-NO</string>
</array>
```