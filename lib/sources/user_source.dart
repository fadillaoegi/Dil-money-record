// ignore_for_file: avoid_print

import 'package:dilrecord_money/config/apis.dart';
import 'package:dilrecord_money/config/app_request_config.dart';
import 'package:dilrecord_money/config/session.dart';
import 'package:dilrecord_money/models/user.dart';
import 'package:get/get.dart';

class UserSource {
  static Future<bool> login(String email, String password) async {
    String url = ApiApps.login;
    Map? responseLogin = await AppRequest.posts(url, {
      "email": email,
      "password": password,
    });
    if (responseLogin == null) return false;

    if (responseLogin["success"]) {
      var mapUser = responseLogin["data"];
      print("data dari userSource $mapUser");
      SessionUser.saveUser(User.fromJson(mapUser));
    } else {
      Get.snackbar("Login Gagal", "Email atau Password Salah");
    }

    return responseLogin["success"];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = ApiApps.register;
    Map? responseRegister = await AppRequest.posts(url, {
      "name": name,
      "email": email,
      "password": password,
      "created_at": DateTime.now().toIso8601String(),
      "updated_at": DateTime.now().toIso8601String(),
    });
    if (responseRegister == null) return false;

    if (responseRegister["success"]) {
      Get.snackbar("Register Berhasil", "Silahkan login");
      print("Register Berhasil Silahkan login");
    } else {
      // Get.snackbar("Register Gagal", "Pastikan semua form terisi");
      if (responseRegister['message'] == 'email') {
        Get.snackbar("Register Gagal", "Email telah terdaftar");
        print("Email telah terdaftar");
      } else {
        print("Gagal Register");
      }
      // DInfo.closeDialog();
    }

    return responseRegister["success"];
  }
}
