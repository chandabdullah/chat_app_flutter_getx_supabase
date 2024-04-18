import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  children: [
                    GFTextField(
                      readOnly: true,
                      onTap: () {},
                      decoration: InputDecoration(
                        hintText: "Search Message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        prefixIcon: Icon(
                          EvaIcons.search,
                          color: Get.theme.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.conversations.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(1);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Conversation conversation = controller.conversations[index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(
                          Routes.CHAT,
                        );
                      },
                      leading: GFAvatar(
                        backgroundColor: Get.theme.primaryColor.withOpacity(.2),
                        child: Text(
                          "${conversation.name.characters.first.capitalize}",
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ),
                      title: Text(
                        conversation.name,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (conversation.messageType == MessageType.photo)
                            Icon(
                              Icons.camera_alt,
                              size: 15,
                              color: Get.theme.hintColor,
                            ),
                          if (conversation.messageType == MessageType.photo)
                            const Gap(3),
                          Expanded(
                            child: Text(
                              (conversation.messageType == MessageType.photo)
                                  ? "Photo"
                                  : (conversation.lastMessage ?? ""),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.bodySmall!.copyWith(),
                            ),
                          )
                        ],
                      ),
                      trailing: Text(
                        formatTime(
                          conversation.lastMessageAt,
                        ),
                        style: Get.textTheme.bodySmall,
                        maxLines: 1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
