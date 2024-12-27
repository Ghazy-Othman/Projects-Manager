//
//
//
import 'package:admin/constants/images_constants.dart';
import 'package:admin/controllers/main_screen_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:admin/view/add_doctor/add_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<MainScreenController>(
      builder: (controller) {
        return Scaffold(
            floatingActionButton: controller.currentIndex == 0
                ? FloatingActionButton(
                    onPressed: () {
                      Get.to(() => AddDoctorScreen());
                    },
                    backgroundColor: const Color(0xFF3B71FE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
                : null,
            body: controller.currentPage(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                controller.updateIndex(index);
              },
              iconSize: getSize(30),
              currentIndex: controller.currentIndex,
              backgroundColor: Colors.lightBlue[50],
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: getPadding(top: 10.0),
                      child: SvgPicture.asset(
                        ImagesConstants.navHome,
                      ),
                    ),
                    label: "",
                    activeIcon: Center(
                        child: Padding(
                      padding: getPadding(top: 10.0),
                      child: Text(
                        "Home",
                        style: TextStyle(
                            color: const Color(0xFF386BF6),
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: getPadding(top: 10.0),
                      child: SvgPicture.asset(
                        ImagesConstants.navForm,
                      ),
                    ),
                    label: "",
                    activeIcon: Center(
                        child: Padding(
                      padding: getPadding(top: 10.0),
                      child: Text(
                        "Form",
                        style: TextStyle(
                            color: const Color(0xFF386BF6),
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: getPadding(top: 10.0),
                      child: SvgPicture.asset(
                        ImagesConstants.navFile,
                      ),
                    ),
                    label: "",
                    activeIcon: Center(
                        child: Padding(
                      padding: getPadding(top: 10.0),
                      child: Text(
                        "File",
                        style: TextStyle(
                            color: const Color(0xFF386BF6),
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: getPadding(top: 10.0),
                      child: SvgPicture.asset(
                        ImagesConstants.navUser,
                      ),
                    ),
                    label: "",
                    activeIcon: Center(
                        child: Padding(
                      padding: getPadding(top: 10.0),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            color: const Color(0xFF386BF6),
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
              ],
            ));
      },
    ));
  }
}
