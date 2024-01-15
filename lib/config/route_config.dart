import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/screens/detail_screen.dart';
import 'package:dilrecord_money/screens/home_screen.dart';
import 'package:dilrecord_money/screens/login_screen.dart';
import 'package:dilrecord_money/screens/register_screen.dart';
import 'package:dilrecord_money/screens/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getScreens = [
  GetPage(name: RouteScreen.splash, page: () => const SplashScreen()),
  GetPage(name: RouteScreen.register, page: () => const RegisterScreen()),
  GetPage(name: RouteScreen.login, page: () => const LoginScreen()),
  GetPage(name: RouteScreen.home, page: () => const HomeScreen()),
  GetPage(name: RouteScreen.detail, page: () => const DetailScreen()),
];
