// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';

class AddController extends GetxController {
  // DATE
  final _date = "".obs;
  String get date => _date.value;
  setDate(n) => _date.value = n;
  // TYPE
  final _type = "Pemasukan".obs;
  String get type => _type.value;
  setType(n) => _type.value = n;
  // ITEMS
  final _items = [].obs;
  List get items => _items.value;
  addItem(n) {
    _items.value.add(n);
    update();
  }

  deleteItem(i) {
    _items.value.removeAt(i);
    update();
  }

  // TOTAL
  final _total = 0.0.obs;
  double get total => _total.value;
  setTotal(n) => _total.value = n;

  count() {
    items
        .map((e) => e["price"])
        .toList()
        .fold<double>(0.0, (previousValue, element) => previousValue + element);
  }
}
