//
//
//
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/view/login/login_screen.dart';
import 'package:admin/view/main_screen/main_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {


  @override
  void onReady() {
    goTo() ;
  }

  Future<void> goTo() async{
    await Future.delayed(const Duration(seconds: 3)) ;
    PrefHelper.getToken() == "" ? Get.off(() => const LoginScreen()) :
    Get.off(() => MainScreen())  ;
  }
}