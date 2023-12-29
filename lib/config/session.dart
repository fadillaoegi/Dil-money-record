import 'dart:convert';

import 'package:dilrecord_money/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionUser {
  static Future<bool> saveUser(User user) async {
    const userKey = "userKey";
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await prefs.setString(userKey, stringUser);
    return success;
  }

  // static Future<bool> getUser() async {
  //   const userKey = "userKey";
  //   final prefs = await SharedPreferences.getInstance();
  //   User user = User();
  //   Map<String, dynamic> mapUser = user.toJson();
  //   String stringUser = jsonEncode(mapUser);
  //   bool success = await prefs.setString(userKey, stringUser);
  //   return success;
  // }
}
