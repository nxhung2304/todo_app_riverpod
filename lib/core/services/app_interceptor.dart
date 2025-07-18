import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppInterceptor {
  final _logger = Logger();

  InterceptorsWrapper build() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        _logRequest(options);

        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        _logResponse(response);

        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        _logError(error);

        return handler.next(error);
      },
    );
  }

  void _logRequest(RequestOptions options) {
    _logger.d("[Request] [${options.method}] ${options.path}");
  }

  void _logResponse(Response response) {
    _logger.d(
      "[Response] [${response.statusCode}] ${response.requestOptions.path}",
    );
  }

  void _logError(DioException error) {
    _logger.e(
      "[Error] [${error.requestOptions.method}] ${error.requestOptions.path}",
    );
  }
}
