import 'package:dilrecord_money/helpers/asset_localate.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/widgets/button_widget.dart';
import 'package:dilrecord_money/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passController = TextEditingController(text: "");
    TextEditingController nameController = TextEditingController(text: "");
    return Scaffold(
      backgroundColor: ColorApps.primary2,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("${AssetLocal.assets}/logo.png"),
            const SizedBox(
              height: 82.0,
            ),
            FormWidget(
              hint: "Name",
              controller: nameController,
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
            )
          ],
        ),
      ),
    );
  }
}
