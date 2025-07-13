import 'package:flutter/material.dart';

class SupportedLocales {
  static const List<Locale> locales = [Locale('en', 'US'), Locale('vi', 'VN')];

  static const Locale defaultLocale = Locale('vi', 'VN');

  static Locale? getLocaleFromLanguageCode(String languageCode) {
    return locales.firstWhere(
      (locale) => locale.languageCode == languageCode,
      orElse: () => defaultLocale,
    );
  }
}
