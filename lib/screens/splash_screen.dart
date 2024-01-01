import 'package:dilrecord_money/config/asset_localate.dart';
import 'package:dilrecord_money/screens/register_screen.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan GetX untuk melakukan navigasi setelah beberapa detik
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(const RegisterScreen());
      },
    );
    return Scaffold(
      backgroundColor: ColorApps.primary,
      body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: unnecessary_string_interpolations
              Image.asset("${Assets.logo}"),
              Text(
                "Dil-Record Money",
                style: secondary2700.copyWith(fontSize: 20.0),
              ),
            ],
          )),
    );
  }
}
