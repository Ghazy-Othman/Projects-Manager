//
// Student model
//
class Student {
  int? studentId;
  String? nationalId;
  String? universityId;
  String? firstName;
  String? midName;
  String? lastName;
  String? email;
  String? password;
  String? section;
  int? yearOfStudy;
  int? groupId;

  Student(
      {this.studentId,
      this.nationalId,
      this.universityId,
      this.firstName,
      this.midName,
      this.lastName,
      this.email,
      this.password,
      this.section,
      this.yearOfStudy,
      this.groupId});

  Student.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    nationalId = json['ssn'];
    universityId = json['university_id'];
    firstName = json['first_name'];
    midName = json['mid_name'];
    lastName = json['last_name'];
    email = json["email"];
    section = json["section"];
    yearOfStudy = json["year_of_study"];
    groupId = json["group_id"];
  }

  Map<String, dynamic> toJson() {
    final student = <String, dynamic>{};
    if (studentId != null) {
      student["student_id"] = studentId;
    }
    if (nationalId != null) {
      student["ssn"] = nationalId;
    }
    if (universityId != null) {
      student["university_id"] = universityId;
    }
    if (firstName != null) {
      student["first_name"] = firstName;
    }
    if (midName != null) {
      student["mid_name"] = midName;
    }
    if (lastName != null) {
      student["last_name"] = lastName;
    }
    if (email != null) {
      student["email"] = email;
    }
    if (section != null) {
      student["section"] = section;
    }
    if (yearOfStudy != null) {
      student["year_of_study"] = yearOfStudy;
    }
    if (groupId != null) {
      student["group_id"] = groupId;
    }
    return student;
  }
}
