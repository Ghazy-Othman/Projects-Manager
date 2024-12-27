//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/doctor/doctor_project_request_screen.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class DoctorProjectRequestScreen extends StatelessWidget {
  DoctorProjectRequestScreen(
      {super.key,
      required this.title,
      required this.projectRequestId,
      required this.about,
      required this.groupId});

  final String title, about;
  final int groupId, projectRequestId;
  final DoctorProjectRequestScreenController controller =
      Get.put(DoctorProjectRequestScreenController());

  Widget _groupStudents() {
    List<Widget> students = [];
    for (int i = 0; i < controller.group!.students.length; i++) {
      students.add(Padding(
        padding: getPadding(all: 5.0),
        child: Text("${controller.group!.students[i].firstName} "
            "${controller.group!.students[i].lastName} "),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: students,
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.groupId = groupId;
    controller.getGroupInfo();
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<DoctorProjectRequestScreenController>(
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
                  Padding(
                    padding: getPadding(left: 25.0, right: 25.0),
                    child: Text(
                      "Title : ",
                      style: TextStyle(
                          fontSize: getFontSize(20.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
                    child: Text(title),
                  ),
                  Padding(
                    padding: getPadding(left: 25.0, right: 25.0),
                    child: Text(
                      "About : ",
                      style: TextStyle(
                          fontSize: getFontSize(20.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
                    child: Text(about),
                  ),
                  Padding(
                    padding: getPadding(left: 25.0, right: 25.0),
                    child: Text(
                      "Group ID : ",
                      style: TextStyle(
                          fontSize: getFontSize(20.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
                    child: Text(groupId.toString()),
                  ),
                  Padding(
                    padding: getPadding(left: 25.0, right: 25.0),
                    child: Text(
                      "Group Students : ",
                      style: TextStyle(
                          fontSize: getFontSize(20.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 25.0, right: 25.0),
                    child: _groupStudents(),
                  ),
                  SizedBox(
                    height: getVerticalSize(50.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            getPadding(left: 25.0, right: 25.0, bottom: 25.0),
                        child: Container(
                          height: getVerticalSize(50.0),
                          width: getHorizontalSize(120.0),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(7.0)),
                          child: MaterialButton(
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                  fontSize: getFontSize(18),
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              controller.updateProjectRequest(
                                  projectRequestId, 1);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            getPadding(left: 25.0, right: 25.0, bottom: 25.0),
                        child: Container(
                          height: getVerticalSize(50.0),
                          width: getHorizontalSize(120.0),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(7.0)),
                          child: MaterialButton(
                            child: Text(
                              'Reject',
                              style: TextStyle(
                                  fontSize: getFontSize(18.0),
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              controller.updateProjectRequest(
                                  projectRequestId, 0);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}
