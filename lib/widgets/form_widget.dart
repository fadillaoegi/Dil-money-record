import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormWidget extends StatelessWidget {
  FormWidget({super.key, this.obscure = false, this.hint, this.controller});

  TextEditingController? controller;
  String? hint;
  bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      height: 56.0,
      width: double.infinity,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        obscureText: obscure!,
        decoration: InputDecoration(
          fillColor: ColorApps.primary,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorApps.secondary2, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(28.0))),
          contentPadding: const EdgeInsets.all(20.0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorApps.primary, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(28.0))),
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromARGB(186, 255, 255, 255)),
        ),
      ),
    );
  }
}
