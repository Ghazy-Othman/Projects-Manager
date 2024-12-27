//
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/views/doctor_views/doctor_home_screen/doctor_home_screen.dart';
import 'package:projects_manager/views/doctor_views/doctor_profile_screen/doctor_profile_screen.dart';

class DoctorMainScreenController extends GetxController {
  int currentIndex = 0;

  Widget currentPage() {
    if (currentIndex == 0) {
      return  DoctorHomeScreen();
    }
    return  DoctorProfileScreen();
  }

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }
}
