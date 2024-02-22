// ignore_for_file: invalid_use_of_protected_member
import 'dart:convert';

import 'package:dilrecord_money/data/models/history.dart';
import 'package:dilrecord_money/data/sources/history_source.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateController extends GetxController {
  // NOTE: GET DATA DATE
  final _date = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  String get date => _date.value;
  setDate(n) => _date.value = n;

  // NOTE: GET DATA TYPE
  final _type = "Pemasukan".obs;
  String get type => _type.value;
  setType(n) => _type.value = n;

  // NOTE: GET DATA ITEMS
  final _items = [].obs;
  List get items => _items.value;
  addItem(n) {
    _items.value.add(n);
    count();
  }

  deleteItem(index) {
    _items.value.removeAt(index);
    count();
  }

  // NOTE: GET DATA TOTAL
  final _total = 0.0.obs;
  double get total => _total.value;

  count() {
    _total.value = items.map((element) => element["price"]).toList().fold(0.0,
        (previousValue, element) {
      return double.parse(previousValue.toString()) + double.parse(element);
    });
  }

  initUpdate(userId, date) async {
    History? history = await HistorySource.wheredate(userId, date);
    if (history != null) {
      setDate(history.date);
      setType(history.type);
      _items.value = jsonDecode(history.detail!);
      count();
    }
  }
}
