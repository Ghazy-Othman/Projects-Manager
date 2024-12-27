//
//
//
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/services/project/project_services.dart';

class ProjectRequestScreenController extends GetxController {
  TextEditingController projectTitle = TextEditingController();
  TextEditingController projectAbout = TextEditingController();
  int? doctorId;
  int? groupId;

  // Send project request to a doctor
  Future<void> sendProjectRequest() async {
    if (projectTitle.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter project name ");
      return;
    }
    if (projectAbout.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter project about ");
      return;
    }

    Map<String, dynamic> data = {
      "doctor_id": doctorId,
      "project_title": projectTitle.text.trim(),
      "project_about": projectAbout.text.trim()
    };

    ProgressDialogUtils.showProgressDialog();
    bool res = await ProjectServices.sendProjectRequest(data);
    ProgressDialogUtils.hideProgressDialog();

    if (res) {
      Fluttertoast.showToast(msg: "Request sent successfully");
      Get.back();
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
      Get.back();
    }
  }
}
