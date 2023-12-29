import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/screens/home_screen.dart';
import 'package:dilrecord_money/screens/login_screen.dart';
import 'package:dilrecord_money/screens/register_screen.dart';
import 'package:dilrecord_money/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteScreen.home,
      getPages: [
        GetPage(name: RouteScreen.splash, page: () => const SplashScreen()),
        GetPage(name: RouteScreen.home, page: () => const HomeScreen()),
        GetPage(name: RouteScreen.register, page: () => const RegisterScreen()),
        GetPage(name: RouteScreen.login, page: () => const LoginScreen()),
      ],
    );
  }
}
