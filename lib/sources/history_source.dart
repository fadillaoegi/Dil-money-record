// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print
import 'package:dilrecord_money/config/apis.dart';
import 'package:dilrecord_money/config/app_request_config.dart';
import 'package:dilrecord_money/models/history.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistorySource {
  static Future<Map> analysis(String idUser) async {
    String url = ApiApps.analysis;
    Map? responseAnalysis = await AppRequest.posts(url, {
      "id_user": idUser,
      "today": DateFormat("yyyy-MM-dd").format(DateTime.now())
    });

    if (responseAnalysis == null)
      return {
        "today": 0.0,
        "yesterday": 0.0,
        "weeks": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        "mount": {
          "income": 0.0,
          "outcome": 0.0,
        }
      };

    return responseAnalysis;
  }

  static Future<bool> addIncomeOutcome(String idUser, String type, String date,
      String detail, String total) async {
    String url = ApiApps.addIncomeOutcome;
    Map? responseAdd = await AppRequest.posts(url, {
      "id_user": idUser,
      "date": date,
      "type": type,
      "detail": detail,
      "total": total,
      "created_at": DateTime.now().toIso8601String(),
      "updated_at": DateTime.now().toIso8601String(),
    });

    if (responseAdd == null) {
      return false;
    }

    if (responseAdd["success"]) {
      print("Add $type Berhasil");
      Get.snackbar("Add $type", "Berhasil");
    } else {
      if (responseAdd["date"] == "date") {
        print("Add $type Tanggal sudah ada");
        Get.snackbar("Add $type", "Tanggal sudah ada");
      } else {
        print("Add $type Gagal");
        Get.snackbar("Add $type", "Tanggal sudah ada");
      }
    }
    return responseAdd["success"];
  }

  static Future<List<History>> inOutcome(String userId, String type) async {
    String url = ApiApps.inOutcome;
    Map? responseInOutCome = await AppRequest.posts(url, {
      "id_user": userId,
      "type": type,
    });

    if (responseInOutCome == null) return [];
    if (responseInOutCome["success"]) {
      List list = responseInOutCome["data"];
      final listToModel =
          list.map((element) => History.fromJson(element)).toList();
      print("ini data list $list");
      print("ini data listData $listToModel");
      return listToModel;
    }

    return [];
  }

  static Future<List<History>> inOutcomeSearch(
      String userId, String type, String date) async {
    String url = ApiApps.search;
    Map? responseSearch = await AppRequest.posts(url, {
      "id_user": userId,
      "type": type,
      "date": date,
    });

    if (responseSearch == null) return [];
    if (responseSearch["success"]) {
      List listRes = responseSearch["data"];
      final listToModel =
          listRes.map((element) => History.fromJson(element)).toList();

      return listToModel;
    }

    return [];
  }
}
