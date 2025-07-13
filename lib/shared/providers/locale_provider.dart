import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    return const Locale('en');
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}
