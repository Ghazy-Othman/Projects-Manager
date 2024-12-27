//
//
//
import 'package:admin/constants/images_constants.dart';
import 'package:admin/controllers/register_page_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    RegisterPageController controller = RegisterPageController() ;
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
                height: getVerticalSize(150.0),
                child: SvgPicture.asset(ImagesConstants.registerScreenLogo,
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: getPadding(top: 233.0 , bottom: 10.0),
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

                      // first Name
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
                              textInputAction: TextInputAction.next,
                              controller: controller.firstNameController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
                            ),
                          )),

                      // first Name
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Last name :",
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
                              textInputAction: TextInputAction.next,
                              controller: controller.lastNameController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
                            ),
                          )),


                      // Email
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Email :",
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
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2))),
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
                          padding:
                          getPadding(left: 25.0, right: 85.0, bottom: 10.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: controller.passwordController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2),
                                      borderRadius: BorderRadius.circular(15.0))),
                            ),
                          )),

                      // Section
                      Padding(
                        padding: getPadding(
                            top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                        child: Text(
                          "Section :",
                          style: TextStyle(
                              fontSize: getFontSize(14.0),
                              color: Colors.lightBlueAccent),
                        ),
                      ),
                      Padding(
                          padding:
                          getPadding(left: 25.0, right: 85.0),
                          child: SizedBox(
                            height: getVerticalSize(50.0),
                            child: TextField(
                              controller: controller.sectionController,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00A3FF), width: 2),
                                      borderRadius: BorderRadius.circular(15.0))),
                            ),
                          )),

                      SizedBox(
                        child: Padding(
                          padding: getPadding(top: 25.0 , bottom: 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: getPadding(left: 15.0 , right: 15.0),
                                child: InkWell(
                                  onTap: (){
                                    Get.offAllNamed(AppRoutes.loginScreen) ;
                                  },
                                  child: Text("Already member ? Login" , style: TextStyle(
                                      fontSize: getFontSize(16.0) ,
                                      color: const Color(0xFF0C49CD),
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ) ,
                              Padding(
                                padding: getPadding(left: 15.0 , right: 15.0),
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
                                          fontSize: getFontSize(20), color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.adminRegister();
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
              ),
            )
          ],
        ));
  }
}
