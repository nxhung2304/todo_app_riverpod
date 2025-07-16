import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_riverpod/app.dart';
import 'package:learn_riverpod/core/config/localization/app_locale.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();

    await EasyLocalization.ensureInitialized();
    await dotenv.load(fileName: ".env");
    await StorageService().init();
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
