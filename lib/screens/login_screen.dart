import 'package:dilrecord_money/config/asset_localate.dart';
import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/button_widget.dart';
import 'package:dilrecord_money/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passController = TextEditingController(text: "");
    return Scaffold(
      backgroundColor: ColorApps.primary2,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: unnecessary_string_interpolations
              Image.asset("${Assets.logo}"),
              const SizedBox(
                height: 82.0,
              ),
              FormWidget(
                hint: "email: example@gmail.com",
                controller: emailController,
              ),
              FormWidget(
                hint: "password",
                controller: passController,
                obscure: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                text: "Register",
                onPress: () {},
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun? ",
                    style: white700.copyWith(fontSize: 18.0),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offAndToNamed(RouteScreen.register);
                      },
                      child: Text(
                        "Login",
                        style: primary700.copyWith(fontSize: 18.0),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
