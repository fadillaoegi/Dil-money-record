import 'package:dilrecord_money/controllers/history/inOutcome_controller.dart';
import 'package:dilrecord_money/controllers/user_controller.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryUpdateScreen extends StatelessWidget {
  const HistoryUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inOutcomeController = Get.put(InOutcomeController());
    final userController = Get.put(UserController());
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Riwayat"),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 8.0),
              height: 46.0,
              child: TextFormField(
                onTap: () async {
                  DateTime? dateSearchResult = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024, 01, 01),
                      lastDate: DateTime(DateTime.now().year + 1));
                  if (dateSearchResult != null) {
                    searchController.text =
                        DateFormat("yyyy-MM-dd").format(dateSearchResult);
                  }
                },
                decoration: InputDecoration(
                    hintText: "2024-02-14",
                    suffixIcon: InkWell(
                      onTap: () {
                        // inOutcomeController.getSearch(
                        //   userController.data.id,
                        //   type,
                        //   searchController.text,
                        // );
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
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
                controller: searchController,
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
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => const HistoryCard(),
        ),
      ),
    );
  }
}
