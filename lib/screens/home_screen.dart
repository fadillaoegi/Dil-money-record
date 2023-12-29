import 'package:dilrecord_money/config/asset_localate.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/burger_button_widget.dart';
import 'package:dilrecord_money/widgets/card_pengeluaran_widget.dart';
import 'package:dilrecord_money/widgets/drawer_widget.dart';
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
      endDrawer: const DrawerWidget(),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // IMAGE
                      SizedBox(
                          height: 50.0,
                          width: 50.0,
                          // ignore: unnecessary_string_interpolations
                          child: Image.asset("${AssetLocal.logo}")),
                      const SizedBox(
                        width: 10.0,
                      ),

                      // GREETING
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi,",
                            style: black600.copyWith(fontSize: 18.0),
                          ),
                          Text(
                            "Nabila",
                            style: black600.copyWith(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // BUTTON BURGER
                  Builder(builder: (context) {
                    return BurgerButton(
                      onPress: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  })
                ],
              ),

              const SizedBox(
                height: 32.0,
              ),
              // CARD PENGELUARAN
              SectionTitle(title: "Pengeluaran Hari Ini"),
              CardPengeluaran(
                pengeluaran: "500000",
              ),

              Divider(
                color: ColorApps.primary,
                thickness: 7.0,
                endIndent: 140.0,
                indent: 140.0,
              ),
              const SizedBox(
                height: 24.0,
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
