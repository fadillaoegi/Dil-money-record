// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, avoid_print

import 'package:dilrecord_money/config/assets_localate.dart';
import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/button_widget.dart';
import 'package:dilrecord_money/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    void register() {
      try {
        final String email = emailController.text;
        final String name = nameController.text;
        final String password = passController.text;
        String warning = "Pemberitahuan";
        if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
          if (formKey.currentState!.validate()) {}
        } else if (email.isEmpty) {
          Get.snackbar("${warning}", "Tolong isi Email");
        } else if (name.isEmpty) {
          Get.snackbar("${warning}", "Tolong isi Nama");
        } else if (password.isEmpty) {
          Get.snackbar("${warning}", "Tolong isi password");
        }
      } catch (e) {
        print(e);
      }
    }

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
              Image.asset("${Assets.logo}"),
              const SizedBox(
                height: 82.0,
              ),
              FormWidget(
                hint: "Name: Alberts",
                controller: nameController,
              ),
              FormWidget(
                hint: "Email: example@gmail.com",
                controller: emailController,
              ),
              FormWidget(
                hint: "Password",
                controller: passController,
                obscure: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                text: "Register",
                onPress: () => register(),
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
                        Get.offAndToNamed(RouteScreen.login);
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
