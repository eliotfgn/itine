import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domains/models/user/user.dart';

class SessionStorageService {
  Future<void> saveConnectedUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(Keys.userInfos, jsonEncode(user.toJson()));
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(Keys.token, token);
  }

  Future<void> save(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
  }

  Future<String?> get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(Keys.token);
  }

  Future<User?> getConnectedUser() async {
    User? user;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userInfos = prefs.getString(Keys.userInfos);

    if (userInfos != null) {
      user = User.fromJson(jsonDecode(userInfos));
    }

    return user;
  }

  Future<bool> isConnectedUser() async {
    return (await getConnectedUser()) != null;
  }

  Future<bool> isFirstAppLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? firstTime = prefs.getString(Keys.firstTime);

    return firstTime == null;
  }

  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(Keys.userInfos);
    prefs.remove(Keys.token);
  }
}

class Keys {
  static const String userInfos = 'userInfos';
  static const String token = 'token';
  static const String firstTime = 'firstTime';
}
