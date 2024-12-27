//
//
//
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projects_manager/constants/images_constants.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/doctor_views/doctor_login/doctor_login_screen.dart';
import 'package:projects_manager/views/student_views/student_login/student_login_screen.dart';

class OnboardingChoosingScreen extends StatelessWidget {
  const OnboardingChoosingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: Padding(
              padding: getPadding(top: 50.0, left: 70, right: 70.0),
              child: SizedBox(
                height: getVerticalSize(240.0),
                child: SvgPicture.asset(
                  ImagesConstants.onboardingChoose,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: getPadding(top: 310.0),
              child: Column(
                children: [
                  Container(
                    width: getHorizontalSize(144.0),
                    height: getVerticalSize(60.0),
                    margin: getMargin(top: 20.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.blue, width: getHorizontalSize(1))),
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      shape: const StadiumBorder(),
                      onPressed: () {
                        Get.offAll(() => DoctorLoginScreen());
                      },
                      child: Text("Doctor",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: getFontSize(24),
                              backgroundColor: Colors.white,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(144.0),
                    height: getVerticalSize(60.0),
                    margin: getMargin(top: 20.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.blue, width: getHorizontalSize(1))),
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      shape: const StadiumBorder(),
                      onPressed: () {
                        Get.offAll(() => StudentLoginScreen());
                      },
                      child: Text("Student",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: getFontSize(24),
                              backgroundColor: Colors.white,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Image.asset(
                ImagesConstants.splashBottom,
                height: getVerticalSize(200.0),
                fit: BoxFit.fitWidth,
              )),
        ],
      ),
    );
  }
}
