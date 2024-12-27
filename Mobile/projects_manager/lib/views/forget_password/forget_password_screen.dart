//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/forget_password_page_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key , required this.role});

  final String role ;
  final ForgetPasswordPageController controller =
  Get.put(ForgetPasswordPageController());

  @override
  Widget build(BuildContext context) {
    controller.role = role ;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forget password",
          style: TextStyle(
            fontSize: getFontSize(32.0),
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0C49CD),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(all: 25.0),
            child : Text(
              "Please enter your email and we will send an OTP code to it .",
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: getFontSize(16.0)),
            ),
          ),
          Padding(
            padding:
            getPadding(top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
            child: Text(
              "Email :",
              style: TextStyle(
                  fontSize: getFontSize(14.0), color: Colors.lightBlueAccent),
            ),
          ),
          Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: SizedBox(
                height: getVerticalSize(50.0),
                child: TextField(
                  controller: controller.emailController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF00A3FF), width: 2),
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              )),
          SizedBox(
            height: getVerticalSize(30.0),
          ),
          Container(
            margin: getMargin(all: 25.0),
            width: double.infinity,
            height: getVerticalSize(60.0),
            decoration: BoxDecoration(
                color: const Color(0xFF2F80ED),
                borderRadius: BorderRadius.circular(8)),
            child: MaterialButton(
              child: Text(
                'Next',
                style:
                TextStyle(fontSize: getFontSize(20), color: Colors.white),
              ),
              onPressed: () {
                controller.sendOTPRequest();
              },
            ),
          ),
        ],
      ),
    );
  }
}
