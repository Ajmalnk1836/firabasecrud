import 'dart:async';

import 'package:firebasecrud/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 2), () => Get.off(HomeView()));
  }

  void nextscree() {
    Future.delayed(Duration(seconds: 3)).then((value) => Get.off(HomeView()));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
