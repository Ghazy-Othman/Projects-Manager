//
//
//
import 'package:admin/view/admin_profile/admin_profile_screen.dart';
import 'package:admin/view/form/form_screen.dart';
import 'package:admin/view/home/home_screen.dart';
import 'package:admin/view/upload_file/upload_file_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {

  int currentIndex = 0;

  Widget currentPage() {
    if (currentIndex == 0) {
      return HomeScreen();
    }
    if (currentIndex == 1) {
      return FormScreen();
    }
    if (currentIndex == 2) {
      return UploadFileScreen();
    }
    return AdminProfileScreen();
  }

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }

}
