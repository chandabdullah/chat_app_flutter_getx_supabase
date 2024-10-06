import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/app/modules/chat/views/photo_viewer_view.dart';
import 'package:chat_app/utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:voice_message_package/voice_message_package.dart';

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
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                reverse: true,
                padding: const EdgeInsets.all(kPadding),
                children: [
                  // attachment messages
                  attachmentMessage(
                    3,
                    "https://live.staticflickr.com/4604/40427749762_85b206c870_b.jpg",
                    sentByMe: true,
                    type: AttachmentType.audio,
                  ),
                  attachmentMessage(
                    2,
                    "https://live.staticflickr.com/4604/40427749762_85b206c870_b.jpg",
                    sentByMe: true,
                    type: AttachmentType.image,
                  ),
                  attachmentMessage(
                    1,
                    "https://t4.ftcdn.net/jpg/02/57/75/51/360_F_257755130_JgTlcqTFxabsIKgIYLAhOFEFYmNgwyJ6.jpg",
                    sentByMe: false,
                    type: AttachmentType.video,
                  ),

                  chatMessage("Sure 😊", sentByMe: false),
                  chatMessage("Just ping me whenever you will free!",
                      sentByMe: true),
                  chatMessage("Ooh!", sentByMe: true),
                  chatMessage(
                    """Sorry!
I'm currently in the office with lots of working stuff""",
                    sentByMe: false,
                  ),
                  chatMessage("""
Where are you now?
Let's have a quick meetup""", sentByMe: true),
                  chatMessage("I'm fine! What about you?", sentByMe: false),
                  chatMessage("How are you?", sentByMe: true),
                  chatMessage("Morning!", sentByMe: false),
                  chatMessage("Good Morning!", sentByMe: true),

                  // const Gap(10),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 0,
                  //     vertical: 3,
                  //   ),
                  //   child: Text(
                  //     formatTime(
                  //       DateTime(2024, 4, 18, 12, 24),
                  //     ),
                  //     style: Get.textTheme.bodySmall,
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   margin: const EdgeInsets.all(0),
                  //   child: PhysicalShape(
                  //     clipper: const ShapeBorderClipper(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //           topRight: Radius.circular(kBorderRadius),
                  //           topLeft: Radius.circular(kBorderRadius),
                  //           bottomRight: Radius.circular(kBorderRadius),
                  //           bottomLeft: Radius.circular(0),
                  //         ),
                  //       ),
                  //       // textDirection: TextDirection.ltr,
                  //     ),
                  //     elevation: 2,
                  //     color: Get.theme.cardColor,
                  //     shadowColor: Colors.transparent,
                  //     child: Container(
                  //       padding: EdgeInsets.all(10),
                  //       child: Text(
                  //         "Hey, good morning!",
                  //         style: Get.textTheme.bodyMedium,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   margin: const EdgeInsets.all(0),
                  //   child: PhysicalShape(
                  //     clipper: const ShapeBorderClipper(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //           topRight: Radius.circular(kBorderRadius),
                  //           topLeft: Radius.circular(kBorderRadius),
                  //           bottomRight: Radius.circular(kBorderRadius),
                  //           bottomLeft: Radius.circular(0),
                  //         ),
                  //       ),
                  //       // textDirection: TextDirection.ltr,
                  //     ),
                  //     elevation: 2,
                  //     color: Get.theme.cardColor,
                  //     shadowColor: Colors.transparent,
                  //     child: Container(
                  //       height: 170,
                  //       width: 220,
                  //       alignment: Alignment.bottomRight,
                  //       // foregroundDecoration: BoxDecoration(
                  //       //   gradient: LinearGradient(
                  //       //     colors: [
                  //       //       Colors.black,
                  //       //       Colors.transparent,
                  //       //       Colors.transparent,
                  //       //       Colors.black
                  //       //     ],
                  //       //     begin: Alignment.topCenter,
                  //       //     end: Alignment.bottomCenter,
                  //       //     stops: [0, 0.2, 0.8, 1],
                  //       //   ),
                  //       // ),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(kBorderRadius),
                  //         image: const DecorationImage(
                  //           image: NetworkImage(
                  //             "https://img.etimg.com/thumb/msid-75289441,width-640,height-480,imgsize-979296,resizemode-4/spring-clean-your-pc.jpg",
                  //           ),
                  //           fit: BoxFit.cover,
                  //           alignment: Alignment.bottomCenter,
                  //           colorFilter: ColorFilter.mode(
                  //             Colors.black26,
                  //             BlendMode.multiply,
                  //           ),
                  //         ),
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //               horizontal: kSpacing,
                  //               vertical: 3,
                  //             ),
                  //             child: Text(
                  //               formatTime(
                  //                 DateTime(2024, 4, 12, 12, 22),
                  //               ),
                  //               style: Get.textTheme.bodySmall!.copyWith(
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
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

  Widget chatMessage(
    String message, {
    bool? sentByMe,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Gap(5),
        ChatBubble(
          alignment:
              sentByMe == true ? Alignment.centerRight : Alignment.centerLeft,
          backGroundColor:
              sentByMe == true ? Get.theme.primaryColor : Get.theme.cardColor,
          clipper: ChatBubbleClipper5(
            type: sentByMe == true
                ? BubbleType.sendBubble
                : BubbleType.receiverBubble,
            secondRadius: kBorderRadius,
            radius: kBorderRadius,
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: Get.width * .75,
            ),
            child: Text(
              message,
              style: Get.textTheme.bodyMedium!.copyWith(
                color: sentByMe == true
                    ? Get.theme.cardColor
                    : Get.textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: sentByMe == true
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 3,
                ),
                child: Text(
                  formatTimeForMessage(
                    DateTime(2024, 4, 22, 12, 22),
                  ),
                  style: Get.textTheme.bodySmall,
                ),
              ),
              // if (sentByMe == true) const Gap(3),
              if (sentByMe == true)
                const Icon(
                  Icons.done_all,
                  color: Colors.blue,
                  size: 20,
                ),
            ],
          ),
        ),
        const Gap(1),
      ],
    );
  }

  Widget attachmentMessage(
    int index,
    String thumbnail, {
    required bool sentByMe,
    AttachmentType? type,
  }) {
    Widget imageOrVideAttachment() {
      return GestureDetector(
        onTap: () {
          if (type == AttachmentType.image) {
            Get.to(() => const PhotoViewerView(), arguments: {
              "imageUrl": thumbnail,
              "index": index,
            });
            return;
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(5),
            Stack(
              children: [
                Container(
                  alignment:
                      sentByMe == true ? Alignment.topRight : Alignment.topLeft,
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
                    ),
                    elevation: 2,
                    color: Get.theme.cardColor,
                    shadowColor: Colors.transparent,
                    child: Hero(
                      tag: "photo$index",
                      child: Container(
                        height: 170,
                        width: 230,
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .75,
                          maxHeight: Get.width * .55,
                          // minWidth: Get.width / 2,
                          // minHeight: Get.width / 2.5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          image: DecorationImage(
                            image: NetworkImage(
                              thumbnail,
                            ),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter,
                            colorFilter: const ColorFilter.mode(
                              Colors.black26,
                              BlendMode.multiply,
                            ),
                          ),
                        ),
                        child: type == AttachmentType.video
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Get.theme.scaffoldBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 25,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: kSpacing / 2,
                  left: sentByMe == true ? null : kSpacing / 2,
                  right: sentByMe == true ? kSpacing / 2 : null,
                  child: Row(
                    mainAxisAlignment: sentByMe == true
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 3,
                            ),
                            child: Text(
                              formatTimeForMessage(
                                DateTime(2024, 4, 12, 12, 22),
                              ),
                              style: Get.textTheme.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          if (sentByMe == true)
                            const Icon(
                              Icons.done_all,
                              color: Colors.blue,
                              size: 20,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(1),
          ],
        ),
      );
    }

    Widget audioAttachment() {
      return Column(
        children: [
          const Gap(5),
          Container(
            alignment:
                sentByMe == true ? Alignment.topRight : Alignment.topLeft,
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
              ),
              elevation: 2,
              color: Get.theme.cardColor,
              shadowColor: Colors.transparent,
              child: VoiceMessageView(
                activeSliderColor: Get.theme.primaryColor,
                circlesColor: Get.theme.primaryColor,
                controller: VoiceController(
                  audioSrc:
                      'https://samplelib.com/lib/preview/mp3/sample-3s.mp3',
                  onComplete: () {
                    print('completed');
                  },
                  onPause: () {
                    print('pause');
                  },
                  onPlaying: () {
                    print('playing');
                  },
                  onError: (err) {
                    print('err: $err');
                  },
                  maxDuration: const Duration(seconds: 10),
                  isFile: false,
                ),
                innerPadding: kSpacing,
                cornerRadius: kBorderRadius,
              ),
            ),
          ),
          const Gap(1),
        ],
      );
    }

    Widget documentAttachment() {
      return Container();
    }

    switch (type) {
      case AttachmentType.image:
        return imageOrVideAttachment();
      case AttachmentType.video:
        return imageOrVideAttachment();
      case AttachmentType.audio:
        return audioAttachment();
      case AttachmentType.document:
        return documentAttachment();
      default:
        return imageOrVideAttachment();
    }
  }
}

enum AttachmentType {
  image,
  video,
  audio,
  document,
  location,
  contact,
}
