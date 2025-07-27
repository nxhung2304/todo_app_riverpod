import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/api_client_config.dart';
import 'package:learn_riverpod/core/config/enviroment.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final config = ref.watch(apiClientConfigProvider);
  print(config);

  return ApiClient(baseUrl: config.baseUrl, ref: ref);
}

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  return StorageService();
}

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
AppLogger appLogger(Ref ref) {
  return AppLogger();
}
