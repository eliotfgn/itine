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
}

class Keys {
  static const String userInfos = 'userInfos';
  static const String token = 'token';
}
