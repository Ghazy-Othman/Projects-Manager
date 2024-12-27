//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/new_password_page_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key, required this.email ,required this.role });

  final String email;
  final String role ;
  final NewPasswordPageController controller =
  Get.put(NewPasswordPageController());
  @override
  Widget build(BuildContext context) {
    controller.email = email;
    controller.role = role;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getVerticalSize(10.0),) ,
            // OTP code
            Padding(
              padding: getPadding(all: 25.0),
              child: Text(
                "OTP Code : ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0C49CD),
                    fontSize: getFontSize(24.0)),
              ),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0, bottom: 10.0),
              child: Text(
                "Please enter the OTP code we sent to your email .\n"
                    "NOTE : The code will be expired in 3 minutes !!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
              ),
            ),
            Padding(
              padding:
              getPadding(top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
              child: Text(
                "OTP code :",
                style: TextStyle(
                    fontSize: getFontSize(14.0), color: Colors.lightBlueAccent),
              ),
            ),
            Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: SizedBox(
                  height: getVerticalSize(50.0),
                  child: TextField(
                    controller: controller.otpCodeController,
                    textInputAction: TextInputAction.next,
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

            // Reset password
            Padding(
              padding: getPadding(all: 25.0),
              child: Text(
                "New password : ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0C49CD),
                    fontSize: getFontSize(24.0)),
              ),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0, bottom: 10.0),
              child: Text(
                "Please enter your new password .\n"
                    "NOTE : passwords length must be least 8 !!",
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: getFontSize(20.0)),
              ),
            ),
            Padding(
              padding:
              getPadding(top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
              child: Text(
                "New password:",
                style: TextStyle(
                    fontSize: getFontSize(14.0), color: Colors.lightBlueAccent),
              ),
            ),
            Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: SizedBox(
                  height: getVerticalSize(50.0),
                  child: TextField(
                    controller: controller.newPasswordController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFF00A3FF), width: 2),
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                )),

            SizedBox(
              height: getVerticalSize(15.0),
            ),

            //Confirm
            Padding(
              padding:
              getPadding(top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
              child: Text(
                "Confirm new password:",
                style: TextStyle(
                    fontSize: getFontSize(14.0), color: Colors.lightBlueAccent),
              ),
            ),
            Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: SizedBox(
                  height: getVerticalSize(50.0),
                  child: TextField(
                    controller: controller.confirmNewPasswordController,
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
                  'Reset password',
                  style:
                  TextStyle(fontSize: getFontSize(20), color: Colors.white),
                ),
                onPressed: () {
                  controller.resetPassword();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
