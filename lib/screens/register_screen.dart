import 'package:dilrecord_money/helpers/asset_localate.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(28.0))),
                  hintText: "example@gmail.com",
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApps.primary),
                onPressed: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
