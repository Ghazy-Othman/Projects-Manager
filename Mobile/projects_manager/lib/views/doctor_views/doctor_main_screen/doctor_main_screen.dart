//
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/doctor/doctor_main_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/doctor_views/doctor_main_screen/doctor_notification_screen.dart';

class DoctorMainScreen extends StatelessWidget {
  DoctorMainScreen({super.key});

  final DoctorMainScreenController controller =
      Get.put(DoctorMainScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorMainScreenController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() =>  DoctorNotificationScreen());
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
          ));
    });
  }
}
