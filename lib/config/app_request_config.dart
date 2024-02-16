// ignore_for_file: body_might_complete_normally_nullable
import 'dart:convert';
import 'package:d_method/d_method.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AppRequest {
  static Future<Map?> gets(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DMethod.printTitle('try: $url', response.body);
      if (response.statusCode == 200) {
        Map? responseBody = jsonDecode(response.body);
        return responseBody;
      }
    } catch (e) {
      DMethod.printTitle('catch error: ', e.toString());
      return null;
    }
  }

  static Future<Map?> posts(String url, Object? body,
      {Map<String, String>? headers}) async {
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      DMethod.printTitle('try: $url', response.body);

      if (response.statusCode == 200) {
        Map? responseBody = jsonDecode(response.body);
        return responseBody;
      }
    } catch (e) {
      DMethod.printTitle('catch error post: ', e.toString());
      Get.snackbar("Catch", "AppRequest");
      return null;
    }
  }
}
