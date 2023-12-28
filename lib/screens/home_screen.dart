import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/section_title_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IMAGE
                  Material(child: Image.asset("")),

                  // GREETING
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Hi,\t Nabila")],
                  ),

                  // BUTTON BURGER
                ],
              ),
              // CARD PENGELUARAN
              SectionTitle(title: "Pengeluaran Hari Ini"),
              Container(
                height: 167.0,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12.0, bottom: 32.0),
                decoration: BoxDecoration(color: ColorApps.primary),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rp 500.000,00",
                        style: secondary2700.copyWith(fontSize: 30.0),
                      ),
                      Text(
                        "+20% dibanding kemarin",
                        style: secondary2400.copyWith(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
              // GRAFIK CANDLE
              SectionTitle(title: "Pengeluaran Minggu Ini"),
              // GRAFIK LINGKARAN
              SectionTitle(title: "Perbandingan Bulan Ini"),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

