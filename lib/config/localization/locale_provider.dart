import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:learn_riverpod/config/localization/supported_locales.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    return SupportedLocales.defaultLocale;
  }

  void setLocale({required Locale locale}) {
    if (!SupportedLocales.locales.contains(locale)) {
      return;
    }

    state = locale;
    _saveLocaleToStorage(locale);
  }

  void setLocaleByLanguageCode(String languageCode) {
    final locale = SupportedLocales.getLocaleFromLanguageCode(languageCode);
    if (locale != null) {
      setLocale(locale: locale);
    }
  }

  Future<void> _saveLocaleToStorage(Locale locale) async {
    // TODO: Implement shared preferences save
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('locale', locale.languageCode);
  }
}
