import 'package:flutter/material.dart';
import 'package:minimal_localizations/minimal_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

extension LocalizedString on String {
  String tr(BuildContext context) {
    return MinimalLocalizations.of(context).string(this);
  }
}

void main() {
  runApp(const MyApp());
}

final minimalLocalizationsDelegate = MinimalLocalizationsDelegate(
  {
    'en': {'title': 'Minimal Localizations'},
    'nb-NO': {'title': 'Minimal Lokaliseringer'},
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        minimalLocalizationsDelegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('nb', 'NO'),
      ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr(context)),
      ),
      body: Center(
        child: Text('title'.tr(context)),
      ),
    );
  }
}
