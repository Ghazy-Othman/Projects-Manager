//
//
//
import 'package:admin/constants/images_constants.dart';
import 'package:admin/controllers/upload_file_page_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:admin/view/main_screen/main_screen.dart';
import 'package:admin/view/onboarding/edit_form/onboarding_edit_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnBoardingUploadFileScreen extends StatelessWidget {
  OnBoardingUploadFileScreen({super.key});

  final UploadFilePageController controller = Get.put(UploadFilePageController()) ;

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: getPadding(left: 65.0, right: 65.0, top: 65.0),
              child: SizedBox(
                height: getVerticalSize(170.0),
                child: SvgPicture.asset(ImagesConstants.onboardingLogo,
                    fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: getPadding(top: 300.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Upload students info file" , style: TextStyle(
                                  fontSize: getFontSize(24.0) ,
                                    color: const Color(0xFF0C49CD),
                                  fontWeight: FontWeight.bold
                                ),) ,
                                Text("CLick the icon to upload the file ." , style: TextStyle(
                                  fontSize: getFontSize(16.0) ,
                                    color: const Color(0xFF0C49CD),
                                ),) ,
                                InkWell(
                                  //TODO : Upload file
                                  onTap: () {
                                    controller.uploadFile() ;
                                  },
                                  child: SizedBox(
                                      width: getHorizontalSize(100.0),
                                      height: getVerticalSize(100.0),
                                      child: Image.asset(ImagesConstants.uploadLogo , fit: BoxFit.contain,)),
                                ) ,
                              ],
                            ),
                          ),
                        )) ,
                    SizedBox(
                      child: Padding(
                        padding: getPadding(top: 50.0 , bottom: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: getPadding(left: 25.0 , right: 25.0),
                              child: Container(
                                height: getVerticalSize(60.0),
                                width: getHorizontalSize(144.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: MaterialButton(
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontSize: getFontSize(16.0), color: Colors.white),
                                  ),
                                  ///TODO : Go to home page
                                  onPressed: () {
                                    Get.to(() => MainScreen()) ;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(left: 25.0 , right: 25.0),
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
                                        fontSize: getFontSize(16.0), color: Colors.white),
                                  ),
                                  ///TODO : Go to next page ( FORM )
                                  onPressed: () {
                                    Get.to(() => OnboardingEditFormScreen(fromUploadFile: true,));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ) ,
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
