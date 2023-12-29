import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BurgerButton extends StatelessWidget {
  BurgerButton({super.key, this.onPress});
  VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: ColorApps.secondary2,
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                color: ColorApps.primary,
                thickness: 2.0,
                indent: 14,
                endIndent: 14,
                height: 0,
              ),
              Divider(
                color: ColorApps.primary,
                thickness: 2.0,
                indent: 14,
                endIndent: 14,
                // height: 0,
              ),
              Divider(
                color: ColorApps.primary,
                thickness: 2.0,
                indent: 14,
                endIndent: 14,
                height: 0,
              ),
            ],
          ),
        ));
  }
}