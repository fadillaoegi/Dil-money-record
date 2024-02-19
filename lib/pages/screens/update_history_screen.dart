// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dilrecord_money/config/app_format_config.dart';
import 'package:dilrecord_money/pages/controllers/history/add_controller.dart';
import 'package:dilrecord_money/pages/controllers/history/update_controller.dart';
import 'package:dilrecord_money/pages/controllers/user_controller.dart';
import 'package:dilrecord_money/data/sources/history_source.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/button_widget.dart';
import 'package:dilrecord_money/widgets/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryUpdateScreen extends StatelessWidget {
  HistoryUpdateScreen({super.key});
  final userController = Get.put(UserController());
  final updateController = Get.put(UpdateController());
  final TextEditingController sumberController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final argumentHistory = Get.arguments;

  update() async {
    bool success = await HistorySource.update(
        userController.data.id!,
        updateController.type,
        updateController.type,
        jsonEncode(updateController.items),
        updateController.total.toString());
    if (success) {
      //       Get.back(result: true);
      Get.snackbar("Update History", "Berhasil");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body: Container(
          margin: const EdgeInsets.all(20.0),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // NOTE: TANGGAL
                SectionTitle(
                  title: "Tanggal",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    // NOTE: TANGGAL DINAMIS
                    Obx(() => Text(
                          // "02/10/2024",
                          updateController.date,
                          style: black400.copyWith(fontSize: 20.0),
                        )),
                    // NOTE: TANGGAL STATIS
                    // Text(
                    //   "02/10/2024",
                    //   style: black400.copyWith(fontSize: 20.0),
                    // ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        iconSize: 40.0,
                        color: ColorApps.primary,
                        onPressed: () async {
                          var resultDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024, 01, 01),
                              lastDate: DateTime(DateTime.now().year + 1));
                          if (resultDate != null) {
                            updateController.setDate(
                                DateFormat("yyy-MM-dd").format(resultDate));
                          }
                        },
                        icon: const Icon(Icons.date_range)),
                  ],
                ),
                // NOTE: TYPE
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SectionTitle(
                    title: "Tipe",
                  ),
                ),
                // NOTE: TYPE DINAMIS
                Obx(() => DropdownButtonFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      items: ["Pemasukan", "Pengeluaran"].map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      value: updateController.type,
                      onChanged: (value) {
                        updateController.setType(value);
                      },
                    )),
                // NOTE: TYPE STATIS
                // DropdownButtonFormField(
                //   decoration:
                //       const InputDecoration(border: OutlineInputBorder()),
                //   items: ["Pemasukan", "Pengeluaran"].map((e) {
                //     return DropdownMenuItem(
                //       value: e,
                //       child: Text(e),
                //     );
                //   }).toList(),
                //   onChanged: (value) {},
                //   value: "Pemasukan",
                // ),
                // NOTE: SUMBER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SectionTitle(
                    title: "Sumber/Objek pengeluaran",
                  ),
                ),
                TextFormField(
                  controller: sumberController,
                  decoration: const InputDecoration(
                      hintText: "MacBook",
                      border: OutlineInputBorder(borderSide: BorderSide())),
                ),
                // NOTE: HARGA/NOMINAL
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SectionTitle(
                    title: "Harga/Nominal",
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: InputDecoration(
                      hintText: "3000000",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApps.primary))),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ButtonWidget(
                    onPress: () {
                      updateController.addItem({
                        "sumber": sumberController.text,
                        "price": priceController.text
                      });
                      sumberController.clear();
                      priceController.clear();
                    },
                    text: "Add item",
                  ),
                ),

                // NOTE: ITEMS
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SectionTitle(
                    title: "Items",
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(color: ColorApps.primary)),
                  child: GetBuilder<AddController>(
                    init: AddController(),
                    initState: (_) {},
                    builder: (_) {
                      // NOTE: ITEMS DINAMIS
                      return Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: List.generate(_.items.length, (index) {
                            return Chip(
                              padding: const EdgeInsets.only(right: 10.0),
                              label: Text(_.items[index]["sumber"]),
                              deleteIcon: const Icon(Icons.clear),
                              onDeleted: () =>
                                  updateController.deleteItem(index),
                            );
                          })
                          // NOTE: ITEMS STATIS
                          // [
                          //   Chip(
                          //     padding: const EdgeInsets.only(right: 10.0),
                          //     label: const Text("Sumber"),
                          //     deleteIcon: const Icon(Icons.clear),
                          //     onDeleted: () {},
                          //   ),
                          // ],
                          );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      SectionTitle(
                        title: "Total",
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      // NOTE: TOTAL DINAMIS
                      Obx(() => Text(
                            // AppFormat.currency("300000"),
                            AppFormat.currency(
                                updateController.total.toString()),
                            style: primary700.copyWith(fontSize: 28.0),
                          )),
                      // NOTE: TOTAL STATIS
                      // Text(
                      //   "Rp. 300.000,00",
                      //   style: primary700.copyWith(fontSize: 28.0),
                      // ),
                    ],
                  ),
                ),
                ButtonWidget(
                  // onPress: () => addHistory(),
                  onPress: () {},
                  text: "Submit",
                )
              ],
            ),
          )),
    );
  }
}
