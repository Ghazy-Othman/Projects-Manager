//
// Shared Preferences Helper
//
import 'dart:async';
import 'dart:convert';
import 'package:projects_manager/data/models/doctor.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/data/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static SharedPreferences? sharedPreferences;

  PrefHelper() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  // Set token value
  static Future<void> setToken(String token, String user) async {
    try {
      ///TODO : Handle case of failure
      sharedPreferences!.setString(
          user == "doctor" ? "doctor_token" : "student_token", token);
    } catch (e) {
      // print("---------------------------");
      // print(e.toString());
      // print("---------------------------");
    }
  }

  // Get token value
  static String getToken(String user) {
    try {
      return sharedPreferences!
              .getString(user == "doctor" ? "doctor_token" : "student_token") ??
          "";
    } catch (e) {
      return "";
    }
  }

  // Save doctor info
  static Future<void> setDoctorInfo(Doctor doctor) async {
    sharedPreferences!.setString('doctor', jsonEncode(doctor));
  }

  // Get doctor info
  static Future<Doctor> getDoctorInfo() async {
    String info = sharedPreferences!.getString("doctor") ?? "";
    return Doctor.fromJson(jsonDecode(info));
  }

  // Save student info
  static Future<void> setStudentInfo(Student student) async {
    sharedPreferences!.setString("student", jsonEncode(student));
  }

  // Get student info
  static Future<Student> getStudentInfo() async {
    String info = sharedPreferences!.getString("student") ?? "";
    return Student.fromJson(jsonDecode(info));
  }

  ///TODO : Delete these functions
  // Set group info
  static Future<void> setGroupInfo(Group group) async {
    sharedPreferences!.setString("group", jsonEncode(group));
  }

  // Get group info
  static Future<Group> getGroupInfo() async {
    String info = sharedPreferences!.getString("group") ?? "";
    return Group.fromJson(jsonDecode(info));
  }

  // Clear all data
  static Future<void> clearData() async {
    sharedPreferences!.clear();
  }
}
