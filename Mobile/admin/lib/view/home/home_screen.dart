//
//
//
import 'package:admin/constants/images_constants.dart';
import 'package:admin/controllers/home_screen_controller.dart';
import 'package:admin/core/utils/size_utils.dart';
import 'package:admin/data/models/doctor.dart';
import 'package:admin/view/doctor_profile/doctor_profiles_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      if (controller.done) {
        if (controller.doctors.isEmpty) {

          return RefreshIndicator(
            onRefresh: () async{
              await controller.getDoctors() ;
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQueryData.size.height ,
                    width: mediaQueryData.size.width,
                    child: Center(
                      child: Text("No doctors yet!", style: TextStyle(
                        fontWeight: FontWeight.bold ,
                        fontSize: getFontSize(20.0)
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            controller.getDoctors() ;
          },
          child: ListView.builder(
            itemCount: controller.doctors.length,
            padding: getPadding(top: 20),
            itemBuilder: (context, index) {
              return Center(
                  child: CustomListTile(doctor: controller.doctors[index],)
              );
            },
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class CustomListTile extends StatelessWidget {

  final Doctor doctor ;

  @override
  const CustomListTile({super.key, required this.doctor});


  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightBlue[50],
        margin: getMargin(left: 20, right: 20, top: 20),
        child: ListTile(
          onTap: () {
            Get.to(() =>  DoctorProfileScreen(doctor: doctor,)) ;
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
              Text('${doctor.groups.length} / ${doctor.maxNumberOfGroups}',
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
