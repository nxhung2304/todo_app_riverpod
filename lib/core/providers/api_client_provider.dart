import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/api_client_config.dart';
import 'package:learn_riverpod/core/config/enviroment.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client_provider.g.dart';

@riverpod
ApiClientConfig apiClientConfig(Ref ref) {
  switch (Environment.current) {
  case AppEnvironment.test:
      return ApiClientConfig.test();
    case AppEnvironment.development:
      return ApiClientConfig.development();
    case AppEnvironment.staging:
      return ApiClientConfig.staging();
    case AppEnvironment.production:
      return ApiClientConfig.production();
  }
}

@riverpod
ApiClient apiClient(Ref ref, String baseUrl) {
  return ApiClient(baseUrl: baseUrl);
}
