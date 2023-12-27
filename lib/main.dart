import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: RouteScreen.home,
          page: () => const HomeScreen(),
        )
      ],
    );
  }
}
