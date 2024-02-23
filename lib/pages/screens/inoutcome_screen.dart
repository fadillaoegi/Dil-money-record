import 'package:dilrecord_money/config/app_format_config.dart';
import 'package:dilrecord_money/data/models/history.dart';
import 'package:dilrecord_money/pages/controllers/history/inOutcome_controller.dart';
import 'package:dilrecord_money/pages/controllers/user_controller.dart';
import 'package:dilrecord_money/pages/screens/update_history_screen.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InOutcomeScreen extends StatefulWidget {
  const InOutcomeScreen({super.key});

  @override
  State<InOutcomeScreen> createState() => _InOutcomeScreenState();
}

class _InOutcomeScreenState extends State<InOutcomeScreen> {
  final inOutcomeController = Get.put(InOutcomeController());
  final userController = Get.put(UserController());
  final searchController = TextEditingController();
  final type = Get.arguments;

  refresh() async {
    inOutcomeController.getList(userController.data.id, type);
  }

  showOption(String value, History history) {
    if (value == "update") {
      // NOTE: WITH PARAMETER
      Get.to(HistoryUpdateScreen(
        date: history.date!,
        historyId: history.id!,
      ))?.then((value) {
        if (value ?? false) {
          refresh();
        }
      });

      // NOTE: WITH ARGUMENTS (ERROR)
      // Get.toNamed(RouteScreen.historyUpdate, arguments: {
      //   "date": history.date,
      //   "historyid": history.id,
      // })?.then((value) {
      //   if (value ?? false) {
      //     refresh();
      //   }
      // });
    } else if (value == "delete") {
      // Get.toNamed(RouteScreen.historyUpdate);
    }
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        inOutcomeController.getSearch(
                          userController.data.id,
                          type,
                          searchController.text,
                        );
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
        margin: const EdgeInsets.all(20.0),
        child: GetBuilder<InOutcomeController>(
          init: InOutcomeController(),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // "29 Jun 2022",
                          // date!,
                          AppFormat.date("${history.date}"),
                          style: primary700.copyWith(fontSize: 16.0),
                        ),
                        Text(
                          // nominal!,
                          AppFormat.currency("${history.total}"),
                          style: primary700.copyWith(fontSize: 16.0),
                        ),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(
                        //       Icons.menu,
                        //       size: 20.0,
                        //     )),
                        PopupMenuButton<String>(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: "update",
                              child: Text("update"),
                            ),
                            const PopupMenuItem(
                              value: "delete",
                              child: Text("delete"),
                            ),
                          ],
                          onSelected: (value) => showOption(value, history),
                        )
                      ],
                    ),
                  );

                  // CardInOutCome(
                  //   idUser: userController.data.id,
                  //   type: type,
                  //   date: history.date,
                  //   nominal: history.total,
                  //   function: refresh(),
                  //   history: history,
                  // );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
