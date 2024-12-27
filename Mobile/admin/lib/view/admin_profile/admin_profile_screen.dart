//
//
//
import 'package:admin/controllers/admin_profile_controller.dart';
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:admin/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfileScreen extends StatelessWidget {
  AdminProfileScreen({super.key});

  final AdminProfilePageController controller =
      Get.put(AdminProfilePageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminProfilePageController>(builder: (controller) {
      if (controller.done == true) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: getPadding(all: 25.0),
                      child: Text(
                        "${controller.admin!.firstName} ${controller.admin!.lastName}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: getFontSize(32.0),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0C49CD),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 20, right: 20.0),
                    child: IconButton(
                        onPressed: () {
                          PrefHelper.clearData();
                          Get.offAll(() => const LoginScreen());
                        },
                        icon: const Icon(Icons.login_outlined)),
                  )
                ],
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Admin ID : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.admin!.adminId.toString()),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "First name : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.admin!.firstName!),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Last name : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.admin!.lastName!),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Email : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.admin!.email!),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding: getPadding(
                    left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Section : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(controller.admin!.section!),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
            ],
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
