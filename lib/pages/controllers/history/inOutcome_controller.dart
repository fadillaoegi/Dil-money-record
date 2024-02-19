// ignore_for_file: file_names, invalid_use_of_protected_member
import 'package:dilrecord_money/data/models/history.dart';
import 'package:dilrecord_money/data/sources/history_source.dart';
import 'package:get/get.dart';

class InOutcomeController extends GetxController {
  // NOTE: LOADING
  final _loading = false.obs;
  bool get loading => _loading.value;

  // NOTE: DATA HISTORY
  final _list = <History>[].obs;
  List<History> get list => _list.value;
  getList(userId, type) async {
    _loading.value = true;
    update();

    _list.value = await HistorySource.inOutcome(userId, type);
    update();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        _loading.value = false;
        update();
      },
    );
  }

  getSearch(userId, type, date) async {
    _loading.value = true;
    update();

    _list.value = await HistorySource.inOutcomeSearch(userId, type, date);
    update();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        _loading.value = false;
        update();
      },
    );
  }
}
