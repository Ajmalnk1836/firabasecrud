import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  SplashscreenController cnt = Get.put(SplashscreenController());
  @override
  Widget build(BuildContext context) {
    cnt.nextscree();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Icon(Icons.currency_exchange_rounded,color: Colors.white,size: 50,)
      ),
    );
  }
}
