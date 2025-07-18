import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  final AppLogger logger;
  final bool enableLogging;

  LoggingInterceptor({required this.logger, this.enableLogging = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      _logRequest(options);
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enableLogging) {
      _logResponse(response);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enableLogging) {
      _logError(err);
    }

    return handler.next(err);
  }

  void _logRequest(RequestOptions options) {
    logger.debug("[Request] [${options.method}] ${options.path}");
  }

  void _logResponse(Response response) {
    logger.debug(
      "[Response] [${response.statusCode}] ${response.requestOptions.path}",
    );
  }

  void _logError(DioException error) {
    logger.error(
      "[Error] [${error.requestOptions.method}] ${error.requestOptions.path}",
    );
  }
}
