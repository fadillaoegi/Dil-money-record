import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';

class CardInOutCome extends StatelessWidget {
  const CardInOutCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "29 Jun 2022",
            style: primary700.copyWith(fontSize: 16.0),
          ),
          Text("Rp 200.000,00", style: primary700.copyWith(fontSize: 16.0)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 20.0,
              ))
        ],
      ),
    );
  }
}
