//
//
//
import 'package:admin/controllers/add_doctor_page_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDoctorScreen extends StatelessWidget {
  AddDoctorScreen({super.key});

  final AddDoctorPageController controller = Get.put(AddDoctorPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Add doctor",
              style: TextStyle(
                fontSize: getFontSize(32.0),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0C49CD),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(30.0),
                ),
                //First Name
                Padding(
                  padding: getPadding(
                      top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                  child: Text(
                    "First name :",
                    style: TextStyle(
                      fontSize: getFontSize(20.0),
                      color: const Color(0xFF2F2E41),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                    padding: getPadding(right: 25.0, left: 25.0, bottom: 10.0),
                    child: SizedBox(
                      child: TextField(
                        controller: controller.firstNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF00A3FF), width: 2))),
                      ),
                    )),

                //Last Name
                Padding(
                  padding: getPadding(
                      top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                  child: Text(
                    "Last name :",
                    style: TextStyle(
                      fontSize: getFontSize(20.0),
                      color: const Color(0xFF2F2E41),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                    padding: getPadding(right: 25.0, left: 25.0, bottom: 10.0),
                    child: SizedBox(
                      child: TextField(
                        controller: controller.lastNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF00A3FF), width: 2))),
                      ),
                    )),

                //Email Name
                Padding(
                  padding: getPadding(
                      top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                  child: Text(
                    "Email :",
                    style: TextStyle(
                      fontSize: getFontSize(20.0),
                      color: const Color(0xFF2F2E41),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                    padding: getPadding(right: 25.0, left: 25.0, bottom: 10.0),
                    child: SizedBox(
                      child: TextField(
                        controller: controller.emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF00A3FF), width: 2))),
                      ),
                    )),

                //Section Name
                Padding(
                  padding: getPadding(
                      top: 7.0, bottom: 7.0, left: 25.0, right: 25.0),
                  child: Text(
                    "Section :",
                    style: TextStyle(
                      fontSize: getFontSize(20.0),
                      color: const Color(0xFF2F2E41),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                    padding: getPadding(right: 25.0, left: 25.0, bottom: 10.0),
                    child: SizedBox(
                      child: TextField(
                        controller: controller.sectionNameController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF00A3FF), width: 2))),
                      ),
                    )),

                SizedBox(
                  height: getVerticalSize(30.0),
                ),
                // Add
                Container(
                  margin: getMargin(all: 25.0),
                  width: double.infinity,
                  height: getVerticalSize(60.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFF2F80ED),
                      borderRadius: BorderRadius.circular(8)),
                  child: MaterialButton(
                    child: Text(
                      'Add doctor',
                      style: TextStyle(
                          fontSize: getFontSize(18), color: Colors.white),
                    ),
                    onPressed: () {
                      controller.addDoctor();
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
