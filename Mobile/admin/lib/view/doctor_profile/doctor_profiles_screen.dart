//
//
//
import 'package:admin/core/utils/size_utils.dart';
import 'package:admin/data/models/doctor.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key, required this.doctor});

  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "${doctor.firstName} ${doctor.lastName}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: getFontSize(32.0),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0C49CD),
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    getPadding(left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Email : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(doctor.email!),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding:
                    getPadding(left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Max number of groups : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(doctor.maxNumberOfGroups!.toString()),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding:
                    getPadding(left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Section : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: getPadding(left: 25.0, right: 25.0),
                child: Text(doctor.section!),
              ),
              SizedBox(
                height: getVerticalSize(10.0),
              ),
              Padding(
                padding:
                getPadding(left: 25.0, right: 25.0, bottom: 10.0, top: 25.0),
                child: Text(
                  "Groups : ",
                  style: TextStyle(
                      fontSize: getFontSize(20.0), fontWeight: FontWeight.bold),
                ),
              ),
              if(doctor.groups.isEmpty) const Expanded(child: Center(child: Text("No groups"),)) ,
              if(doctor.groups.isNotEmpty ) Expanded(child:
              ListView.builder(
                itemCount: doctor.groups.length,
                itemBuilder: (context, index) {
                  return Center(child: Text(doctor.groups[index].doctorId.toString())) ;
                },))
            ],
          )),
    );
  }
}
