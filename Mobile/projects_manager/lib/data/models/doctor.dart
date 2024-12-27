//
// Doctor Model
//
import 'package:projects_manager/data/models/group.dart';

class Doctor {
  int? doctorId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? section;
  int? maxNumberOfGroups;
  String? status;
  List<Group> doctorGroups = [];

  Doctor(
      {this.doctorId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.section,
      this.maxNumberOfGroups,
      this.status,
      });

  Doctor.fromJson(Map<String, dynamic> json) {
    doctorId = json["doctor_id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    section = json["section"];
    maxNumberOfGroups = json["max_number_of_groups"];
    status = json["status"];
    if(json["groups"] != null ){
      if (json['groups']['groups'] != null) {
        List<dynamic> arr = json["groups"]["groups"];
        for (int i = 0; i < arr.length; i++) {
          doctorGroups.add(Group.fromJson(arr[i]));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final doctor = <String, dynamic>{};
    if (doctorId != null) {
      doctor["doctor_id"] = doctorId;
    }
    if (firstName != null) {
      doctor["first_name"] = firstName;
    }
    if (lastName != null) {
      doctor["last_name"] = lastName;
    }
    if (email != null) {
      doctor["email"] = email;
    }
    if (password != null) {
      doctor["password"] = password;
    }
    if (section != null) {
      doctor["section"] = section;
    }
    if (maxNumberOfGroups != null) {
      doctor["max_number_of_groups"] = maxNumberOfGroups;
    }
    if (status != null) {
      doctor["status"] = status;
    }
    return doctor;
  }
}
