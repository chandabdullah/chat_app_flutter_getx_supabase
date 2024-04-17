import 'package:chat_app/app/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  User? user;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await .1.delay();
    user = SupabaseService.to.getSupabaseUser;
    print(user?.phone);
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
