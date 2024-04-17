import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/app/data/local/my_shared_pref.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/app/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Get.theme.scaffoldBackgroundColor,
      // title: const Text('Profile'),
      // centerTitle: false,
      // actions: [
      //   IconButton(
      //     tooltip: "Logout",
      //     onPressed: () async {
      //       await SupabaseService.logoutSupabase();
      //       MySharedPref.removeToken();
      //       Get.offAndToNamed(Routes.LOGIN);
      //     },
      //     icon: const Icon(EvaIcons.log_out),
      //   ),
      // ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Text(
                  "Profile",
                  style: Get.textTheme.titleLarge!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kPadding,
                ),
                padding: const EdgeInsets.all(kPadding),
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Get.theme.cardColor,
                      radius: 25,
                      child: const Text("CA"),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, User",
                            style: Get.textTheme.titleLarge!.copyWith(
                              color: Get.theme.scaffoldBackgroundColor,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            "Hey there! I'm at Gym",
                            style: Get.textTheme.bodyMedium!.copyWith(
                              color: Get.theme.scaffoldBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding,
                ),
                child: Text(
                  "Account Settings",
                  style: Get.textTheme.titleLarge,
                ),
              ),
              const Gap(10),
              customListTile(
                onTap: () {},
                icon: EvaIcons.person,
                title: "Account",
                subtitle: "Privacy, security, change number",
              ),
              customListTile(
                onTap: () {},
                icon: EvaIcons.bell,
                title: "Notifications",
                subtitle: "Message, group, ringtone",
              ),
              customListTile(
                onTap: () {},
                icon: EvaIcons.pie_chart,
                title: "Data & Storage",
                subtitle: "Network usage, media download",
              ),
              customListTile(
                onTap: () {},
                icon: EvaIcons.message_square,
                title: "Chats",
                subtitle: "Theme, wallpaper",
              ),
              customListTile(
                onTap: () {},
                icon: EvaIcons.person_add,
                title: "Invite Friends",
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile customListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: kPadding),
      minVerticalPadding: 0,
      leading: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Get.theme.primaryColor.withOpacity(.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Get.theme.primaryColor,
          size: 25,
        ),
      ),
      minLeadingWidth: 0,
      title: Text(title),
      subtitle: subtitle?.isEmpty ?? true ? null : Text(subtitle ?? ""),
    );
  }
}
