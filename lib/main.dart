import 'package:dilrecord_money/config/route_config.dart';
import 'package:dilrecord_money/config/session.dart';
import 'package:dilrecord_money/models/user.dart';
import 'package:dilrecord_money/screens/home_screen.dart';
import 'package:dilrecord_money/screens/login_screen.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());

  // initializeDateFormatting("id_ID", "path/to/custom/date_format_file")
  //     .then((value) {
  //   runApp(const MainApp());
  // });
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
