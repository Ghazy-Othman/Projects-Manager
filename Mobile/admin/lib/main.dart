//
//
//
import 'package:admin/core/utils/dio_helper.dart';
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';


void main() {
  DioHelper dioHelper = DioHelper() ;
  WidgetsFlutterBinding.ensureInitialized();
  PrefHelper prefHelper = PrefHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}

