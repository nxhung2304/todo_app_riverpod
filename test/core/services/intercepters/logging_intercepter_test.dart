import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/intercepters/logging_intercepter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.dart';

@GenerateNiceMocks([
  MockSpec<AppLogger>(),
  MockSpec<RequestInterceptorHandler>(),
  MockSpec<ResponseInterceptorHandler>(),
  MockSpec<ErrorInterceptorHandler>(),
])
import 'logging_intercepter_test.mocks.dart';

void main() {
  late LoggingInterceptor interceptor;
  late MockAppLogger mockLogger;
  late MockRequestInterceptorHandler mockRequestHandler;
  late MockResponseInterceptorHandler mockResponseHandler;
  late MockErrorInterceptorHandler mockErrorHandler;

  setUp(() {
    mockLogger = MockAppLogger();
    mockRequestHandler = MockRequestInterceptorHandler();
    mockResponseHandler = MockResponseInterceptorHandler();
    mockErrorHandler = MockErrorInterceptorHandler();
  });

  tearDownAll(() {
    TestHelper.tearDownTestEnvironment();
  });

  group('LoggingIntercepter Test', () {
    group('when logging enabled', () {
      setUp(() {
        interceptor = LoggingInterceptor(
          logger: mockLogger,
          enableLogging: true,
        );
      });
      test('should log request when onRequest called', () {
        final options = RequestOptions(path: '/users', method: 'GET');

        interceptor.onRequest(options, mockRequestHandler);

        verify(mockLogger.debug('[Request] [GET] /users')).called(1);
        verify(mockRequestHandler.next(options)).called(1);
      });
      test('should log response when onResponse called', () {
        final requestOptions = RequestOptions(path: '/users', method: 'GET');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: 200,
        );

        interceptor.onResponse(response, mockResponseHandler);

        verify(mockLogger.debug('[Response] [200] /users')).called(1);
        verify(mockResponseHandler.next(response)).called(1);
      });

      test('should log error when onError called', () {
        final requestOptions = RequestOptions(path: '/users', method: 'POST');
        final dioError = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.connectionTimeout,
        );

        interceptor.onError(dioError, mockErrorHandler);

        verify(mockLogger.error('[Error] [POST] /users')).called(1);
        verify(mockErrorHandler.next(dioError)).called(1);
      });

      group('different HTTP methods', () {
        test('should log correctly for all HTTP methods', () {
          final methods = ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'];

          for (final method in methods) {
            final options = RequestOptions(path: '/test', method: method);
            interceptor.onRequest(options, mockRequestHandler);

            verify(mockLogger.debug('[Request] [$method] /test')).called(1);
          }
        });
      });

      group('different response status codes', () {
        test('should log different status codes correctly', () {
          final statusCodes = [200, 201, 400, 401, 404, 500];

          for (final statusCode in statusCodes) {
            final response = Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: statusCode,
            );

            interceptor.onResponse(response, mockResponseHandler);
            verify(
              mockLogger.debug('[Response] [$statusCode] /test'),
            ).called(1);
          }
        });
      });
    });
  });

  group('when logging disabled', () {
    setUp(() {
      interceptor = LoggingInterceptor(
        logger: mockLogger,
        enableLogging: false,
      );
    });

    test('should not log request when logging disabled', () {
      final options = RequestOptions(path: '/users', method: 'GET');

      interceptor.onRequest(options, mockRequestHandler);

      verifyNever(mockLogger.debug(any));
      verify(mockRequestHandler.next(options)).called(1);
    });
    test('should not log response when logging disabled', () {
      final response = Response(
        requestOptions: RequestOptions(path: '/users'),
        statusCode: 200,
      );

      interceptor.onResponse(response, mockResponseHandler);

      verifyNever(mockLogger.debug(any));
      verify(mockResponseHandler.next(response)).called(1);
    });

    test('should not log error when logging disabled', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/users'),
        type: DioExceptionType.connectionTimeout,
      );

      interceptor.onError(dioError, mockErrorHandler);

      verifyNever(mockLogger.error(any));
      verify(mockErrorHandler.next(dioError)).called(1);
    });
  });
}
