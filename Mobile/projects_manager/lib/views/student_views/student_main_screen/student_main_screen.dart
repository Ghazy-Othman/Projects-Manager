//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/student_main_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/student_views/student_main_screen/student_notification_screen.dart';

class StudentMainScreen extends StatelessWidget {
  StudentMainScreen({super.key});

  final StudentMainScreenController controller =
      Get.put(StudentMainScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentMainScreenController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(() => StudentNotificationScreen());
                    },
                    icon: const Icon(Icons.notifications_active))
              ],
            ),
            body: controller.currentPage(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                controller.updateIndex(index);
              },
              iconSize: getSize(30),
              currentIndex: controller.currentIndex,
              backgroundColor: Colors.lightBlue[50],
              unselectedItemColor: Colors.blueGrey,
              selectedItemColor: Colors.blueGrey,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.pix_outlined),
                    label: "",
                    activeIcon: Container(
                      margin: getMargin(top: 10),
                      child: Padding(
                          padding: getPadding(bottom: 10),
                          child: Center(
                              child: Text(
                            "Home",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blueGrey,
                                fontSize: getFontSize(20),
                                fontWeight: FontWeight.bold),
                          ))),
                    )),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.groups),
                    label: "",
                    activeIcon: Container(
                      margin: getMargin(top: 10),
                      child: Padding(
                          padding: getPadding(bottom: 10),
                          child: Center(
                              child: Text(
                            "Group",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blueGrey,
                                fontSize: getFontSize(20),
                                fontWeight: FontWeight.bold),
                          ))),
                    )),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: "",
                    activeIcon: Container(
                        margin: getMargin(top: 10),
                        child: Padding(
                          padding: getPadding(bottom: 10),
                          child: Center(
                              child: Text(
                            "Profile",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blueGrey,
                                fontSize: getFontSize(20),
                                fontWeight: FontWeight.bold),
                          )),
                        )))
              ],
            )),
      );
    });
  }
}
