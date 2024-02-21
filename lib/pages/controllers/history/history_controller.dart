// ignore_for_file: file_names, invalid_use_of_protected_member
import 'package:dilrecord_money/data/models/history.dart';
import 'package:dilrecord_money/data/sources/history_source.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  // NOTE: LOADING
  final _loading = false.obs;
  bool get loading => _loading.value;

  // NOTE: DATA HISTORY
  final _list = <History>[].obs;
  List<History> get list => _list.value;
  getList(userId) async {
    _loading.value = true;
    update();

    _list.value = await HistorySource.fetchAllHistory(userId);
    update();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        _loading.value = false;
        update();
      },
    );
  }

  getSearch(userId, date) async {
    _loading.value = true;
    update();

    _list.value = await HistorySource.historySearch(userId, date);
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
