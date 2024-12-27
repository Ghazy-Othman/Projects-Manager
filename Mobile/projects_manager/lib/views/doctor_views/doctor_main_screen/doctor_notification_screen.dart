//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/doctor/doctor_notification_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/views/doctor_views/doctor_main_screen/doctor_project_request_screen.dart';

class DoctorNotificationScreen extends StatelessWidget {
  DoctorNotificationScreen({super.key});

  final DoctorNotificationScreenController controller =
      Get.put(DoctorNotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<DoctorNotificationScreenController>(
        builder: (controller) {
          if (!controller.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.projectsRequests.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                await controller.getDoctorProjectsRequests();
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
              await controller.getDoctorProjectsRequests();
            },
            child: ListView.builder(
              itemCount: controller.projectsRequests.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: getPadding(all: 20.0),
                  child: SizedBox(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => DoctorProjectRequestScreen(
                            projectRequestId: controller.projectsRequests[index]
                                ["project_request_id"],
                            title: controller.projectsRequests[index]
                                ["project_title"],
                            about: controller.projectsRequests[index]
                                ["project_about"],
                            groupId: controller.projectsRequests[index]
                                ["group_id"]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(all: 10.0),
                              child: Text(
                                controller.projectsRequests[index]
                                    ['project_title'],
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: getFontSize(20.0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
