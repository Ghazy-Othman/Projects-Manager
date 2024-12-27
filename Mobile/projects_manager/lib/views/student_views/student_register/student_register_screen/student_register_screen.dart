//
//
//
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projects_manager/constants/images_constants.dart';
import 'package:projects_manager/controllers/student/register_page_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class StudentRegisterScreen extends StatelessWidget {
  StudentRegisterScreen({super.key , required this.studentId});

  final int studentId ;
  final RegisterPageController controller = Get.put(RegisterPageController());

  @override
  Widget build(BuildContext context) {
    controller.studentId = studentId ;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 0.0,
                child: Image.asset(
                  ImagesConstants.loginScreenTop,
                  height: getVerticalSize(176.0),
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding: getPadding(left: 65.0, right: 65.0, top: 65.0),
              child: SizedBox(
                height: getVerticalSize(170.0),
                child: SvgPicture.asset(ImagesConstants.loginScreenLogo,
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: getPadding(top: 253.0, bottom: 10.0),
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(top: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: getFontSize(36),
                              color: const Color(0xFF0C49CD),
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      // First name
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "First name :",
                          style: TextStyle(
                              color: const Color(0xFF00A3FF),
                              fontSize: getFontSize(14.0)),
                        ),
                      ),
                      Padding(
                          padding:
                              getPadding(right: 85.0, left: 25.0, bottom: 10.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.firstNameController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
                            ),
                          )),

                      // Mid name
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Mid name:",
                          style: TextStyle(
                              fontSize: getFontSize(14.0),
                              color: Colors.lightBlueAccent),
                        ),
                      ),
                      Padding(
                          padding:
                              getPadding(left: 25.0, right: 85.0, bottom: 10.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.midNameController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                          )),

                      // Last name
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Last name :",
                          style: TextStyle(
                              fontSize: getFontSize(14.0),
                              color: Colors.lightBlueAccent),
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 25.0, right: 85.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.lastNameController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                          )),

                      // Email
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Email :",
                          style: TextStyle(
                              fontSize: getFontSize(14.0),
                              color: Colors.lightBlueAccent),
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 25.0, right: 85.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                          )),

                      // Password
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Password :",
                          style: TextStyle(
                              fontSize: getFontSize(14.0),
                              color: Colors.lightBlueAccent),
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 25.0, right: 85.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.passwordController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                          )),

                      SizedBox(
                        child: Padding(
                          padding: getPadding(top: 50.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: getPadding(left: 15.0, right: 15.0),
                                child: Container(
                                  height: getVerticalSize(60.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(7.0)),
                                  child: MaterialButton(
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: getFontSize(24),
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.registerStudent();
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
