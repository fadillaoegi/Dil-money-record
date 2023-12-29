import 'package:dilrecord_money/config/asset_localate.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/menu_drawer_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // HEADER DRAWER
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetLocal.logo,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nabila",
                      style: black600.copyWith(fontSize: 12.0),
                    ),
                    Text(
                      "nabila@gmail.com",
                      style: black600.copyWith(fontSize: 12.0),
                    ),
                  ],
                )
              ],
            ),
          ),

          // MENU DRAWER
          Column(
            children: [
              const Divider(),
              MenuDrawer(
                text: "Tambah Baru",
                onPress: () {},
                prefix: Icons.plus_one,
              ),
              const Divider(
                height: 40.0,
              ),
              MenuDrawer(
                text: "Pemasukan",
                onPress: () {},
                prefix: Icons.arrow_downward,
              ),
              const Divider(
                height: 40.0,
              ),
              MenuDrawer(
                text: "Pengeluaran",
                onPress: () {},
                prefix: Icons.arrow_upward,
              ),
              const Divider(
                height: 40.0,
              ),
              MenuDrawer(
                text: "Riwayat",
                onPress: () {},
                prefix: Icons.history,
              ),
              const Divider(
                height: 40.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
