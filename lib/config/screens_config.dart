import 'package:dilrecord_money/pages/screens/add_history_screen.dart';
import 'package:dilrecord_money/pages/screens/detail_screen.dart';
import 'package:dilrecord_money/pages/screens/history_screen.dart';
import 'package:dilrecord_money/pages/screens/home_screen.dart';
import 'package:dilrecord_money/pages/screens/inoutcome_screen.dart';
import 'package:dilrecord_money/pages/screens/login_screen.dart';
import 'package:dilrecord_money/pages/screens/register_screen.dart';
import 'package:dilrecord_money/pages/screens/splash_screen.dart';
import 'package:dilrecord_money/pages/screens/update_history_screen.dart';
import 'package:dilrecord_money/routes/routes.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getScreens = [
  GetPage(name: RouteScreen.splash, page: () => const SplashScreen()),
  GetPage(name: RouteScreen.register, page: () => const RegisterScreen()),
  GetPage(name: RouteScreen.login, page: () => const LoginScreen()),
  GetPage(name: RouteScreen.home, page: () => const HomeScreen()),
  GetPage(name: RouteScreen.add, page: () => AddScreen()),
  GetPage(name: RouteScreen.detail, page: () => const DetailScreen()),
  GetPage(name: RouteScreen.history, page: () => const HistoryScreen()),
  GetPage(name: RouteScreen.inOutcome, page: () => const InOutcomeScreen()),
  GetPage(name: RouteScreen.historyUpdate, page: () => HistoryUpdateScreen()),
];
