//
//
//
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/student/student_services.dart';
import 'package:projects_manager/views/student_views/student_register/student_register_screen/student_register_screen.dart';

class VerificationPageController extends GetxController {
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController universityIdController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  // Verify student
  Future<void> verifyStudent() async {
    if (nationalIdController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your national id");
      return;
    }

    if (universityIdController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your university id");
      return;
    }

    if (sectionController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your section \n"
              "Software of Network");
      return;
    }

    if (yearController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your year of study \n"
              "4 or 5 ");
      return;
    }

    Map<String, dynamic> data = {
      'ssn': nationalIdController.text.trim(),
      'university_id': universityIdController.text.trim(),
      'section': sectionController.text.trim(),
      'year_of_study': yearController.text.trim()
    };

    ProgressDialogUtils.showProgressDialog();
    int response = await StudentServices.studentVerification(data);
    ProgressDialogUtils.hideProgressDialog();

    if (response != 0) {
      Get.off(() => StudentRegisterScreen(studentId: response,));
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
}
