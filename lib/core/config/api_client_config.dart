import 'package:learn_riverpod/core/config/enviroment.dart';

class ApiClientConfig {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Map<String, String> defaultHeaders;
  final bool enableLogging;
  final int maxRetries;
  final bool cacheEnabled;
  final Duration cacheDuration;
  
  const ApiClientConfig({
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    this.defaultHeaders = const {},
    required this.enableLogging,
    required this.maxRetries,
    required this.cacheEnabled,
    required this.cacheDuration,
  });
  
  factory ApiClientConfig.fromEnvironment() {
    return ApiClientConfig(
      baseUrl: Environment.apiBaseUrl,
      connectTimeout: Duration(seconds: Environment.apiTimeoutConnect),
      receiveTimeout: Duration(seconds: Environment.apiTimeoutReceive),
      enableLogging: Environment.apiEnableLogging,
      maxRetries: Environment.apiMaxRetries,
      cacheEnabled: Environment.apiCacheEnabled,
      cacheDuration: Duration(minutes: Environment.apiCacheDurationMinutes),
      defaultHeaders: _buildDefaultHeaders(),
    );
  }
  
  static Map<String, String> _buildDefaultHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
  
  factory ApiClientConfig.test() {
    return ApiClientConfig.fromEnvironment().copyWith(
      enableLogging: true,
      defaultHeaders: {
        ...ApiClientConfig.fromEnvironment().defaultHeaders,
        'Environment': 'test',
      },
    );
  }
  
  factory ApiClientConfig.development() {
    return ApiClientConfig.fromEnvironment().copyWith(
      enableLogging: true,
      defaultHeaders: {
        ...ApiClientConfig.fromEnvironment().defaultHeaders,
        'Environment': 'development',
      },
    );
  }
  
  factory ApiClientConfig.staging() {
    return ApiClientConfig.fromEnvironment().copyWith(
      defaultHeaders: {
        ...ApiClientConfig.fromEnvironment().defaultHeaders,
        'Environment': 'staging',
      },
    );
  }
  
  factory ApiClientConfig.production() {
    return ApiClientConfig.fromEnvironment().copyWith(
      enableLogging: false,
      defaultHeaders: {
        ...ApiClientConfig.fromEnvironment().defaultHeaders,
        'Environment': 'production',
      },
    );
  }
  
  ApiClientConfig copyWith({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, String>? defaultHeaders,
    bool? enableLogging,
    int? maxRetries,
    bool? cacheEnabled,
    Duration? cacheDuration,
  }) {
    return ApiClientConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      defaultHeaders: defaultHeaders ?? this.defaultHeaders,
      enableLogging: enableLogging ?? this.enableLogging,
      maxRetries: maxRetries ?? this.maxRetries,
      cacheEnabled: cacheEnabled ?? this.cacheEnabled,
      cacheDuration: cacheDuration ?? this.cacheDuration,
    );
  }
}
