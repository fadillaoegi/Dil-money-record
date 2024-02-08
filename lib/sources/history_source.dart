// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:dilrecord_money/config/apis.dart';
import 'package:dilrecord_money/config/app_request_config.dart';
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
        "today": 0,
        "yesterday": 0,
        "weeks": [0, 0, 0, 0, 0, 0, 0],
        "mount": {
          "income": 0,
          "outcome": 0,
        }
      };

    return responseAnalysis;
  }
}
