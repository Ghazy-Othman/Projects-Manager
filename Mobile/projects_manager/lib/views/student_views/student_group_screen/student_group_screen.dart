//
//
//
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projects_manager/constants/images_constants.dart';
import 'package:projects_manager/controllers/student/student_group_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/student_views/student_group_screen/add_request_screen.dart';

class StudentGroupScreen extends StatelessWidget {
  StudentGroupScreen({super.key});

  final StudentGroupScreenController controller =
      Get.put(StudentGroupScreenController());

  Widget _groupStudents() {
    List<Widget> students = [];
    for (int i = 0; i < controller.studentGroup.students.length; i++) {
      students.add(Padding(
        padding: getPadding(all: 5.0),
        child: Text("${controller.studentGroup.students[i].firstName} "
            "${controller.studentGroup.students[i].lastName} "),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: students,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentGroupScreenController>(builder: (controller) {
      if (controller.hasGroup) {
        if (!controller.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getStudentGroupInfo();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(all: 25.0),
                  child: Text(
                    "Group information : ",
                    style: TextStyle(
                        fontSize: getFontSize(20.0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: getPadding(left: 25.0, right: 25.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Students : ",
                          style: TextStyle(
                              fontSize: getFontSize(16.0),
                              fontWeight: FontWeight.bold),
                        ),
                        if (controller.isAdmin)
                          IconButton(
                              onPressed: () {
                                Get.to(() => AddRequestScreen(
                                      groupStudents: controller
                                          .studentGroup.students.length,
                                    ));
                              },
                              icon: const Icon(
                                Icons.add_box_outlined,
                                color: Color(0xFF2F80ED),
                              ))
                      ],
                    )),
                Padding(
                  padding: getPadding(left: 25.0, right: 25.0),
                  child: _groupStudents(),
                ),
                SizedBox(
                  height: getVerticalSize(30.0),
                ),
                Padding(
                    padding: getPadding(left: 25.0, right: 25.0, bottom: 10.0),
                    child: Text(
                      "Project : ",
                      style: TextStyle(
                          fontSize: getFontSize(16.0),
                          fontWeight: FontWeight.bold),
                    )),
                if (controller.studentGroup.project != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                            left: 25.0, right: 25.0, bottom: 10.0, top: 10.0),
                        child: const Text(
                          "Title : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 25.0, right: 25.0),
                        child: Text(controller.studentGroup.project!.title!),
                      ),
                      Padding(
                        padding: getPadding(
                            left: 25.0, right: 25.0, bottom: 10.0, top: 10.0),
                        child: const Text(
                          "About : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 25.0, right: 25.0),
                        child: Text(controller.studentGroup.project!.about!),
                      ),
                    ],
                  )
              ],
            ),
          ),
        );
      }
      // Student can create new group
      return RefreshIndicator(
        onRefresh: () async {
          await controller.getStudentGroupInfo();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getVerticalSize(50.0),
              ),
              Padding(
                padding: getPadding(all: 25.0),
                child: Text(
                  "You don't have any groups",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(all: 25.0),
                child: SizedBox(
                    height: getVerticalSize(300.0),
                    child: SvgPicture.asset(
                      ImagesConstants.newGroupLogo,
                      fit: BoxFit.contain,
                    )),
              ),
              Container(
                margin: getMargin(all: 25.0),
                width: double.infinity,
                height: getVerticalSize(60.0),
                decoration: BoxDecoration(
                    color: const Color(0xFF2F80ED),
                    borderRadius: BorderRadius.circular(8)),
                child: MaterialButton(
                  child: Text(
                    'New group',
                    style: TextStyle(
                        fontSize: getFontSize(20), color: Colors.white),
                  ),
                  onPressed: () {
                    controller.createNewGroup();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
