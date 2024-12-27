//
//
//
import 'package:projects_manager/data/models/project.dart';
import 'package:projects_manager/data/models/student.dart';

class Group {
  int? groupId;
  int? doctorId;
  int? adminStudentId;
  Project? project;
  List<Student> students  = [];

  Group({this.groupId, this.doctorId, this.adminStudentId, this.project});

  Group.fromJson(Map<String, dynamic> json) {
    groupId = json["group_id"];
    doctorId = json["doctor_id"];
    adminStudentId = json["admin_student_id"];
    project = json["project"] != null ?  Project.fromJson(json["project"]) : null;
    List<dynamic> arr = json["students"] ;
    for(int i = 0 ; i < arr.length ; i++) {
      students.add(Student.fromJson(arr[i])) ;
    }
  }

  Map<String, dynamic> toJson() {
    final group = <String, dynamic>{};
    if (groupId != null) {
      group["group_id"] = groupId;
    }
    if (doctorId != null) {
      group["doctor_id"] = doctorId;
    }
    if (adminStudentId != null) {
      group["admin_student_id"] = adminStudentId;
    }

    return group;
  }
}
