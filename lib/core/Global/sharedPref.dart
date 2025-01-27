import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {

  // CREATE or UPDATE operation
  static Future<void> put(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  // READ operation
  static Future<dynamic> get(String key, dynamic defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    if (defaultValue is String) {
      return prefs.getString(key) ?? defaultValue;
    } else if (defaultValue is int) {
      return prefs.getInt(key) ?? defaultValue;
    } else if (defaultValue is bool) {
      return prefs.getBool(key) ?? defaultValue;
    } else if (defaultValue is double) {
      return prefs.getDouble(key) ?? defaultValue;
    } else if (defaultValue is List<String>) {
      return prefs.getStringList(key) ?? defaultValue;
    }
  }

  // DELETE operation
  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // CLEAR all stored data
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // Check if a key exists
  static Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static init(SharedPreferences prefs) {}
}
