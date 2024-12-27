//
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/student_profile_screen_controller.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/onboarding_choosing_screen/onboarding_choosing_screen.dart';
import 'package:projects_manager/views/student_views/student_login/student_login_screen.dart';

class StudentProfileScreen extends StatelessWidget {
  StudentProfileScreen({super.key});

  final StudentProfileScreenController controller =
      Get.put(StudentProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentProfileScreenController>(
      builder: (controller) {
        if (!controller.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: getPadding(all: 25.0),
                      child: Text(
                        "${controller.student!.firstName!} ${controller.student!.lastName!}",
                        style: TextStyle(
                            color: const Color(0xFF0C49CD),
                            fontSize: getFontSize(24.0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 20.0, right: 20.0),
                    child: IconButton(
                        onPressed: () {
                          PrefHelper.clearData();
                          Get.offAll(() => const OnboardingChoosingScreen());
                        },
                        icon: const Icon(Icons.login_outlined)),
                  )
                ],
              ),
              SizedBox(
                height: getVerticalSize(20.0),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "ID: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.student!.studentId!.toString()),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "First name : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.student!.firstName!),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "Mid name : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.student!.midName!),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "Last name : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.student!.lastName!),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "Email : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.student!.email!),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "Section: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.student!.section!),
              ),
            ],
          ),
        );
      },
    );
  }
}
