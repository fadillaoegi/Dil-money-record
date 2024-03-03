// ignore_for_file: avoid_print
import 'package:dilrecord_money/config/screens_config.dart';
import 'package:dilrecord_money/config/session.dart';
import 'package:dilrecord_money/module/data/models/user.dart';
import 'package:dilrecord_money/module/pages/screens/home_screen.dart';
import 'package:dilrecord_money/module/pages/screens/login_screen.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("id_ID").then((value) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: ColorApps.primary,
        colorScheme: const ColorScheme.light().copyWith(
            primary: ColorApps.primary, secondary: ColorApps.primary2),
        appBarTheme: AppBarTheme(
            backgroundColor: ColorApps.primary, foregroundColor: Colors.white),
      ),
      home: FutureBuilder(
        future: SessionUser.getUser(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.data != null && snapshot.data!.id != null) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      getPages: getScreens,
    );
  }
}
