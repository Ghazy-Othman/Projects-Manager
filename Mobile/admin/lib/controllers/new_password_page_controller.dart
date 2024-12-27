//
//
//

import 'package:admin/core/utils/progress_dialog_utils.dart';
import 'package:admin/services/admin_services.dart';
import 'package:admin/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NewPasswordPageController extends GetxController {
  TextEditingController otpCodeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  String? email;

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
      "role": "admin",
      "email": email,
      "otp_code": otpCodeController.text.trim(),
      "new_password": confirmNewPasswordController.text.trim()
    };

    ProgressDialogUtils.showProgressDialog() ;
    bool res = await AdminServices.resetPassword(data);
    ProgressDialogUtils.hideProgressDialog() ;

    if (res) {
      Get.offAll(() => const LoginScreen());
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong\n Please enter existing email!!");
    }
  }
}
