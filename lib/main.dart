import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_riverpod/app.dart';
import 'package:learn_riverpod/config/localization/localization_config.dart';
import 'package:learn_riverpod/core/di/injection.dart';

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
        supportedLocales: LocalizationConfig.supportedLocales,
        path: LocalizationConfig.translationsPath,
        fallbackLocale: LocalizationConfig.fallbackLocale,
        child: App(),
      ),
    ),
  );
}
