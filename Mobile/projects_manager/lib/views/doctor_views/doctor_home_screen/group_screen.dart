//
//
//

import 'package:flutter/material.dart';
import 'package:projects_manager/core/utils/size_utils.dart';
import 'package:projects_manager/data/models/group.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key, required this.group});

  final Group group;


  Widget _groupStudents() {
    List<Widget> students = [];
    for (int i = 0; i < group.students.length; i++) {
      students.add(Padding(
        padding: getPadding(all: 5.0),
        child: Text("${group.students[i].firstName} "
            "${group.students[i].lastName} "),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: students,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: Text(
                "Title : ",
                style: TextStyle(
                    fontSize: getFontSize(20.0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: getPadding(
                  left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
              child: Text(group.project!.title!),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: Text(
                "About : ",
                style: TextStyle(
                    fontSize: getFontSize(20.0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: getPadding(
                  left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
              child: Text(group.project!.about!),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: Text(
                "Group ID : ",
                style: TextStyle(
                    fontSize: getFontSize(20.0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: getPadding(
                  left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
              child: Text(group.groupId.toString()),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: Text(
                "Group Students : ",
                style: TextStyle(
                    fontSize: getFontSize(20.0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: getPadding(left: 25.0, right: 25.0),
              child: _groupStudents(),
            ),
            SizedBox(
              height: getVerticalSize(50.0),
            ),
          ],
        ),
      )
    );
  }
}
