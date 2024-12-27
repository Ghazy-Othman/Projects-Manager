//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/project_request_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class ProjectRequestScreen extends StatelessWidget {
  ProjectRequestScreen(
      {super.key, required this.doctorId, required this.groupId});
  final int doctorId;
  final int groupId;
  final ProjectRequestScreenController controller =
      Get.put(ProjectRequestScreenController());
  @override
  Widget build(BuildContext context) {
    controller.groupId = groupId;
    controller.doctorId = doctorId;
    return SafeArea(
      child: Scaffold(body: GetBuilder<ProjectRequestScreenController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(20.0),
                ),
                Padding(
                  padding: getPadding(all: 25.0),
                  child: Text("Send a project request to a doctor ",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: getFontSize(24.0),
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: getPadding(all: 25.0),
                  child: Text("Project title : ",
                      style: TextStyle(
                          fontSize: getFontSize(20.0),
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                    padding: getPadding(left: 25.0, right: 85.0),
                    child: SizedBox(
                      height: getVerticalSize(50.0),
                      child: TextField(
                        controller: controller.projectTitle,
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
                Padding(
                  padding: getPadding(all: 25.0),
                  child: Text(
                    "About project : ",
                    style: TextStyle(
                        fontSize: getFontSize(20.0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: getPadding(left: 25.0, right: 85.0),
                    child: SizedBox(
                      child: TextField(
                        maxLines: 10,
                        controller: controller.projectAbout,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF00A3FF), width: 2),
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                    )),
                SizedBox(height: getVerticalSize(20.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: getMargin(all: 25.0),
                      width: getVerticalSize(144.0),
                      height: getVerticalSize(60.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF2F80ED),
                          borderRadius: BorderRadius.circular(8)),
                      child: MaterialButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: getFontSize(20), color: Colors.white),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Container(
                      margin: getMargin(all: 25.0),
                      width: getVerticalSize(144.0),
                      height: getVerticalSize(60.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF2F80ED),
                          borderRadius: BorderRadius.circular(8)),
                      child: MaterialButton(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: getFontSize(20), color: Colors.white),
                        ),
                        onPressed: () {
                          controller.sendProjectRequest();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
