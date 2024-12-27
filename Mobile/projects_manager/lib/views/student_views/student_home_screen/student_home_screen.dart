//
// Student home screen
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_manager/constants/images_constants.dart';
import 'package:projects_manager/controllers/student/student_home_screen_controller.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/data/models/doctor.dart';

class StudentHomeScreen extends StatelessWidget {
  StudentHomeScreen({super.key});

  final StudentHomeScreenController controller =
      Get.put(StudentHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentHomeScreenController>(builder: (controller) {
      if (!controller.done) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (controller.doctors.isEmpty) {
        return const Center(
          child: Text("No doctors "),
        );
      }
      return RefreshIndicator(
        onRefresh: () async {
          await controller.getAllDoctors();
        },
        child: ListView.builder(
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            return CustomListTile(
              doctor: controller.doctors[index],
              controller: controller,
            );
          },
        ),
      );
    });
  }
}

class CustomListTile extends StatelessWidget {
  final Doctor doctor;
  final StudentHomeScreenController controller;
  @override
  const CustomListTile(
      {super.key, required this.doctor, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightBlue[50],
        margin: getMargin(left: 20, right: 20, top: 20),
        child: ListTile(
          onTap: () {
            controller.goToProjectRequestScreen(doctor);
          },
          contentPadding: const EdgeInsets.all(20.0),
          leading: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.indigoAccent,
            child: Image.asset(ImagesConstants.profileLogo),
          ),
          title: Text('${doctor.firstName} ${doctor.lastName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: getFontSize(18.0),
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${doctor.section}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: getFontSize(16.0), color: Colors.black)),
              Text(
                  '${doctor.doctorGroups?.length ?? 0} / ${doctor.maxNumberOfGroups}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: getFontSize(16.0), color: Colors.black)),
            ],
          ),
          // isThreeLine: true,
        ));
  }
}
