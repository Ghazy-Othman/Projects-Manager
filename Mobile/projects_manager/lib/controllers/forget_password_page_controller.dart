//
//
//

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/doctor/doctor_services.dart';
import 'package:projects_manager/views/forget_password/new_password_screen.dart';

class ForgetPasswordPageController extends GetxController {

  TextEditingController emailController = TextEditingController() ;
  late String role ;


  Future<void> sendOTPRequest () async {

    if(emailController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please Enter your email") ;
      return ;
    }
    Map<String , dynamic> data = {
      "email" : emailController.text.trim() ,
      "role" : role
    } ;

    ProgressDialogUtils.showProgressDialog() ;
    bool res = await DoctorServices.forgetPassword(data) ;
    ProgressDialogUtils.hideProgressDialog() ;

    if(res) {
      Get.offAll(() => NewPasswordScreen(email: emailController.text.trim(),role: role,)) ;
    }
    else {
      Fluttertoast.showToast(msg: "Something went wrong") ;
    }


  }


}