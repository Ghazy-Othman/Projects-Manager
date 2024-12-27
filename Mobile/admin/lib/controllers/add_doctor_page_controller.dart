//
//
//

import 'package:admin/controllers/home_screen_controller.dart';
import 'package:admin/core/utils/progress_dialog_utils.dart';
import 'package:admin/data/models/doctor.dart';
import 'package:admin/services/admin_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddDoctorPageController extends GetxController {

  TextEditingController firstNameController = TextEditingController() ;
  TextEditingController lastNameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController sectionNameController = TextEditingController() ;




  //
  Future<void> addDoctor() async {

    if(firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter first name") ;
      return  ;
    }
    if(lastNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter last name") ;
      return  ;
    }
    if(emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter email") ;
      return  ;
    }
    if(sectionNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter section") ;
      return  ;
    }

    Map<String, dynamic> data = {
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "section": sectionNameController.text.trim()
    };

    ProgressDialogUtils.showProgressDialog() ;
    Doctor? newDoctor = await AdminServices.addDoctor(data);
    ProgressDialogUtils.hideProgressDialog() ;

    if (newDoctor != null) {
      Get.find<HomeScreenController>().addDoctorToList(newDoctor) ;
      _returnToMainPage();
    } else {
      Fluttertoast.showToast(msg: "Something went wrong") ;
    }
  }

  //
  void _returnToMainPage() {
    Get.back() ;
  }
}
