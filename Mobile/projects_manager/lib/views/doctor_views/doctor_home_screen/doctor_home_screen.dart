//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/doctor/doctor_home_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/doctor_views/doctor_home_screen/group_screen.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});

  final DoctorHomeScreenController controller =
      Get.put(DoctorHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorHomeScreenController>(
      builder: (controller) {
        if (!controller.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.groups.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.getDoctorGroups() ;
             },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQueryData.size.height,
                    width: mediaQueryData.size.width,
                    child: const Center(
                      child: Text("No projects yet"),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getDoctorGroups();
          },
          child: ListView.builder(
            itemCount: controller.groups.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => GroupScreen(group: controller.groups[index])) ;
                },
                child: Card(
                  color: Colors.lightBlue[50],
                  margin: getMargin(left: 20, right: 20, top: 20),
                  child: Padding(
                    padding: getPadding(all : 20.0),
                    child: Text(
                      controller.groups[index].project!.title!,
                      style: TextStyle(
                        fontSize: getFontSize(16.0) ,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
