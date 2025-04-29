import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  Future<bool> setJSON(String key, dynamic jsonVal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(jsonVal);
    return prefs.setString(key, jsonString);
  }

  dynamic getJSON(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, val);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? val = prefs.getBool(key);
    return val ?? false;
  }

  Future<bool> setString(String key, String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, val);
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? val = prefs.getString(key);
    return val ?? "";
  }

  Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
