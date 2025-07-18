import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_riverpod/core/services/network_connectivity.dart';
import '../../helpers/test_helper.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Connectivity>()])
import 'network_connectivity_test.mocks.dart';

void main() {
  late MockConnectivity mockConnectivity;
  late NetworkConnectivity networkConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkConnectivity = NetworkConnectivity(mockConnectivity);
  });

  tearDownAll(() {
    TestHelper.tearDownTestEnvironment();
  });

  group('NetworkConnectivity Test', () {
    test('should return true when connected to wifi', () async {
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.wifi]);

      final result = await networkConnectivity.isConnected();

      expect(result, true);
    });
    test('should return true when connected to mobile', () async {
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.mobile]);

      final result = await networkConnectivity.isConnected();

      expect(result, true);
    });
    test('should return true when connected to ethernet', () async {
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.ethernet]);

      final result = await networkConnectivity.isConnected();

      expect(result, true);
    });
    test('should return true when connected to others', () async {
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.other]);

      final result = await networkConnectivity.isConnected();

      expect(result, true);
    });
    test('should return true when connected to VPN', () async {
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.vpn]);

      final result = await networkConnectivity.isConnected();

      expect(result, true);
    });
    test('should return false when connected to None', () async {
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.none]);

      final result = await networkConnectivity.isConnected();

      expect(result, false);
    });

    test('should return bool value', () async {
      final result = await networkConnectivity.isConnected();
      expect(result, isA<bool>());
    });
  });
}
