import 'package:chat_app/app/constants/constants.dart';
import 'package:chat_app/app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    EvaIcons.message_square,
                    color: Get.theme.primaryColor,
                    size: 25,
                  ),
                  const Gap(5),
                  Text(
                    appName,
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              const Gap(30),
              Text(
                "Hi, welcome to $appName",
                style: Get.textTheme.bodyLarge,
              ),
              const Gap(10),
              Text(
                "Create your account",
                style: Get.textTheme.bodySmall,
              ),
              const Gap(30),
              IntlPhoneField(
                controller: controller.phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  counterText: "",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'PK',
                onChanged: (phone) {
                  controller.phoneNumber = phone.completeNumber;
                },
                showCountryFlag: false,
                dropdownIconPosition: IconPosition.trailing,
                validator: (value) async {
                  if (value?.completeNumber.isEmpty ?? false) {
                    return 'Phone number is required';
                  }
                  return null;
                },
              ),
              const Gap(5),
              Text(
                "Securing your personal information is our priority",
                style: Get.textTheme.bodySmall,
              ),
              const Spacer(),
              CustomButton(
                text: "Next",
                onPress: controller.onNext,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
