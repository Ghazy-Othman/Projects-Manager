//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/doctor/doctor_profile_screen_controller.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/doctor_views/doctor_login/doctor_login_screen.dart';
import 'package:projects_manager/views/onboarding_choosing_screen/onboarding_choosing_screen.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({super.key});

  final DoctorProfileScreenController controller =
      Get.put(DoctorProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorProfileScreenController>(
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
                        controller.doctor!.firstName! +
                            controller.doctor!.lastName!,
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
                child: Text(controller.doctor!.doctorId!.toString()),
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
                child: Text(controller.doctor!.firstName!),
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
                child: Text(controller.doctor!.lastName!),
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
                child: Text(controller.doctor!.email!),
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
                child: Text(controller.doctor!.section!),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 15.0, top: 15.0),
                child: Text(
                  "Max number of groups : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20.0)),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.doctor!.maxNumberOfGroups!.toString()),
              ),
            ],
          ),
        );
      },
    );
  }
}
