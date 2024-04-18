import 'package:chat_app/app/components/custom_loading_overlay.dart';
import 'package:chat_app/app/data/local/my_shared_pref.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/app/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpVerificationController extends GetxController {
  String phoneNumber = Get.arguments?["phoneNumber"] ?? "";

  String otp = '';

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

  onVerify() async {
    if (otp.length != 6) {
      Get.rawSnackbar(
        message: "Please enter the OTP you received!",
        backgroundColor: GFColors.DANGER,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.GROUNDED,
      );
      return;
    }
    showLoadingOverLay(
      msg: "Verifying...",
      asyncFunction: () async {
        try {
          final supabase = SupabaseService.supabaseClient;

          var response = await supabase.auth.verifyOTP(
            phone: phoneNumber,
            token: otp,
            type: OtpType.sms,
          );

          Session? session = response.session;
          String? token = session?.accessToken;

          MySharedPref.setToken(token);
          Get.offAllNamed(Routes.TABS);
        } on AuthException catch (e) {
          print("error: $e");

          Get.snackbar(
            "Error",
            e.message,
            colorText: GFColors.LIGHT,
            backgroundColor: GFColors.DANGER,
            snackPosition: SnackPosition.TOP,
          );
        }
      },
    );
  }
}
