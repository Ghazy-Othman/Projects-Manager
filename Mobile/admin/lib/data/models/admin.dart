//
// Admin model
//
class Admin {
  int? adminId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? section;
  String? startDate;
  String? endDate;
  int? minNumber;
  int? maxNumber;
  int? maxDoctorGroups;
  bool? mix;

  Admin(
      {this.adminId,
      this.firstName,
      this.lastName,
      this.email,
      this.section,
      this.startDate,
      this.endDate,
      this.mix,
      this.minNumber,
      this.maxNumber,
      this.maxDoctorGroups});

  Admin.fromJson(Map<String, dynamic> json) {
    adminId = json["admin_id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    section = json["section"];
    mix = json["mix"];
    minNumber = json["min_number"];
    maxNumber = json["max_number"];
    maxDoctorGroups = json["max_doctor_groups"];
    startDate = json["start_date"];
    endDate = json["end_date"];
  }

  Map<String, dynamic> toJson() {
    final admin = <String, dynamic>{};

    if (adminId != null) {
      admin["admin_id"] = adminId;
    }
    if (firstName != null) {
      admin["first_name"] = firstName;
    }
    if (lastName != null) {
      admin["last_name"] = lastName;
    }
    if (email != null) {
      admin["email"] = email;
    }
    if (section != null) {
      admin["section"] = section;
    }
    if (minNumber != null) {
      admin["min_number"] = minNumber;
    }
    if (maxNumber != null) {
      admin["max_number"] = maxNumber;
    }
    if (mix != null) {
      admin["mix"] = mix;
    }
    if (maxDoctorGroups != null) {
      admin["max_doctor_groups"] = maxDoctorGroups;
    }
    if (startDate != null) {
      admin["start_date"] = startDate;
    }
    if (endDate != null) {
      admin["end_date"] = endDate;
    }
    return admin;
  }
}
