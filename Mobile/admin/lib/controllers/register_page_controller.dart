//
//
//
import 'package:admin/routes/app_routes.dart';
import 'package:admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    sectionController.dispose();
    super.onClose();
  }

  //
  Future<void> adminRegister() async {
    if (firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your first name");
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
    if (sectionController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your section \n software or network");
      return;
    }
    Map<String, dynamic> data = {
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "section": sectionController.text.trim()
    };
    bool response = await AdminServices.register(data);
    if (response) {
      Get.toNamed(AppRoutes.onboardingUploadFileScreen);
    }
  }
}
