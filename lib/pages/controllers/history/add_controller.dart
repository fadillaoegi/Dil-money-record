// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddController extends GetxController {
  // NOTE: GET DATA DATE 
  final _date = DateFormat("yyy-MM-dd").format(DateTime.now()).obs;
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
    // update();
  }

  deleteItem(i) {
    _items.value.removeAt(i);
    count();
  }

  // NOTE: GET DATA TOTAL
  final _total = 0.0.obs;
  double get total => _total.value;
  // setTotal(n) => _total.value = n;

  count() {
    _total.value = items.map((e) => e["price"]).toList().fold(0.0,
        (previousValue, element) {
      return double.parse(previousValue.toString()) + double.parse(element);
    });
    update();
  }
}
