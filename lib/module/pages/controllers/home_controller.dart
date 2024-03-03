import 'package:dilrecord_money/module/data/sources/history_source.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // NOTE: TODAY
  final _todayOutCome = 0.0.obs;
  double get todayOutCome => _todayOutCome.value;
  final _todayPercent = "".obs;
  String get todayPercent => _todayPercent.value;

  // NOTE: WEEKS
  final _weeks = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0].obs;
  // ignore: invalid_use_of_protected_member
  List<double> get week => _weeks.value;
  List<String> get days =>
      ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"].obs;
  List<String> weekText() {
    DateTime today = DateTime.now();
    return [
      days[today.subtract(const Duration(days: 6)).weekday - 1],
      days[today.subtract(const Duration(days: 5)).weekday - 1],
      days[today.subtract(const Duration(days: 4)).weekday - 1],
      days[today.subtract(const Duration(days: 3)).weekday - 1],
      days[today.subtract(const Duration(days: 2)).weekday - 1],
      days[today.subtract(const Duration(days: 1)).weekday - 1],
      days[today.weekday - 1],
    ];
  }

  // NOTE: MONTH
  // final _month = "".obs;

  getAnalysis(String idUser) async {
    Map dataAnalysis = await HistorySource.analysis(idUser);

    // OutCome Today
    _todayOutCome.value = dataAnalysis["today"].toDouble();
    double yesterday = dataAnalysis["yesterday"].toDouble();
    double different = (todayOutCome - yesterday).abs();
    bool isSame = todayOutCome.isEqual(yesterday);
    bool isPlus = todayOutCome.isGreaterThan(yesterday);
    double byYesterday =
        (todayOutCome + yesterday) == 0 ? 1 : (todayOutCome + yesterday);
    // double byYesterday = yesterday == 0 ? 1 : yesterday;
    double percent = (different / byYesterday) * 100;

    _todayPercent.value = isSame
        ? "100% sama dengan kemarin"
        : isPlus
            ? "+${percent.toStringAsFixed(1)}% dibanding kemarin"
            : "-${percent.toStringAsFixed(1)}% dibanding kemarin";

    _weeks.value =
        List.castFrom(dataAnalysis['week'].map((e) => e.toDouble()).toList());
  }
}
