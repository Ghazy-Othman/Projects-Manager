//
//
//

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/doctor/doctor_services.dart';
import 'package:projects_manager/views/doctor_views/doctor_main_screen/doctor_main_screen.dart';

class DoctorLoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  //
  Future<void> doctorLogin() async {
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

    Map<String, dynamic> data = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "section": sectionController.text.trim()
    };
    try {
      ProgressDialogUtils.showProgressDialog();
      bool response = await DoctorServices.login(data);
      ProgressDialogUtils.hideProgressDialog();

      if (response) {
        Get.offAll(() => DoctorMainScreen());
      } else {
        Fluttertoast.showToast(msg: "Something went wrong !");
      }
    } on Exception catch (_) {
      ProgressDialogUtils.hideProgressDialog();
      Fluttertoast.showToast(msg: "Something went wrong") ;
    }
  }
}
