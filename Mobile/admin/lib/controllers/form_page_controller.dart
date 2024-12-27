//
//
//
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/data/models/admin.dart';
import 'package:admin/services/admin_services.dart';
import 'package:admin/view/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FormPageController extends GetxController {
  TextEditingController studentsMinController = TextEditingController();
  TextEditingController studentsMaxController = TextEditingController();
  TextEditingController groupMaxController = TextEditingController();

  bool abilityOfMix = false;
  bool cameFromUploadFile = false;

  @override
  void onInit() {
    _getFormRulesFromLocal();
    super.onInit();
  }

  void _getFormRulesFromLocal() async {
    Admin admin = await PrefHelper.getAdminInfo();
    await AdminServices.getFormRules(admin.section!);

    studentsMinController.text =
        admin.minNumber != null ? admin.minNumber.toString() : "";
    studentsMaxController.text =
        admin.maxNumber != null ? admin.maxNumber.toString() : "";
    abilityOfMix = admin.mix == null ? false : admin.mix!;
    groupMaxController.text =
        admin.maxDoctorGroups != null ? admin.maxDoctorGroups.toString() : "";
    update();
  }

  //
  Future<void> updateForm() async {
    if (studentsMinController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter min number of students");
      return;
    }

    if (studentsMaxController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter max number of students");
      return;
    }
    if (groupMaxController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter max number of groups");
      return;
    }

    Map<String, dynamic> data = {
      "mix": abilityOfMix,
      "min_number": studentsMinController.text.trim(),
      "max_number": studentsMaxController.text.trim(),
      "max_doctor_groups": groupMaxController.text.trim()
    };

    bool res = await AdminServices.updateForm(data);
    if (res) {
      Fluttertoast.showToast(msg: "Form rules updated successfully ");
      if (cameFromUploadFile) {
        Get.offAll(() => MainScreen());
      }
    }
  }

  //
  void updateAbilityOfMix() {
    abilityOfMix = !abilityOfMix;
    update();
  }
}
