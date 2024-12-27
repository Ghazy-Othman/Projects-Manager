//
//
//
import 'package:projects_manager/constants/api_constants.dart';
import 'package:projects_manager/core/utils/dio_helper.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/doctor.dart';
import 'package:projects_manager/data/models/group.dart';

class DoctorServices {
  // Doctor login
  static Future<bool> login(Map<String, dynamic> data) async {
    var res = await DioHelper.post(data, ApiConstants.doctorLogin, "doctor");
    if (res["success"]) {
      PrefHelper.setToken(res["token"], "doctor");
      PrefHelper.setDoctorInfo(Doctor.fromJson(res["doctor"]));
      return true;
    } else {
      ///TODO : Handle failure of the request
    }
    return false;
  }

  // Request for an OTP code
  static Future<bool> forgetPassword(Map<String, dynamic> data) async {
    var res = await DioHelper.post(data, ApiConstants.forgetPassword, "doctor");
    if (res["success"]) {
      return true;
    }
    return false;
  }

  // Reset password and verify OTP code
  static Future<bool> resetPassword(Map<String, dynamic> data) async {
    var res = await DioHelper.post(data, ApiConstants.resetPassword, "doctor");
    if (res["success"]) {
      return true;
    }
    return false;
  }

  // Get doctors for student home screen
  static Future<List<Doctor>> getDoctors(int studentID) async {
    List<Doctor> doctors = [];
    var res = await DioHelper.get(ApiConstants.getAddDoctors, "student",
        params: {"student_id": studentID});
    if (res["data"] != null) {
      List<dynamic> arr = res["data"]["doctors"];
      for (int i = 0; i < arr.length; i++) {
        doctors.add(Doctor.fromJson(arr[i]));
      }
    }
    return doctors;
  }

  // Get doctor groups
  static Future<List<Group>> getGroups(int doctorId) async {
    List<Group> groups = [];
    String url = ApiConstants.doctorGroups + doctorId.toString();
    var res = await DioHelper.get(url, "doctor");
    print("++++++");
    print(res) ;
    if (res['success'] != null && res['success']) {
      List<dynamic> arr = res['groups']['groups'];
      for (int i = 0; i < arr.length; i++) {
        groups.add(Group.fromJson(arr[i]));
      }
    }

    return groups;
  }

  // Get doctor projects requests
  static Future<List<Map<String, dynamic>>> getProjectRequests(
      int doctorId) async {
    List<Map<String, dynamic>> projectRequest = [];
    String url = ApiConstants.getDoctorProjectsRequests + doctorId.toString();
    var res = await DioHelper.get(url, "doctor");
    if (res['success'] != null && res['success']) {
      List<dynamic> arr = res['project_requests'];
      for (int i = 0; i < arr.length; i++) {
        projectRequest.add(arr[i]);
      }
    }
    return projectRequest;
  }
}
