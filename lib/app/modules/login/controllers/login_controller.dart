import 'package:chat_app/app/components/custom_loading_overlay.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/app/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onNext() async {
    if (phoneNumber.isEmpty) {
      Get.rawSnackbar(
        message: "Enter phone number",
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: GFColors.DANGER,
      );
      return;
    }
    if (formKey.currentState!.validate()) {
      final supabase = SupabaseService.supabaseClient;

      showLoadingOverLay(
        asyncFunction: () async {
          try {
            await supabase.auth.signInWithOtp(
              phone: phoneNumber,
              shouldCreateUser: true,
              channel: OtpChannel.sms,
            );

            Get.toNamed(
              Routes.OTP_VERIFICATION,
              arguments: {
                "phoneNumber": phoneNumber,
              },
            );
          } catch (e) {
            print('error: $e');
          }
        },
      );
    }
  }
}
