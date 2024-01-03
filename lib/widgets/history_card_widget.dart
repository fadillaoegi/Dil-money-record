import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.0,
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_upward,
            color: ColorApps.green,
          ),
          Text(
            "29 Jun 2022",
            style: primary700.copyWith(fontSize: 16.0),
          ),
          Text(
            "Rp 200.000,00",
            style: primary700.copyWith(fontSize: 16.0),
          ),
          Icon(
            Icons.delete_forever_outlined,
            color: ColorApps.error,
          ),
        ],
      ),
    );
  }
}