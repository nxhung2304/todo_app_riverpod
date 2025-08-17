import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/token_storage_service.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';

class AuthInterceptor extends Interceptor {
  final AppLogger logger;
  final TokenStorageService tokenStorageService;
  final Ref ref;
  final Dio dio;

  AuthInterceptor({
    required this.logger,
    required this.tokenStorageService,
    required this.ref,
    required this.dio,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _addAuthHeaders(options);

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshStatus = await _refreshToken(handler);
      if (refreshStatus) {
        final retryResponse = await _retryRequest(err.requestOptions);
        return handler.resolve(retryResponse);
      } else {
        await _redirectToLogin();
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  Future<void> _addAuthHeaders(RequestOptions options) async {
    final tokens = await _getStoredTokens();
    if (tokens != null) {
      options.headers.addAll({
        'access-token': tokens.accessToken,
        'client': tokens.client,
        'uid': tokens.uid,
        'token-type': tokens.tokenType,
        'expiry': tokens.expiry.toString(),
      });

      logger.debug('Auth headers added to request');
    }
  }

  Future<AuthTokens?> _getStoredTokens() async {
    final storage = ref.read(storageServiceProvider);
    final tokenString = await storage.getString('auth_tokens');
    if (tokenString != null && tokenString.isNotEmpty) {
      final tokenJson = jsonDecode(tokenString) as Map<String, dynamic>;
      return AuthTokens.fromJson(tokenJson);
    }
    return null;
  }

  Future<bool> _refreshToken(handler) async {
    try {
      final config = ref.watch(apiClientConfigProvider);

      final refreshDio = Dio(
        BaseOptions(
          baseUrl: config.baseUrl,
          connectTimeout: config.connectTimeout,
          receiveTimeout: config.receiveTimeout,
        ),
      );

      final tempOptions = RequestOptions(path: ApiEndpoints.validateToken);

      await _addAuthHeaders(tempOptions);

      final response = await refreshDio.get(
        ApiEndpoints.validateToken,
        options: Options(headers: tempOptions.headers),
      );
      if (response.statusCode == 200) {
        _updateTokensFromHeaders(response.headers);
        return true;
      }
    } catch (e) {
      logger.error(e.toString());
    }

    return false;
  }

  Future<void> _updateTokensFromHeaders(Headers headers) async {
    final accessToken = headers.value('access-token');
    final client = headers.value('client');
    final uid = headers.value('uid');
    final expiry = headers.value('expiry');
    final tokenType = headers.value('token-type');

    if (accessToken != null && client != null && uid != null) {
      final newTokens = AuthTokens(
        accessToken: accessToken,
        client: client,
        uid: uid,
        expiry: int.tryParse(expiry ?? '0') ?? 0,
        tokenType: tokenType ?? 'Bearer',
      );

      tokenStorageService.saveTokens(newTokens);
      logger.debug('Tokens updated from response headers');
    }
  }

  Future<Response> _retryRequest(RequestOptions originalOptions) async {
    logger.info("Calling _retryRequest");

    await _addAuthHeaders(originalOptions);

    return await dio.request(
      originalOptions.path,
      data: originalOptions.data,
      queryParameters: originalOptions.queryParameters,
      options: Options(
        method: originalOptions.method,
        headers: originalOptions.headers,
        responseType: originalOptions.responseType,
        contentType: originalOptions.contentType,
      ),
    );
  }

  Future<void> _redirectToLogin() async {
    await tokenStorageService.clearTokens();

    await ref.read(authNotifierProvider.notifier).logout();
  }
}
