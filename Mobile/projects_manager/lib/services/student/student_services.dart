//
//
//
import 'package:projects_manager/constants/api_constants.dart';
import 'package:projects_manager/core/utils/dio_helper.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/student.dart';

class StudentServices {

  // Student validation
  static Future<int> studentVerification(Map<String, dynamic> data) async {
    var res =
        await DioHelper.post(data, ApiConstants.studentVerification, "student");
    if (res['success']) {
      return res['student_id'];
    } else {
      ///TODO : Handle failure of request
    }
    return 0;
  }

  // Student register
  static Future<bool> register(Map<String, dynamic> data) async {
    var res =
        await DioHelper.post(data, ApiConstants.studentRegister, "student");
    if (res["success"]) {
      Student student = Student.fromJson(res["student"]);
      PrefHelper.setStudentInfo(student);
      PrefHelper.setToken(res["token"], "student");
      return true;
    } else {}
    return false;
  }

  // Student login
  static Future<bool> login(Map<String, dynamic> data) async {
    var res = await DioHelper.post(data, ApiConstants.studentLogin, "student");
    if (res['success']) {
      Student student = Student.fromJson(res["student"]);
      PrefHelper.setStudentInfo(student);
      PrefHelper.setToken(res["token"], "student");
      return true;
    } else {}
    return false;
  }
}
