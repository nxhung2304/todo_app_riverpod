import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static StorageService? _instance;
  static StorageService get instance =>
      _instance ??= StorageService._internal();

  factory StorageService() => instance;
  StorageService._internal();

  SharedPreferences? _prefs;

  @visibleForTesting
  static void resetInstanceForTesting() {
    _instance = null;
  }

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();

    return _prefs!;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await _getPrefs();

    return await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _getPrefs();

    return prefs.getString(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final prefs = await _getPrefs();

    return await prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final prefs = await _getPrefs();

    return prefs.getStringList(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await _getPrefs();

    return await prefs.remove(key);
  }

  Future<bool> clear() async {
    final prefs = await _getPrefs();

    return await prefs.clear();
  }
}
