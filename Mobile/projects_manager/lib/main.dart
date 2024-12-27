//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/dio_helper.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/routes/app_routes.dart';

void main() {
  DioHelper dioHelper = DioHelper();
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
