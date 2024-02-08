import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CardPengeluaran extends StatelessWidget {
  CardPengeluaran({super.key, this.pengeluaran, this.differentOutCome});

  String? pengeluaran;
  String? differentOutCome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167.0,
      width: double.infinity,
      margin: const EdgeInsets.only(
          top: 12.0, bottom: 20.0, right: 12.0, left: 12.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
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
                  "$pengeluaran",
                  style: secondary2700.copyWith(fontSize: 30.0),
                ),
                Text(
                  // "+20% dibanding kemarin",
                  "$differentOutCome",
                  style: secondary2400.copyWith(fontSize: 14.0),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RouteScreen.detail);
              },
              child: Container(
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
