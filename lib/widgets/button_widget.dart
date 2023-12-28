import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, this.text, this.onPress});
  String? text;
  VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: ColorApps.primary),
          onPressed: onPress,
          child: Text(
            // "Submit",
            text!,
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
