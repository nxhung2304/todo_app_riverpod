import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';

class AppInjection {
  static Future<void> init() async {
    await _initLocalization();
    await _initDotEnv();
    await _initStorage();
  }

  static Future<void> _initLocalization() async {
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> _initStorage() async {
    await StorageService().init();
  }

  static Future<void> _initDotEnv() async {
    await dotenv.load(fileName: ".env");
  }
}
