import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/card_income_outcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String type = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(type),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 8.0),
              height: 46.0,
              child: TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                    hintText: "2024-02-14",
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: ColorApps.secondary2,
                        )),
                    fillColor: ColorApps.primary2,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorApps.secondary2),
                        borderRadius: BorderRadius.circular(20.0))),
                controller: TextEditingController(),
                textAlignVertical: TextAlignVertical.center,
                style: white500.copyWith(fontSize: 12.0),
              ),
            ))
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const CardInOutCome(),
        ),
      ),
    );
  }  
}
