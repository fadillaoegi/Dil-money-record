// ignore_for_file: must_be_immutable

import 'package:dilrecord_money/config/app_format_config.dart';
import 'package:dilrecord_money/module/data/models/history.dart';
import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardInOutCome extends StatelessWidget {
  CardInOutCome(
      {super.key,
      this.idUser,
      this.date,
      this.nominal,
      this.type,
      this.function,
      this.history
      // this.menu
      });
  String? idUser;
  String? date;
  String? nominal;
  String? type;
  Function? function;
  History? history;

  showOption(String value, History history) {
    if (value == "update") {
      Get.toNamed(RouteScreen.historyUpdate)?.then((value) {
        if (value ?? false) {
          function;
        }
      });
    } else if (value == "delete") {
      // Get.toNamed(RouteScreen.historyUpdate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.0,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20.0),
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
            // "29 Jun 2022",
            // date!,
            AppFormat.date(date!),
            style: primary700.copyWith(fontSize: 16.0),
          ),
          Text(
            // nominal!,
            AppFormat.currency(nominal!),
            style: primary700.copyWith(fontSize: 16.0),
          ),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.menu,
          //       size: 20.0,
          //     )),
          PopupMenuButton<String>(
            itemBuilder: (context) => [],
            onSelected: (value) => showOption(value, history!),
          )
        ],
      ),
    );
  }
}
