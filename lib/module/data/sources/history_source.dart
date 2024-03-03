// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print, unnecessary_string_interpolations
import 'package:dilrecord_money/config/apis.dart';
import 'package:dilrecord_money/config/app_request_config.dart';
import 'package:dilrecord_money/module/data/models/history.dart';
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

  // NOTE: ADD DATA InOutcome
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
      if (responseAdd["message"] == "date") {
        print("Add $type Tanggal sudah ada");
        Get.snackbar("Add $type", "Tanggal sudah ada");
      } else {
        print("Add $type Gagal");
        Get.snackbar("Add $type", "Tanggal sudah ada");
      }
    }
    return responseAdd["success"];
  }

  // NOTE: UPDATE DATA InOutcome
  static Future<bool> update(String idUser, String type, String date,
      String detail, String total) async {
    String url = ApiApps.update;
    Map? responseUpdate = await AppRequest.posts(url, {
      "id_user": idUser,
      "type": type,
      "date": date,
      "detail": detail,
      "total": total,
      "updated_at": DateTime.now().toIso8601String()
    });

    if (responseUpdate == null) {
      return false;
    }

    if (responseUpdate["success"]) {
      print("Update $type Berhasil");
      Get.snackbar("Update $type", "Berhasil");
    } else {
      if (responseUpdate["message"] == "date") {
        print("Tanggal ${responseUpdate['message']} sudah ada");
        Get.snackbar("${responseUpdate['message']}", "Tanggal sudah ada");
      }
    }
    return responseUpdate["success"];
  }

  // NOTE: DELETE DATA
  static Future<bool> delete(String idHistory) async {
    String url = ApiApps.baseUrl;
    Map? resDelete = await AppRequest.posts(url, {"id": idHistory});
    if (resDelete == null) return false;

    return resDelete["success"];
  }

  // NOTE: GET InOutcome
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
      // print("ini data list $list");
      // print("ini data listData $listToModel");
      return listToModel;
    }

    return [];
  }

  // NOTE: SEARCH DATA InOutcome
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

  static Future<History?> wheredate(String userId, String date) async {
    String url = ApiApps.whereDate;
    Map<String, String> body = {
      "id_user": userId,
      "date": date,
    };
    Map? resWhereDate = await AppRequest.posts(url, body);

    if (resWhereDate == null) {
      return null;
    }

    if (resWhereDate["success"]) {
      var data = resWhereDate["data"];
      History dataToModel = History.fromJson(data);

      return dataToModel;
    }
    return null;
  }

  // NOTE: SEARCH HISTORY
  static Future<List<History>> historySearch(String idUser, String date) async {
    String url = ApiApps.riwayatSearch;

    Map? resHisSearch = await AppRequest.posts(url, {
      "id_user": idUser,
      "date": date,
    });

    if (resHisSearch == null) {
      return [];
    }

    if (resHisSearch["success"]) {
      List listHisSearch = resHisSearch["data"];
      final listToModel =
          listHisSearch.map((e) => History.fromJson(e)).toList();
      return listToModel;
    }

    return [];
  }

  // NOTE: GET ALL HISTORY
  static Future<List<History>> fetchAllHistory(String idUser) async {
    String url = ApiApps.riwayat;

    Map? resHistory = await AppRequest.posts(url, {"id_user": idUser});

    if (resHistory == null) {
      return [];
    }

    if (resHistory["success"]) {
      List listHistory = resHistory["data"];
      final listToModel = listHistory.map((e) => History.fromJson(e)).toList();
      return listToModel;
    }

    return [];
  }
}
