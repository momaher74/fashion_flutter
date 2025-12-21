import 'package:shared_preferences/shared_preferences.dart';

class LocalDBService {
  final SharedPreferences _prefs;

  LocalDBService(this._prefs);

  // ============ SET ============
  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  // ============ GET ============
  String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  // ============ REMOVE / CLEAR ============
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }
}
