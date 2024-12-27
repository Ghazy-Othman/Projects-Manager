//
//
//

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/doctor/doctor_services.dart';
import 'package:projects_manager/views/doctor_views/doctor_login/doctor_login_screen.dart';
import 'package:projects_manager/views/student_views/student_login/student_login_screen.dart';

class NewPasswordPageController extends GetxController {
  TextEditingController otpCodeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  String? email;
  String? role ;

  Future<void> resetPassword() async {
    if (otpCodeController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter OTP code ");
      return;
    }
    if (newPasswordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter new password");
      return;
    }
    if (confirmNewPasswordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please confirm new password");
      return;
    }
    if (newPasswordController.text.trim() !=
        confirmNewPasswordController.text.trim()) {
      Fluttertoast.showToast(msg: "Passwords are not the same");
      return;
    }

    Map<String, dynamic> data = {
      "role": role,
      "email": email,
      "otp_code": otpCodeController.text.trim(),
      "new_password": confirmNewPasswordController.text.trim()
    };

    ProgressDialogUtils.showProgressDialog() ;
    bool res = await DoctorServices.resetPassword(data);
    ProgressDialogUtils.hideProgressDialog() ;

    if (res) {
      role == "doctor" ? Get.offAll(() => DoctorLoginScreen()) :
      Get.offAll(() => StudentLoginScreen());
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong\n Please enter existing email!!");
    }
  }
}
