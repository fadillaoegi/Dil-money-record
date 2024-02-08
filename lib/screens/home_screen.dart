import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:dilrecord_money/config/assets_localate.dart';
import 'package:dilrecord_money/controllers/user_controller.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/burger_button_widget.dart';
import 'package:dilrecord_money/widgets/card_pengeluaran_widget.dart';
import 'package:dilrecord_money/widgets/drawer_widget.dart';
import 'package:dilrecord_money/widgets/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    // DATA PENGELUARAN MINGGUAN
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Mon', measure: 3),
      OrdinalData(domain: 'Tue', measure: 5),
      OrdinalData(domain: 'Wed', measure: 9),
      OrdinalData(domain: 'Thu', measure: 6.5),
      OrdinalData(domain: 'Fri', measure: 6.5),
      OrdinalData(domain: 'Satur', measure: 6.5),
      OrdinalData(domain: 'Sun', measure: 6.5),
    ];

    final ordinalGroup = [
      OrdinalGroup(id: '1', data: ordinalList, color: Colors.amber),
    ];

    // DATAPENGELUARAN BULANAN
    List<OrdinalData> ordinalDataListDounat = [
      OrdinalData(domain: 'Mon', measure: 3, color: Colors.blue[300]),
      OrdinalData(domain: 'Tue', measure: 5, color: Colors.amber[300]),
      OrdinalData(domain: 'Wed', measure: 9, color: Colors.purple[300]),
      OrdinalData(domain: 'Thu', measure: 6.5, color: Colors.pink[300]),
    ];
    return Scaffold(
      endDrawer: const DrawerWidget(),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
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
                          child: Image.asset("${Assets.logo}")),
                      const SizedBox(
                        width: 10.0,
                      ),

                      // GREETING DINAMIS
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi,",
                            style: black600.copyWith(fontSize: 18.0),
                          ),
                          Obx(() {
                            return Text(
                              // "Nabila",
                              userController.data.name ?? "Belum ada user",
                              style: black600.copyWith(fontSize: 18.0),
                            );
                          }),
                        ],
                      ),

                      // GREETING STATIS
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "Hi,",
                      //       style: black600.copyWith(fontSize: 18.0),
                      //     ),
                      //     Text(
                      //       "Nabila",
                      //       style: black600.copyWith(fontSize: 18.0),
                      //     ),
                      //   ],
                      // ),
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
                height: 30.0,
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
                height: 20.0,
              ),

              // GRAFIK CANDLE
              SectionTitle(title: "Pengeluaran Minggu Ini"),

              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
              // DChartBar(barColor: barColor, data: data),
              const SizedBox(
                height: 20.0,
              ),
              // GRAFIK LINGKARAN
              SectionTitle(title: "Perbandingan Bulan Ini"),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPieO(
                  data: ordinalDataListDounat,
                  configRenderPie: const ConfigRenderPie(
                    arcWidth: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
