// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class AppFormat {
  static String date(String StringDate) {
    // Default format => 2024-02-2024
    DateTime dateTime = DateTime.parse(StringDate);
    return DateFormat("dd MMM yyyy", "id_ID")
        .format(dateTime); // Hasil => 25 Feb 2024
  }
}
