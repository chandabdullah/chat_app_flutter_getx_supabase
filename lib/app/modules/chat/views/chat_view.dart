import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Get.theme.primaryColor,
        ),
        actionsIconTheme: IconThemeData(
          color: Get.theme.primaryColor,
        ),
        backgroundColor: Get.theme.primaryColor.withOpacity(.2),
        leadingWidth: 30,
        title: Row(
          children: [
            GFAvatar(
              radius: 20,
              backgroundColor: Get.theme.primaryColor.withOpacity(.2),
              child: Text(
                "A",
                style: Get.textTheme.bodyLarge,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abdullah',
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(3),
                  Text(
                    'Online',
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.phone_call,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.video,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.more_vertical,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.focusScope?.unfocus();
              },
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.all(kPadding),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 3,
                      ),
                      child: Text(
                        formatTime(
                          DateTime(2024, 4, 18, 12, 24),
                        ),
                        style: Get.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  ChatBubble(
                    alignment: Alignment.centerRight,
                    backGroundColor: Get.theme.primaryColor,
                    clipper: ChatBubbleClipper5(
                      type: BubbleType.sendBubble,
                    ),
                    child: Text(
                      "Morning!",
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: Get.theme.cardColor,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.done_all,
                        color: Colors.blue,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        child: Text(
                          formatTime(
                            DateTime(2024, 4, 18, 12, 22),
                          ),
                          style: Get.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(0),
                    child: PhysicalShape(
                      clipper: const ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(kBorderRadius),
                            topLeft: Radius.circular(kBorderRadius),
                            bottomRight: Radius.circular(kBorderRadius),
                            bottomLeft: Radius.circular(0),
                          ),
                        ),
                        // textDirection: TextDirection.ltr,
                      ),
                      elevation: 2,
                      color: Get.theme.cardColor,
                      shadowColor: Colors.transparent,
                      child: Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(kBorderRadius),
                        //   image: DecorationImage(
                        //     image: NetworkImage(
                        //       "https://img.etimg.com/thumb/msid-75289441,width-640,height-480,imgsize-979296,resizemode-4/spring-clean-your-pc.jpg",
                        //     ),
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Hey, good morning!",
                          style: Get.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   color: Get.theme.cardColor,
                  //   margin: EdgeInsets.all(0),
                  //   // clipper: ChatBubbleClipper9(
                  //   //   type: BubbleType.receiverBubble,
                  //   // ),
                  //   child: PhysicalShape(
                  //     clipper: ShapeBorderClipper(
                  //       shape: Border.all(),
                  //     ),
                  //     elevation: 2,
                  //     shadowColor: Colors.grey.shade200,
                  //     color: Get.theme.cardColor,
                  //     child: Text(
                  //       "Hey, good morning!",
                  //       style: Get.textTheme.bodyMedium,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kSpacing),
            color: Get.theme.splashColor.withOpacity(.2),
            child: Row(
              children: [
                Expanded(
                  child: GFTextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(kSpacing),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Get.theme.cardColor,
                      hintText: "Message...",
                      hintStyle: Get.textTheme.bodySmall,
                      isDense: true,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: IconButton(
                              splashRadius: 20,
                              color: GFColors.TRANSPARENT,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(
                                EvaIcons.attach_2,
                                color: Get.theme.hintColor,
                                size: 20,
                              ),
                            ),
                          ),
                          const Gap(10),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: IconButton(
                              splashRadius: 20,
                              padding: const EdgeInsets.all(0),
                              color: GFColors.TRANSPARENT,
                              onPressed: () {},
                              icon: Icon(
                                Icons.emoji_emotions,
                                color: Get.theme.hintColor,
                                size: 20,
                              ),
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                GFIconButton(
                  icon: const Icon(Icons.send),
                  size: GFSize.SMALL,
                  color: Get.theme.primaryColor,
                  borderShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
