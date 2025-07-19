import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:learn_riverpod/core/services/storage_service.dart';

import '../../helpers/test_helper.dart';
@GenerateMocks([SharedPreferences])
import 'storage_service_test.mocks.dart';

void main() {
  late StorageService storageService;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    // Reset singleton instance for each test
    StorageService.resetInstanceForTesting();
    storageService = StorageService();
    mockSharedPreferences = MockSharedPreferences();
  });

  tearDownAll(() {
    TestHelper.tearDownTestEnvironment();
  });

  group('StorageService', () {
    group('singleton pattern', () {
      test('should return same instance when called multiple times', () {
        final instance1 = StorageService();
        final instance2 = StorageService();

        expect(instance1, equals(instance2));
        expect(identical(instance1, instance2), isTrue);
      });

      test('should maintain singleton across different access patterns', () {
        final factory = StorageService();
        final instance = StorageService.instance;

        expect(factory, equals(instance));
        expect(identical(factory, instance), isTrue);
      });
    });

    group('initialization', () {
      test('should initialize SharedPreferences successfully', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});

        // Act & Assert - should not throw
        await expectLater(storageService.init(), completes);
      });

      test('should handle initialization only once', () async {
        // Arrange
        SharedPreferences.setMockInitialValues({});

        // Act
        await storageService.init();
        await storageService.init(); // Call again

        // Assert - should not throw or cause issues
        expect(storageService, isNotNull);
      });
    });

    group('string operations', () {
      setUp(() async {
        SharedPreferences.setMockInitialValues({});
        await storageService.init();
      });

      test('should store and retrieve string value', () async {
        // Arrange
        const key = 'test_key';
        const value = 'test_value';

        // Act
        final setResult = await storageService.setString(key, value);
        final retrievedValue = await storageService.getString(key);

        // Assert
        expect(setResult, isTrue);
        expect(retrievedValue, equals(value));
      });

      test('should return null for non-existent key', () async {
        // Act
        final result = await storageService.getString('non_existent_key');

        // Assert
        expect(result, isNull);
      });

      test('should overwrite existing string value', () async {
        // Arrange
        const key = 'test_key';
        const initialValue = 'initial_value';
        const newValue = 'new_value';

        // Act
        await storageService.setString(key, initialValue);
        await storageService.setString(key, newValue);
        final result = await storageService.getString(key);

        // Assert
        expect(result, equals(newValue));
      });

      test('should handle empty string values', () async {
        // Arrange
        const key = 'empty_key';
        const value = '';

        // Act
        await storageService.setString(key, value);
        final result = await storageService.getString(key);

        // Assert
        expect(result, equals(value));
      });

      test('should handle special characters in strings', () async {
        // Arrange
        const key = 'special_key';
        const value = 'Hello 世界! @#\$%^&*()_+{}|:"<>?[];\'\\,./`~';

        // Act
        await storageService.setString(key, value);
        final result = await storageService.getString(key);

        // Assert
        expect(result, equals(value));
      });

      test('should handle very long strings', () async {
        // Arrange
        const key = 'long_key';
        final value = 'a' * 10000; // 10k characters

        // Act
        await storageService.setString(key, value);
        final result = await storageService.getString(key);

        // Assert
        expect(result, equals(value));
      });
    });

    group('string list operations', () {
      setUp(() async {
        SharedPreferences.setMockInitialValues({});
        await storageService.init();
      });

      test('should store and retrieve string list', () async {
        // Arrange
        const key = 'list_key';
        const value = ['item1', 'item2', 'item3'];

        // Act
        final setResult = await storageService.setStringList(key, value);
        final retrievedValue = await storageService.getStringList(key);

        // Assert
        expect(setResult, isTrue);
        expect(retrievedValue, equals(value));
      });

      test('should return null for non-existent list key', () async {
        // Act
        final result = await storageService.getStringList('non_existent_list');

        // Assert
        expect(result, isNull);
      });

      test('should handle empty string list', () async {
        // Arrange
        const key = 'empty_list_key';
        const value = <String>[];

        // Act
        await storageService.setStringList(key, value);
        final result = await storageService.getStringList(key);

        // Assert
        expect(result, equals(value));
        expect(result, isEmpty);
      });

      test('should handle list with empty string items', () async {
        // Arrange
        const key = 'list_with_empty_items';
        const value = ['', 'item1', '', 'item2', ''];

        // Act
        await storageService.setStringList(key, value);
        final result = await storageService.getStringList(key);

        // Assert
        expect(result, equals(value));
      });

      test('should overwrite existing string list', () async {
        // Arrange
        const key = 'list_key';
        const initialValue = ['initial1', 'initial2'];
        const newValue = ['new1', 'new2', 'new3'];

        // Act
        await storageService.setStringList(key, initialValue);
        await storageService.setStringList(key, newValue);
        final result = await storageService.getStringList(key);

        // Assert
        expect(result, equals(newValue));
      });

      test('should handle large string list', () async {
        // Arrange
        const key = 'large_list_key';
        final value = List.generate(1000, (index) => 'item_$index');

        // Act
        await storageService.setStringList(key, value);
        final result = await storageService.getStringList(key);

        // Assert
        expect(result, equals(value));
        expect(result!.length, equals(1000));
      });
    });

    group('remove operations', () {
      setUp(() async {
        SharedPreferences.setMockInitialValues({
          'existing_key': 'existing_value',
          'existing_list': ['item1', 'item2'],
        });
        await storageService.init();
      });

      test('should remove existing key successfully', () async {
        // Arrange
        const key = 'existing_key';

        // Verify key exists first
        final initialValue = await storageService.getString(key);
        expect(initialValue, isNotNull);

        // Act
        final removeResult = await storageService.remove(key);
        final valueAfterRemove = await storageService.getString(key);

        // Assert
        expect(removeResult, isTrue);
        expect(valueAfterRemove, isNull);
      });

      test('should handle removing non-existent key', () async {
        // Act
        final result = await storageService.remove('non_existent_key');

        // Assert
        expect(result, isFalse);
      });

      test('should remove string list key successfully', () async {
        // Arrange
        const key = 'existing_list';

        // Verify list exists first
        final initialList = await storageService.getStringList(key);
        expect(initialList, isNotNull);

        // Act
        final removeResult = await storageService.remove(key);
        final listAfterRemove = await storageService.getStringList(key);

        // Assert
        expect(removeResult, isTrue);
        expect(listAfterRemove, isNull);
      });
    });
  });
}
