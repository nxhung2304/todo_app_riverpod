import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment { test, development, staging, production }

class Environment {
  static AppEnvironment _currentEnvironment = AppEnvironment.development;

  static AppEnvironment get current => _currentEnvironment;

  static Future<void> initialize(AppEnvironment environment) async {
    _currentEnvironment = environment;

    String envFileName = _getEnvFileName(environment);
    await dotenv.load(fileName: envFileName);
  }

  static String _getEnvFileName(AppEnvironment environment) {
    switch (environment) {
      case AppEnvironment.development:
        return '.env.development';
      case AppEnvironment.staging:
        return '.env.staging';
      case AppEnvironment.production:
        return '.env.production';
      case AppEnvironment.test:
        return 'test/.env.test';
    }
  }

  static String get apiBaseUrl => _getString('API_BASE_URL');
  static int get apiTimeoutConnect => _getInt('API_TIMEOUT_CONNECT');
  static int get apiTimeoutReceive => _getInt('API_TIMEOUT_RECEIVE');
  static bool get apiEnableLogging => _getBool('API_ENABLE_LOGGING');
  static int get apiMaxRetries => _getInt('API_MAX_RETRIES');
  static bool get apiCacheEnabled => _getBool('API_CACHE_ENABLED');
  static int get apiCacheDurationMinutes =>
      _getInt('API_CACHE_DURATION_MINUTES');

  static int get authTokenRefreshThresholdMinutes =>
      _getInt('AUTH_TOKEN_REFRESH_THRESHOLD_MINUTES');
  static String get authClientId => _getString('AUTH_CLIENT_ID');
  static String get authClientSecret => _getString('AUTH_CLIENT_SECRET');

  static bool get debugMode => _getBool('DEBUG_MODE');
  static String get logLevel => _getString('LOG_LEVEL');

  static String _getString(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw Exception('Environment variable $key is not defined');
    }
    return value;
  }

  static int _getInt(String key) {
    final stringValue = _getString(key);
    final intValue = int.tryParse(stringValue);
    if (intValue == null) {
      throw Exception('Environment variable $key is not a valid integer');
    }
    return intValue;
  }

  static bool _getBool(String key) {
    final stringValue = _getString(key).toLowerCase();
    if (stringValue == 'true') return true;
    if (stringValue == 'false') return false;
    throw Exception('Environment variable $key is not a valid boolean');
  }

  static String getStringOrDefault(String key, String defaultValue) {
    try {
      return _getString(key);
    } catch (e) {
      return defaultValue;
    }
  }

  static int getIntOrDefault(String key, int defaultValue) {
    try {
      return _getInt(key);
    } catch (e) {
      return defaultValue;
    }
  }

  static bool getBoolOrDefault(String key, bool defaultValue) {
    try {
      return _getBool(key);
    } catch (e) {
      return defaultValue;
    }
  }

  static Future<void> initializeForTesting() async {
    _currentEnvironment = AppEnvironment.test;
  }

  static void resetForTesting() {
    _currentEnvironment = AppEnvironment.development;
  }
}
