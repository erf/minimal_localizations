import 'dart:ui';

extension LocaleExt on Locale {
  static Locale fromLanguageTag(String tag) {
    final List<String> codes = tag.split('-');
    return Locale(codes[0], codes.length > 1 ? codes[1] : null);
  }
}
