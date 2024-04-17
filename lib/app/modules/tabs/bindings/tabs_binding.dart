import '/app/modules/profile/controllers/profile_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.put(HomeController());
    Get.put(ProfileController());
  }
}
