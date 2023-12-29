import 'dart:convert';
import 'package:dilrecord_money/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionUser {

// MENYIMPAN USER LOGIN?REGISTER
  static Future<bool> saveUser(User user) async {
    const userKey = "userKey";
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await prefs.setString(userKey, stringUser);
    return success;
  }

// MENAMBAH USER
  static Future<User> getUser() async {
    const userKey = "userKey";
    final prefs = await SharedPreferences.getInstance();
    User user = User();
    String? stringUser = prefs.get(userKey) as String?;
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    return user;
  }

  static Future<bool> clearUser(User user) async {
    const userKey = "userKey";
    final prefs = await SharedPreferences.getInstance();
    bool success = await prefs.remove(userKey);
    // Map<String, dynamic> mapUser = user.toJson();
    // String stringUser = jsonEncode(mapUser);
    return success;
  }
}
