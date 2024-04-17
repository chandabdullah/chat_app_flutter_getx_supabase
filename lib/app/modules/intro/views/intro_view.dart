import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/app/constants/images_path.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  EvaIcons.message_square,
                  size: 25,
                  color: Get.theme.primaryColor,
                ),
                Gap(5),
                Text(
                  appName,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge,
                  // style: ,
                ),
              ],
            ),
            const Gap(20),
            Expanded(
              child: Image.asset(
                ImagesPath.CHAT,
              ),
            ),
            const Gap(20),
            Text(
              "Let's start the chat!",
              textAlign: TextAlign.center,
              style: Get.textTheme.titleLarge,
            ),
            const Gap(15),
            Text(
              "Connect with friends and family securely and private. Enjoy!",
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium,
            ),
            const Gap(20),
            CustomButton(
              text: "Get Started",
              onPress: () {
                Get.toNamed(Routes.LOGIN);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
