//
//
//
import 'package:admin/constants/images_constants.dart';
import 'package:admin/controllers/form_page_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingEditFormScreen extends StatelessWidget {
  OnboardingEditFormScreen({super.key , required this.fromUploadFile});

  final FormPageController controller = Get.put(FormPageController());
  final bool fromUploadFile ;
  @override
  Widget build(BuildContext context) {
    controller.cameFromUploadFile = true ;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: SizedBox(
                  height: getVerticalSize(186.0),
                  child: Image.asset(
                    ImagesConstants.onboardingUploadFileTop,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              right: 0.0,
              child: Padding(
                padding: getPadding(right: 25.0, top: 50.0),
                child: SizedBox(
                  height: getVerticalSize(140.0),
                  child: SvgPicture.asset(
                      ImagesConstants.onboardingEditFormLogo,
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 210.0),
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                            left: 25.0, right: 25.0, top: 7.0, bottom: 20.0),
                        child: Text(
                          "Form rules :",
                          style: TextStyle(
                              fontSize: getFontSize(24.0),
                              color: const Color(0xFF0C49CD),
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: getPadding(
                            left: 25.0, right: 25.0, top: 7.0, bottom: 10.0),
                        child: Text(
                          "Max number of students per group :",
                          style: TextStyle(
                            fontSize: getFontSize(20.0),
                            color: const Color(0xFF0C49CD),
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Min :",
                          style: TextStyle(
                              color: const Color(0xFF00A3FF),
                              fontSize: getFontSize(14.0)),
                        ),
                      ),
                      Padding(
                          padding: getPadding(
                              right: 230.0, left: 25.0, bottom: 10.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: controller.studentsMinController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
                            ),
                          )),

                      // Max
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Max :",
                          style: TextStyle(
                              color: const Color(0xFF00A3FF),
                              fontSize: getFontSize(14.0)),
                        ),
                      ),
                      Padding(
                          padding: getPadding(
                              right: 230.0, left: 25.0, bottom: 10.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.studentsMaxController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
                            ),
                          )),

                      Padding(
                        padding: getPadding(
                            left: 25.0, right: 25.0, top: 20.0, bottom: 10.0),
                        child: Text(
                          "Max number of groups for a doctor :",
                          style: TextStyle(
                            fontSize: getFontSize(20.0),
                            color: const Color(0xFF0C49CD),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Max :",
                          style: TextStyle(
                              color: const Color(0xFF00A3FF),
                              fontSize: getFontSize(14.0)),
                        ),
                      ),
                      Padding(
                          padding: getPadding(
                              right: 230.0, left: 25.0, bottom: 10.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.groupMaxController,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
                            ),
                          )),

                      GetBuilder<FormPageController>(builder: (controller) {
                        return CheckboxListTile(
                            title: Padding(
                              padding: getPadding(left: 10, right: 25.0),
                              child: Text(
                                "Ability of mix : ",
                                style: TextStyle(
                                  fontSize: getFontSize(20.0),
                                  color: const Color(0xFF0C49CD),
                                ),
                              ),
                            ),
                            value: controller.abilityOfMix,
                            onChanged: (v) {
                              controller.updateAbilityOfMix();
                            });
                      }),

                      SizedBox(
                        child: Padding(
                          padding: getPadding(top: 30.0, bottom: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: getPadding(left: 25.0, right: 25.0),
                                child: Container(
                                  height: getVerticalSize(60.0),
                                  width: getHorizontalSize(144.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(7.0)),
                                  child: MaterialButton(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: getFontSize(16.0),
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.updateForm();
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
