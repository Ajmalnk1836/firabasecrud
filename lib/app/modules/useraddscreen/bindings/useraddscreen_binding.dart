import 'package:get/get.dart';

import '../controllers/useraddscreen_controller.dart';

class UseraddscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UseraddscreenController>(
      () => UseraddscreenController(),
    );
  }
}
