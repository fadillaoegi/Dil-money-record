import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionTitle extends StatelessWidget {
  SectionTitle({super.key, this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: black700.copyWith(fontSize: 18.0),
    );
  }
}
