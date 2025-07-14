import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_riverpod/app.dart';
import 'package:learn_riverpod/config/localization/supported_locales.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';

Future<void> injection() async {
  await EasyLocalization.ensureInitialized();
  await StorageService().init();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injection();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: SupportedLocales.locales,
        path: 'assets/translations',
        fallbackLocale: SupportedLocales.defaultLocale,
        child: App(),
      ),
    ),
  );
}
