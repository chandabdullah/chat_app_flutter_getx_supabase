import 'package:chat_app/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerView extends GetView {
  const PhotoViewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.fromLTRB(
              kLeftPadding(context),
              kTopPadding(context),
              kRightPadding(context),
              kBottomPadding(context),
            ),
            child: PhotoView(
              heroAttributes: PhotoViewHeroAttributes(
                tag: "photo${Get.arguments["index"]}",
              ),
              imageProvider: NetworkImage(
                Get.arguments["imageUrl"],
              ),
            ),
          ),
          Positioned(
            right: kRightPadding(context) + kSpacing,
            top: kTopPadding(context) + kSpacing,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
