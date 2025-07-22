import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/core/config/enviroment.dart';
import '../../helpers/test_helper.dart';

void main() {
  group('Environment Configurations Tests', () {
    setUpAll(() async {
      await TestHelper.setupTestEnv();
    });

    tearDownAll(() {
      TestHelper.tearDownTestEnvironment();
    });

    group("Baisc Environment Loading", () {
      test('should load environment variables correctly', () {
        expect(Environment.apiBaseUrl, 'https://api-test.example.com');
        expect(Environment.apiTimeoutConnect, 5);
        expect(Environment.apiTimeoutReceive, 5);
        expect(Environment.apiMaxRetries, 1);
        expect(Environment.apiEnableLogging, false);
        expect(Environment.apiEnableLogging, false);
        expect(Environment.apiCacheEnabled, false);
        expect(Environment.apiCacheDurationMinutes, 1);

        expect(Environment.debugMode, true);
        expect(Environment.logLevel, 'debug');

        expect(Environment.authClientId, 'test_client_id');
        expect(Environment.authClientSecret, 'test_client_secret');
        expect(Environment.authTokenRefreshThresholdMinutes, 1);
      });
    });

    group("Data Type Parsing", () {
      test('should parse "false" string as false boolean', () {
        expect(Environment.apiEnableLogging, false);
      });
      test('should parse "true" string as true boolean', () {
        expect(Environment.debugMode, true);
      });

      test('should parse bool values correctly', () {
        expect(Environment.apiEnableLogging, false);
        expect(Environment.apiCacheEnabled, false);
      });

      test('should parse int values correctly', () {
        expect(Environment.authTokenRefreshThresholdMinutes, 1);
      });
    });

    group("Integer Parsing", () {
      test("should parse valid integer strings correctly", () {
        expect(Environment.apiTimeoutConnect, 5);
        expect(Environment.authTokenRefreshThresholdMinutes, 1);
      });

      test('should handle zero and negative values', () {
        TestHelper.overrideEnvVar('API_TIMEOUT_CONNECT', '0');
        expect(Environment.apiTimeoutConnect, 0);

        TestHelper.overrideEnvVar('API_TIMEOUT_CONNECT', '-1');
        expect(Environment.apiTimeoutConnect, -1);

        TestHelper.overrideEnvVar('API_TIMEOUT_CONNECT', '5');
      });
      test('should handle large integer values', () {
        TestHelper.overrideEnvVar('API_TIMEOUT_CONNECT', '999999');
        expect(Environment.apiTimeoutConnect, 999999);

        TestHelper.overrideEnvVar('API_TIMEOUT_CONNECT', '5');
      });
    });

    group('String Parsing', () {
      test('should parse string values correctly', () {
        expect(Environment.apiBaseUrl, isA<String>());
        expect(Environment.logLevel, 'debug');
        expect(Environment.authClientId, 'test_client_id');
      });

      test('should handle special characters in strings', () {
        final specialUrl = 'https://api-test.example.com/v1?key=123&secret=abc';
        TestHelper.overrideEnvVar('API_BASE_URL', specialUrl);
        expect(Environment.apiBaseUrl, specialUrl);

        // Restore
        TestHelper.overrideEnvVar(
          'API_BASE_URL',
          'https://api-test.example.com',
        );
      });
    });

    group('Error Handling', () {
      tearDown(() {
        TestHelper.restoreAllEnvironmentVariables();
      });

      group('Missing Environment Variables', () {
        test(
          'should throw meaningful exception when API_BASE_URL is missing',
          () {
            TestHelper.removeEnvVar('API_BASE_URL');

            expect(
              () => Environment.apiBaseUrl,
              throwsA(
                isA<Exception>().having(
                  (e) => e.toString(),
                  'message',
                  contains('API_BASE_URL is not defined'),
                ),
              ),
            );
          },
        );

        test(
          'should throw meaningful exception when API_TIMEOUT_CONNECT is missing',
          () {
            TestHelper.removeEnvVar('API_BASE_URL');

            expect(
              () => Environment.apiBaseUrl,
              throwsA(
                isA<Exception>().having(
                  (e) => e.toString(),
                  'message',
                  contains('API_BASE_URL is not defined'),
                ),
              ),
            );
          },
        );
        test('should throw exception when integer env var is missing', () {
          TestHelper.removeEnvVar('API_TIMEOUT_CONNECT');

          expect(
            () => Environment.apiTimeoutConnect,
            throwsA(isA<Exception>()),
          );
        });

        test('should throw exception when boolean env var is missing', () {
          TestHelper.removeEnvVar('DEBUG_MODE');

          expect(() => Environment.debugMode, throwsA(isA<Exception>()));
        });
      });
    });
  });
}
