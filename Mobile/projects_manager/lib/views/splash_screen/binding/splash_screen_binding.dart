//
//
//


import 'package:get/get.dart';
import 'package:projects_manager/controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController()) ;
  }
}