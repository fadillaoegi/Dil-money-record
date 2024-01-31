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
      SessionUser.saveUser(User.fromJson(mapUser));
    } else {
      Get.snackbar("Login Gagal", "Email atau Password Salah");
    }

    return responseLogin["success"];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = ApiApps.login;
    Map? responseLogin = await AppRequest.posts(url, {
      "name": name,
      "email": email,
      "password": password,
    });
    if (responseLogin == null) return false;

    if (responseLogin["success"]) {
      var mapUser = responseLogin["data"];
      SessionUser.saveUser(User.fromJson(mapUser));
    } else {
      Get.snackbar("Register Gagal", "Pastikan semua form terisi");
    }

    return responseLogin["success"];
  }
}
