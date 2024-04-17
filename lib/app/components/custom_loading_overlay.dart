import 'package:flutter/material.dart';

import 'package:get/get.dart';

/// this method will show black overlay which look like dialog
/// and it will have loading animation inside of it
/// this will make sure user cant interact with ui until
/// any (async) method is executing cuz it will wait for async function
/// to end and then it will dismiss the overlay
showLoadingOverLay({
  required Future<dynamic> Function() asyncFunction,
  String? msg,
}) async {
  await Get.showOverlay(
    asyncFunction: () async {
      try {
        await asyncFunction();
      } catch (error) {
        //
      }
    },
    loadingWidget: Center(
      child: _getLoadingIndicator(msg: msg),
    ),
    opacity: 0.7,
    opacityColor: Colors.black,
  );
}

Widget _getLoadingIndicator({String? msg}) {
  // var theme = Get.theme;
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        // SpinKitChasingDots(
        //   color: theme.primaryColor,
        //   size: 25,
        // ),
        const SizedBox(height: 10),
        Text(
          msg ?? "Loading...",
          style: Get.theme.textTheme.bodyLarge,
        ),
      ],
    ),
  );
}
