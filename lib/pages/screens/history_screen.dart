// ignore_for_file: avoid_print

import 'package:dilrecord_money/pages/controllers/history/history_controller.dart';
import 'package:dilrecord_money/pages/controllers/user_controller.dart';
import 'package:dilrecord_money/data/models/history.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/card_income_outcome_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final historyController = Get.put(HistoryController());
  final userController = Get.put(UserController());
  final searchController = TextEditingController();

  refresh() {
    // historyController.getList(userController.data.id, type);
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userController.data.id);
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
                      onTap: () {},
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
        margin: const EdgeInsets.all(20.0),
        child: GetBuilder<HistoryController>(
          init: HistoryController(),
          initState: (_) {},
          builder: (_) {
            if (_.loading) {
              return CupertinoActivityIndicator(
                radius: 26.0,
                color: ColorApps.primary,
              );
            }
            if (_.list.isEmpty) {
              return const Text("Tidak ada history in or out");
            }
            return RefreshIndicator(
              onRefresh: () async => refresh(),
              child: ListView.builder(
                itemCount: _.list.length,
                itemBuilder: (context, index) {
                  History history = _.list[index];
                  return CardInOutCome(
                    date: history.date,
                    nominal: history.total,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
