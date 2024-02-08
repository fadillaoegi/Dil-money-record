import 'package:dilrecord_money/sources/history_source.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _todayOutCome = 0.0.obs;
  double get todayOutCome => _todayOutCome.value;
  final _todayPercent = "0".obs;
  String get todayPercent => _todayPercent.value;

  getAnalysis(String idUser) async {
    Map dataAnalysis = await HistorySource.analysis(idUser);
    _todayOutCome.value = dataAnalysis["today"].toDouble();
    double yesterday = dataAnalysis["yesterday"].toDouble();
    double different = (todayOutCome - yesterday).abs();
    bool isSame = todayOutCome.isEqual(yesterday);
    bool isPlus = todayOutCome.isGreaterThan(yesterday);
    double byYesterday = yesterday == 0 ? 1 : yesterday;
    double percent = (different / byYesterday) * 100;

    _todayPercent.value = isSame
        ? "100% sama dengan kemarin"
        : isPlus
            ? "+${percent.toStringAsFixed(1)}% dibanding kemarin"
            : "-${percent.toStringAsFixed(1)}% dibanding kemarin";
  }
}
