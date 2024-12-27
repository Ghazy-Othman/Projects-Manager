//
//
//
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/views/doctor_views/doctor_main_screen/doctor_main_screen.dart';
import 'package:projects_manager/views/onboarding_choosing_screen/onboarding_choosing_screen.dart';
import 'package:projects_manager/views/student_views/student_main_screen/student_main_screen.dart';

class SplashScreenController extends GetxController {


  @override
  void onReady() {
    goTo() ;
  }

  Future<void> goTo() async{
    await Future.delayed(const Duration(seconds: 3)) ;
    PrefHelper.getToken("doctor") != "" ? Get.off(() => DoctorMainScreen()) :
    (PrefHelper.getToken("student") != "" ? Get.off(() => StudentMainScreen()) :
    Get.off(() => const OnboardingChoosingScreen())) ;
  }
}