//
//
//

import 'package:admin/view/home/home_screen.dart';
import 'package:admin/view/login/login_screen.dart';
import 'package:admin/view/onboarding/upload_file/onboarding_upload_file_screen.dart';
import 'package:admin/view/register/register_screen.dart';
import 'package:admin/view/splash_screen/binding/splash_screen_binding.dart';
import 'package:admin/view/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {


  static const String splashScreen = "/splash_screen" ;

  static const String registerScreen = "/register_screen" ;

  static const String loginScreen = "/login_screen" ;

  static const String onboardingUploadFileScreen = "/onboarding_upload_file_screen" ;

  static const String editFormScreen = "/edit_form_screen" ;

  static const String homeScreen = "/home_screen" ;




  static List<GetPage<dynamic>> pages = [

    GetPage(name: splashScreen, page: () => const SplashScreen() , binding: SplashScreenBinding())  ,

    GetPage(name: loginScreen, page: () => const LoginScreen() ) ,

    GetPage(name: registerScreen, page: () => const RegisterScreen() ) ,

    GetPage(name: homeScreen, page: () =>  HomeScreen() ),

    GetPage(name: onboardingUploadFileScreen, page: () =>  OnBoardingUploadFileScreen())

  ];

}