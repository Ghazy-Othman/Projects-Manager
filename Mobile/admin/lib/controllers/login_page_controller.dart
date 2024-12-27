//
//
//
import 'package:admin/services/admin_services.dart';
import 'package:admin/view/main_screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    sectionController.dispose();
    super.onClose() ;
  }


  //
  Future<void> adminLogin() async {
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
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "section": sectionController.text.trim()
    };
    bool res = await AdminServices.login(data);
    if (res) {
      _goToHomePage();
    }
    else {
    }
  }

  //
  void _goToHomePage() {
    Get.offAll(() => MainScreen());
  }
}
