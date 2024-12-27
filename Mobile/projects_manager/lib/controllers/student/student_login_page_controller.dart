//
//
//
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/student/student_services.dart';
import 'package:projects_manager/views/student_views/student_main_screen/student_main_screen.dart';

class StudentLoginPageController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController yearController = TextEditingController();


  //
  Future<void> studentLogin() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your email !!");
      return;
    }

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your email !!");
      return;
    }

    if (sectionController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your section !! \n"
              "Software or Network");
      return;
    }

    if (yearController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your year of study !! \n"
              "4 or 5");
      return;
    }
    Map<String , dynamic> data = {
      "email" : emailController.text.trim() ,
      'password' : passwordController.text.trim() ,
      'section' : sectionController.text.trim() ,
      'year_of_study' : yearController.text.trim()
    } ;

    try {
      ProgressDialogUtils.showProgressDialog() ;
      bool response = await StudentServices.login(data) ;
      ProgressDialogUtils.hideProgressDialog();
      if(response) {
        Get.offAll(() => StudentMainScreen()) ;
      }
      else {
      }
    } on Exception catch (_) {
      ProgressDialogUtils.hideProgressDialog();
      Fluttertoast.showToast(msg: "Something went wrong ");
    }
  }


}