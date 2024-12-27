//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/student.dart';
import 'package:projects_manager/views/student_views/student_group_screen/student_group_screen.dart';
import 'package:projects_manager/views/student_views/student_home_screen/student_home_screen.dart';
import 'package:projects_manager/views/student_views/student_profile_screen/student_profile_screen.dart';

class StudentMainScreenController extends GetxController {

  int currentIndex = 0;
  late Student currentStudent ;


  @override
  void onInit() {
    updateCurrentStudent() ;
    super.onInit();
  }

  //
  Widget currentPage() {
    if (currentIndex == 0) {
      return StudentHomeScreen();
    }
    if (currentIndex == 1) {
      return StudentGroupScreen();
    }
    return  StudentProfileScreen();
  }

  //
  void updateIndex(int index) {
    currentIndex = index;
    update();
  }

  // Get student info
  Future<void> updateCurrentStudent() async {
    currentStudent = await PrefHelper.getStudentInfo() ;
    update() ;
  }

}
