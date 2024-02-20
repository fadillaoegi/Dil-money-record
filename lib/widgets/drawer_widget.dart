import 'package:dilrecord_money/config/assets_localate.dart';
import 'package:dilrecord_money/config/session.dart';
import 'package:dilrecord_money/pages/controllers/home_controller.dart';
import 'package:dilrecord_money/pages/controllers/user_controller.dart';
import 'package:dilrecord_money/routes/routes.dart';
import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
import 'package:dilrecord_money/widgets/menu_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final userController = Get.put(UserController());
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RefreshIndicator(
          onRefresh: () async {
            homeController.getAnalysis(userController.data.id!);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER DRAWER
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.logo,
                      height: 40.0,
                      width: 40.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "Nabila",
                              // userController.data.name!,
                              "${userController.data.name}",
                              style: black600.copyWith(fontSize: 12.0),
                            ),
                            Text(
                              // "nabila@gmail.com",
                              // userController.data.email!,
                              "${userController.data.email}",
                              style: black600.copyWith(fontSize: 12.0),
                            ),
                          ],
                        ))
                  ],
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    SessionUser.clearUser();
                    Get.offAllNamed(RouteScreen.login);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorApps.primary),
                  child: Text(
                    "Logout",
                    style: white700.copyWith(fontSize: 14.0),
                  )),

              const SizedBox(
                height: 20.0,
              ),

              // MENU DRAWER
              Column(
                children: [
                  const Divider(),
                  MenuDrawer(
                    text: "Tambah Baru",
                    onPress: () {
                      // NOTE: PAKAI ROUTE
                      Get.toNamed(RouteScreen.add)?.then((value) {
                        homeController.getAnalysis(userController.data.id!);
                      });
                      // NOTE: TANPA ROUTE
                      // Get.to(() => AddScreen())?.then((value) {
                      //   homeController.getAnalysis(userController.data.id!);
                      // });
                    },
                    prefix: Icons.plus_one,
                  ),
                  const Divider(
                    height: 40.0,
                  ),
                  MenuDrawer(
                    text: "Pemasukan",
                    onPress: () {
                      // Get.toNamed(RouteScreen.history);
                      Get.toNamed(
                        RouteScreen.history,
                        arguments: "Pemasukan",
                      );
                    },
                    prefix: Icons.arrow_downward,
                  ),
                  const Divider(
                    height: 40.0,
                  ),
                  MenuDrawer(
                    text: "Pengeluaran",
                    onPress: () {
                      Get.toNamed(
                        RouteScreen.history,
                        arguments: "Pengeluaran",
                      );
                    },
                    prefix: Icons.arrow_upward,
                  ),
                  const Divider(
                    height: 40.0,
                  ),
                  MenuDrawer(
                    text: "Riwayat",
                    onPress: () {
                      // Get.toNamed(RouteScreen.historyUpdate);
                    },
                    prefix: Icons.history,
                  ),
                  const Divider(
                    height: 40.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
