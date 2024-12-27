//
//
//


import 'package:admin/core/utils/progress_dialog_utils.dart';
import 'package:admin/services/admin_services.dart';
import 'package:admin/view/forget_password/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgetPasswordPageController extends GetxController {

  TextEditingController emailController = TextEditingController() ;

  Future<void> sendOTPRequest () async {

    if(emailController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please Enter your email") ;
      return ;
    }
    Map<String , dynamic> data = {
      "email" : emailController.text.trim() ,
      "role" : "admin"
    } ;

    ProgressDialogUtils.showProgressDialog() ;
    bool res = await AdminServices.forgetPassword(data) ;
    ProgressDialogUtils.hideProgressDialog() ;

    if(res) {
      Get.offAll(() => NewPasswordScreen(email: emailController.text.trim(),)) ;
    }
    else {
      Fluttertoast.showToast(msg: "Something went wrong") ;
    }


  }


}