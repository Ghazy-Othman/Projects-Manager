//
//
//

import 'package:get/get.dart';
import 'package:projects_manager/views/splash_screen/splash_screen.dart';
import 'package:projects_manager/views/splash_screen/binding/splash_screen_binding.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen";

  static List<GetPage<dynamic>> pages = [
    GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding())
  ];
}
