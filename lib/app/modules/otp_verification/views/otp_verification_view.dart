import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: GFColors.DARK,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verify Phone",
                textAlign: TextAlign.center,
                style: Get.textTheme.titleLarge,
              ),
              const Gap(10),
              Text(
                "Code has been sent to ${controller.phoneNumber}",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall,
              ),
              const Gap(20),
              Pinput(
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                length: 6,
                onCompleted: (pin) {
                  print(pin);
                  controller.otp = pin;
                },
              ),
              const Gap(20),
              Text(
                "Don't get OTP code?",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyMedium,
              ),
              CustomButton(
                text: "Resend Code",
                fullWidthButton: false,
                color: Get.theme.scaffoldBackgroundColor,
                onPress: () {},
                textColor: Get.theme.primaryColor,
              ),
              const Spacer(),
              CustomButton(
                onPress: controller.onVerify,
                text: "Verify",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
