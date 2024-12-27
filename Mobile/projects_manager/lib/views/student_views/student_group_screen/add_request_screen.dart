//
//
//
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/send_add_requests_page_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';

class AddRequestScreen extends StatelessWidget {
  AddRequestScreen({super.key, required this.groupStudents});

  final int groupStudents;
  final SendAddRequestPageController controller =
      Get.put(SendAddRequestPageController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: GetBuilder<SendAddRequestPageController>(
      builder: (controller) {
        if (!controller.formDone) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!controller.done) {
          return const Center(child: CircularProgressIndicator());
        }
        controller.checkIfCanChooseStudent(groupStudents) ;
        if (controller.students.isEmpty) {
          return const Center(
            child: Text("There are no students to add "),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getVerticalSize(50.0),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0, bottom: 25.0),
              child: Text(
                "Choose at most ${controller.formRules["max_number_of_student"] - groupStudents} students to ask for join your group :",
                style: TextStyle(
                    fontSize: getFontSize(22.0), fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: getVerticalSize(30.0),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: controller.students.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: getPadding(left: 25.0, right: 25.0, bottom: 10.0),
                  child: SizedBox(
                    height: getVerticalSize(60.0),
                    child: CheckboxListTile(
                      value: controller.checkedStudents[index],
                      onChanged: (v) {
                        if (v == true) {
                          if (controller.cnt ==
                              controller.formRules["max_number_of_student"] -
                                  groupStudents) {
                            Fluttertoast.showToast(
                                msg: "You can not choose more students");
                          } else {
                            controller.updateCheckedStudent(index, v!);
                          }
                        }
                        else {
                          controller.updateCheckedStudent(index, v!);
                        }
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.students[index].firstName} ${controller.students[index].midName} ${controller.students[index].lastName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getFontSize(18.0)),
                          ),
                          Text(controller.students[index].section!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: getFontSize(18.0)))
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
            SizedBox(
              height: getVerticalSize(30.0),
            ),
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
                      controller.sendAddRequests();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ));
  }
}
