import 'package:get/get.dart';

import 'package:firebasecrud/app/modules/home/bindings/home_binding.dart';
import 'package:firebasecrud/app/modules/home/views/home_view.dart';
import 'package:firebasecrud/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:firebasecrud/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:firebasecrud/app/modules/useraddscreen/bindings/useraddscreen_binding.dart';
import 'package:firebasecrud/app/modules/useraddscreen/views/useraddscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.USERADDSCREEN,
      page: () => UseraddscreenView(),
      binding: UseraddscreenBinding(),
    ),
   
  ];
}
