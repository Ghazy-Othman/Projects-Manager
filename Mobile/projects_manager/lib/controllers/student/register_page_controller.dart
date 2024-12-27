//
//
//

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/student/student_services.dart';
import 'package:projects_manager/views/student_views/student_main_screen/student_main_screen.dart';

class RegisterPageController extends GetxController {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController midNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late int studentId;

  //
  Future<void> registerStudent() async {
    if (firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your first name");
      return;
    }

    if (midNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your mid name");
      return;
    }

    if (lastNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your last name");
      return;
    }

    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your email");
      return;
    }

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your password");
      return;
    }

    Map<String, dynamic> data = {
      "student_id": studentId,
      "first_name": firstNameController.text.trim(),
      "mid_name": midNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      'password': passwordController.text.trim()
    };

    ProgressDialogUtils.showProgressDialog();
    bool response = await StudentServices.register(data);
    ProgressDialogUtils.hideProgressDialog();

    if (response) {
      Get.offAll(() =>  StudentMainScreen()) ;
    } else {
      Fluttertoast.showToast(msg: "Something went wrong") ;
    }
  }

}
