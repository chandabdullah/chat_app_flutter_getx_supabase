import 'package:chat_app/app/modules/home/views/home_view.dart';
import 'package:chat_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(builder: (_) {
      Widget body() {
        switch (controller.currentIndex) {
          case 0:
            return const HomeView();
          case 1:
            return const ProfileView();
          default:
            return const HomeView();
        }
      }

      return Scaffold(
        body: body(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.theme.cardColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          selectedItemColor: Get.theme.primaryColor,
          unselectedItemColor: Get.theme.primaryColor.withOpacity(.5),
          unselectedLabelStyle: TextStyle(
            color: Get.theme.primaryColor.withOpacity(.5),
          ),
          iconSize: 40,
          onTap: (value) {
            controller.currentIndex = value;
            controller.update();
          },
          elevation: 5,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.message_square_outline),
              activeIcon: Icon(EvaIcons.message_square),
              label: "Conversations",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.person_outline),
              activeIcon: Icon(EvaIcons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
