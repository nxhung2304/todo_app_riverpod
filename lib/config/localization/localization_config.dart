import 'dart:ui';

import 'package:learn_riverpod/config/localization/supported_locales.dart';

class LocalizationConfig {
  static const String translationsPath = 'assets/translations';
  static const List<Locale> supportedLocales = SupportedLocales.locales;
  static const Locale fallbackLocale = SupportedLocales.defaultLocale;
}
