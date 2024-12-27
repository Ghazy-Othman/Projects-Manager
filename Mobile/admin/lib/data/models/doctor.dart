//
// Doctor Model
//
import 'package:admin/data/models/group.dart';

class Doctor {
  String? firstName;
  String? lastName;
  String? email;
  String? section;
  int? maxNumberOfGroups ;
  List<Group> groups = [] ;

  Doctor({this.firstName, this.lastName, this.email, this.section});

  Doctor.fromJson(Map<String , dynamic> json) {
    firstName = json["first_name"] ;
    lastName = json["last_name"] ;
    email = json["email"] ;
    section = json["section"] ;
    maxNumberOfGroups = json["max_number_of_groups"] ;
    List<dynamic> arr = json["groups"]['groups'] ;
    for(int i = 0 ; i < arr.length ; i ++) {
      groups.add(Group.fromJson(arr[i])) ;
    }
  }

  Map<String, dynamic> toJson() {
    final doctor = <String, dynamic>{};
    if (firstName != null) {
      doctor["first_name"] = firstName;
    }
    if (lastName != null) {
      doctor["last_name"] = lastName;
    }
    if (email != null) {
      doctor["email"] = email;
    }
    if (section != null) {
      doctor["section"] = section;
    }

    return doctor;
  }
}
