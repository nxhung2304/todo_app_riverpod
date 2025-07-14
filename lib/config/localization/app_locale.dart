import 'package:flutter/material.dart';

enum AppLocale {
  vietnamese,
  english;

  static const Map<AppLocale, LocaleData> _localeData = {
    AppLocale.vietnamese: LocaleData(
      languageCode: 'vi',
      countryCode: 'VN',
      nativeName: 'Tiếng Việt',
      englishName: 'Vietnamese',
      flag: '🇻🇳',
    ),
    AppLocale.english: LocaleData(
      languageCode: 'en',
      countryCode: 'US',
      nativeName: 'English',
      englishName: 'English',
      flag: '🇺🇸',
    ),
  };

  LocaleData get data => _localeData[this]!;
  Locale get locale => Locale(data.languageCode, data.countryCode);
  String get nativeName => data.nativeName;
  String get englishName => data.englishName;
  String get flag => data.flag;

  static List<Locale> get supportedLocales =>
      AppLocale.values.map((e) => e.locale).toList();

  static const AppLocale defaultLocale = AppLocale.vietnamese;

  static AppLocale? fromLanguageCode(String languageCode) {
    for (final locale in AppLocale.values) {
      if (locale.data.languageCode == languageCode) {
        return locale;
      }
    }
    return null;
  }

  static AppLocale? fromLocale(Locale locale) {
    try {
      return AppLocale.values.firstWhere(
        (appLocale) => appLocale.data.languageCode == locale.languageCode,
      );
    } catch (e) {
      return null;
    }
  }

  static const String translationsPath = 'assets/translations';
  static const Locale fallbackLocale = Locale('vi', 'VN');
}

class LocaleData {
  final String languageCode;
  final String countryCode;
  final String nativeName;
  final String englishName;
  final String flag;

  const LocaleData({
    required this.languageCode,
    required this.countryCode,
    required this.nativeName,
    required this.englishName,
    required this.flag,
  });
}
