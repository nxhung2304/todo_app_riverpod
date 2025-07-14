import 'package:flutter/material.dart';
import 'package:learn_riverpod/config/localization/app_locale.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale_provider.g.dart';

@riverpod
class AppLocaleNotifier extends _$AppLocaleNotifier {
  @override
  AppLocale build() {
    _loadLocaleFromStorage();
    return AppLocale.defaultLocale;
  }

  void setLocale({required AppLocale appLocale}) {
    state = appLocale;
    _saveLocaleToStorage(appLocale);
  }

  void setLocaleByLanguageCode(String languageCode) {
    final appLocale = AppLocale.fromLanguageCode(languageCode);
    if (appLocale != null) {
      setLocale(appLocale: appLocale);
    }
  }

  void toggleLanguage() {
    final newLocale =
        state == AppLocale.vietnamese
            ? AppLocale.english
            : AppLocale.vietnamese;
    setLocale(appLocale: newLocale);
  }

  Future<void> _saveLocaleToStorage(AppLocale appLocale) async {
    try {
      // TODO: Implement shared preferences save
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('locale', appLocale.languageCode);
    } catch (e) {
      // Handle error silently
      debugPrint('Failed to save locale: $e');
    }
  }

  Future<void> _loadLocaleFromStorage() async {
    try {
      // TODO: Load from shared preferences
      // final prefs = await SharedPreferences.getInstance();
      // final savedLanguageCode = prefs.getString('locale');
      // if (savedLanguageCode != null) {
      //   final appLocale = AppLocale.fromLanguageCode(savedLanguageCode);
      //   if (appLocale != null) {
      //     state = appLocale; // Direct assignment, no need to save again
      //   }
      // }
    } catch (e) {
      // Handle error silently
      debugPrint('Failed to load locale: $e');
    }
  }
}
