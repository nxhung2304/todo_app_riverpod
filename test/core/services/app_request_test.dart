import 'package:dio/dio.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:learn_riverpod/core/exceptions/network_exception.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/app_request.dart';
import 'package:learn_riverpod/core/services/network_connectivity.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.dart';

@GenerateNiceMocks([MockSpec<AppLogger>()])
@GenerateNiceMocks([MockSpec<NetworkConnectivity>()])
import 'app_request_test.mocks.dart';

void main() {
  group('AppRequest Tests', () {
    late MockAppLogger mockAppLogger;
    late MockNetworkConnectivity mockNetworkConnectivity;
    late AppRequest appRequest;

    setUp(() {
      mockNetworkConnectivity = MockNetworkConnectivity();
      mockAppLogger = MockAppLogger();
      appRequest = AppRequest(
        appLogger: mockAppLogger,
        networkConnectivity: mockNetworkConnectivity,
      );
    });
    tearDownAll(() {
      TestHelper.tearDownTestEnvironment();
    });

    group('perform method', () {
      group('Network connectivity checks', () {
        test('should return data when connected network', () async {
          when(
            mockNetworkConnectivity.isConnected(),
          ).thenAnswer((_) async => true);

          mockRequest() async => TestHelper().mockRequest();
          final result = await appRequest.perform(mockRequest, null);

          expect(result.isSuccess, true);
        });

        test('should throw Exception when disconnected network', () async {
          when(
            mockNetworkConnectivity.isConnected(),
          ).thenAnswer((_) async => false);

          mockRequest() async => TestHelper().mockRequest();
          final result = await appRequest.perform(mockRequest, null);

          expect(result.error, NetworkException.notConnected().message);
        });
      });

      group('Successful responses', () {
        setUp(() {
          when(
            mockNetworkConnectivity.isConnected(),
          ).thenAnswer((_) async => true);
        });
        test('should response 200 with fromJson', () async {
          final responseData = {
            'id': '1',
            'name': 'Test User',
            'email': 'test@example.com',
          };
          mockRequest() async =>
              TestHelper().mockRequest(statusCode: 200, data: responseData);

          User fromJson(Map<String, dynamic> json) => User(
            id: json['id'],
            fullName: json['name'],
            email: json['email'],
          );
          final result = await appRequest.perform(mockRequest, fromJson);
          expect(result.isSuccess, true);
          expect(result.data, isA<User>());
          expect(result.data?.id, '1');
          expect(result.data?.fullName, 'Test User');
          expect(result.data?.email, 'test@example.com');
          expect(result.error, isNull);
        });

        test('should response 200 with fromJson is null', () async {
          final responseData = {
            'id': '1',
            'name': 'Test User',
            'email': 'test@example.com',
          };
          mockRequest() async =>
              TestHelper().mockRequest(statusCode: 200, data: responseData);

          final result = await appRequest.perform(mockRequest, null);
          expect(result.isSuccess, true);
          expect(result.error, isNull);
        });
      });

      group('Error responses', () {
        setUp(() {
          when(
            mockNetworkConnectivity.isConnected(),
          ).thenAnswer((_) async => true);
        });
        test('should response 400', () async {
          mockRequest() async => TestHelper().mockRequest(
            statusCode: 400,
            data: {'error': 'Bad request'},
          );

          final result = await appRequest.perform(mockRequest, null);
          expect(result.isSuccess, false);
          expect(result.data, isNull);
          expect(result.error, 'HTTP 400');
        });
        test('should response 500', () async {
          when(
            mockNetworkConnectivity.isConnected(),
          ).thenAnswer((_) async => true);

          mockRequest() async => TestHelper().mockRequest(
            statusCode: 500,
            data: {'error': 'Internal server error'},
          );

          final result = await appRequest.perform(mockRequest, null);
          expect(result.isSuccess, false);
          expect(result.data, isNull);
          expect(result.error, 'HTTP 500');
        });
      });

      group('DioException handling', () {
        setUp(() {
          when(
            mockNetworkConnectivity.isConnected(),
          ).thenAnswer((_) async => true);
        });
        test('should handle connection timeout', () async {
          mockRequest() async =>
              throw DioException.connectionTimeout(
                timeout: const Duration(seconds: 30),
                requestOptions: RequestOptions(path: '/test'),
              );

          final result = await appRequest.perform(mockRequest, null);

          expect(result.isError, true);
          expect(result.error, 'Connection timeout');
        });

        test('should handle bad response', () async {
          mockRequest() async =>
              throw DioException.badResponse(
                statusCode: 404,
                requestOptions: RequestOptions(path: '/test'),
                response: Response(
                  statusCode: 404,
                  requestOptions: RequestOptions(path: '/test'),
                ),
              );

          final result = await appRequest.perform(mockRequest, null);

          expect(result.isError, true);
          expect(result.error, 'Server error: 404');
        });
      });
    });
  });
}
