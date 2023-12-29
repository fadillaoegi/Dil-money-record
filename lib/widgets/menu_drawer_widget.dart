import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuDrawer extends StatelessWidget {
  MenuDrawer({super.key, this.onPress, this.prefix, this.text = ""});

  VoidCallback? onPress;
  IconData? prefix;
  String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(prefix),
                Text(
                  text!,
                  style: black600.copyWith(fontSize: 14.0),
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
