import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_riverpod/app.dart';
import 'package:learn_riverpod/config/localization/app_locale.dart';
import 'package:learn_riverpod/core/di/app_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await AppInjection.init();
  } catch (e) {
    print('App initialization failed: $e');
  }

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocale.supportedLocales,
        path: AppLocale.translationsPath,
        fallbackLocale: AppLocale.fallbackLocale,
        child: App(),
      ),
    ),
  );
}
