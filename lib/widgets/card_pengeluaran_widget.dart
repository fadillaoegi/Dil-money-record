import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardPengeluaran extends StatelessWidget {
  CardPengeluaran({super.key, this.pengeluaran});

  String? pengeluaran;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167.0,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12.0, bottom: 32.0),
      decoration: BoxDecoration(
          color: ColorApps.primary,
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 22.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp.$pengeluaran,00",
                  style: secondary2700.copyWith(fontSize: 30.0),
                ),
                Text(
                  "+20% dibanding kemarin",
                  style: secondary2400.copyWith(fontSize: 14.0),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                alignment: Alignment.centerLeft,
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "See Detail",
                      style: primary700,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20.0,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
