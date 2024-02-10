import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/section_title_widget.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Baru"),
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
                    // const Icon(Icons.date_range),
                    // const SizedBox(
                    //   width: 10.0,
                    // ),
                    Text(
                      "02/10/2024",
                      style: black400.copyWith(fontSize: 20.0),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        iconSize: 40.0,
                        color: ColorApps.primary,
                        onPressed: () {},
                        icon: const Icon(Icons.date_range)),
                  ],
                ),
                // NOTE: SUMBER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SectionTitle(
                    title: "Tipe",
                  ),
                ),
                // NOTE: TANGGAL
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SectionTitle(
                    title: "Sumber/Objek pengeluaran",
                  ),
                ),
                TextFormField(
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
                  decoration: InputDecoration(
                      hintText: "3000000",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApps.primary))),
                ),

                // ITEMS
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
                  child: Wrap(
                    children: [
                      Chip(
                        padding: const EdgeInsets.only(right: 10.0),
                        label: const Text("Sumber"),
                        deleteIcon: const Icon(Icons.clear),
                        onDeleted: () {},
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SectionTitle(
                      title: "Total",
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Rp. 300.000,00",
                      style: primary700.copyWith(fontSize: 28.0),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
