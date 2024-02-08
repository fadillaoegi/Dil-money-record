// ignore_for_file: avoid_print, use_build_context_synchronously, unnecessary_string_interpolations

import 'package:d_info/d_info.dart';
import 'package:dilrecord_money/config/assets_localate.dart';
import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/sources/user_source.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/button_widget.dart';
import 'package:dilrecord_money/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String warning = "Pemberitahuan";

    void login() async {
      try {
        final String email = emailController.text;
        final String password = passController.text;
        if (email.isNotEmpty && password.isNotEmpty) {
          // Belum ada eksekusi
          if (formKey.currentState!.validate()) {
            bool success = await UserSource.login(
              email,
              password,
            );
            if (success) {
              DInfo.dialogSuccess(context, "Login Berhasil");
              DInfo.closeDialog(context);
              Get.snackbar("Login", "Berhasil");
              Get.offAllNamed(RouteScreen.home);
            } else {
              Get.snackbar("Login", "Gagal");
            }
          }
        } else if (email.isEmpty) {
          Get.snackbar("$warning", "Email tidak boleh ksosong");
        } else if (password.isEmpty) {
          Get.snackbar("$warning", "passowrd tidak boleh ksosong");
        }
      } catch (e) {
        print("catch from login screen $e");
      }
    }

    return Scaffold(
      backgroundColor: ColorApps.primary2,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  text: "Login",
                  // onPress: () => login(),
                  onPress: () {
                    Get.offAllNamed(RouteScreen.home);
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun? ",
                      style: white700.copyWith(fontSize: 18.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offAndToNamed(RouteScreen.register);
                        },
                        child: Text(
                          "Register",
                          style: primary700.copyWith(fontSize: 18.0),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
