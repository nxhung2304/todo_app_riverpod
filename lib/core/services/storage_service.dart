import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  factory StorageService() => _instance;
  StorageService._internal();

  SharedPreferences? _prefs;

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

  Future<List<String>?> getStringList(String key) async{
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
