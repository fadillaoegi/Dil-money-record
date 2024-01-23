import 'dart:convert';
import 'package:dilrecord_money/controllers/user_controller.dart';
import 'package:dilrecord_money/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionUser {
  static const userKey = "userKey";
// MENYIMPAN USER LOGIN?REGISTER
  static Future<bool> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await prefs.setString(userKey, stringUser);
    if (success) {
      final controllUser = Get.put(UserController());
      controllUser.setData(user);
    }
    return success;
  }

// MENAMBAH USER
  static Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    User user = User();
    String? stringUser = prefs.get(userKey) as String?;
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final controllUser = Get.put(UserController());
    controllUser.setData(user);
    return user;
  }

// CLEAR USER (Logout)
  static Future<bool> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    bool success = await prefs.remove(userKey);
    final controllUser = Get.put(UserController());
    controllUser.setData(User());
    // Map<String, dynamic> mapUser = user.toJson();
    // String stringUser = jsonEncode(mapUser);
    return success;
  }
}
