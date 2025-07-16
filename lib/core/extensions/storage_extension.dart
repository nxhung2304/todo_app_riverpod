import 'dart:convert';

import 'package:learn_riverpod/core/services/storage_service.dart';

extension StorageServiceExtensions on StorageService {
  Future<T?> getModel<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final jsonString = await getString(key);
      if (jsonString == null || jsonString.isEmpty) return null;
      
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveModel<T>(
    String key,
    T model,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    try {
      final jsonString = jsonEncode(toJson(model));
      return setString(key, jsonString);
    } catch (e) {
      return false;
    }
  }
}

