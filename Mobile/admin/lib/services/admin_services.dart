//
// All admin services functions
//

import 'package:admin/constants/api_constants.dart';
import 'package:admin/core/utils/dio_helper.dart';
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/data/models/admin.dart';
import 'package:admin/data/models/doctor.dart';

class AdminServices {
  // Admin register
  static Future<bool> register(Map<String, dynamic> data) async {
    try {
      var res = await DioHelper.post(data, ApiConstants.adminRegister);
      if (res["success"] == true) {
        PrefHelper.setToken(res["token"]);
        PrefHelper.setAdminInfo(Admin.fromJson(res["admin"]));
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  // Admin login
  static Future<bool> login(Map<String, dynamic> data) async {
    try {
      var res = await DioHelper.post(data, ApiConstants.adminLogin);
      if (res["success"]) {
        PrefHelper.setToken(res["token"]);
        PrefHelper.setAdminInfo(Admin.fromJson(res["admin"]));
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  ///TODO
  // Admin information
  static Future<Admin?> getAdminInfo() async {
    return null;
  }

  // Upload student's file
  static Future<bool> uploadFile(Map<String, dynamic> data) async {
    try {
      var res =
          await DioHelper.post(data, ApiConstants.uploadFile, needAuth: true);
      if (res["success"]) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  // Add new Doctor
  static Future<Doctor?> addDoctor(Map<String, dynamic> data) async {
    try {
      var res =
          await DioHelper.post(data, ApiConstants.addDoctor, needAuth: true);
      if (res["success"]) {
        return Doctor.fromJson(res["doctor"]);
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  // Update form rules
  static Future<bool> updateForm(Map<String, dynamic> data) async {
    try {
      var res =
          await DioHelper.post(data, ApiConstants.updateForm, needAuth: true);
      if (res["success"]) {
        Admin admin =await PrefHelper.getAdminInfo()  ;
        admin.mix  = res['form_rules']['mix'] ;
        admin.minNumber  = int.parse(res['form_rules']['min_number_of_students']) ;
        admin.maxNumber  = int.parse(res['form_rules']['max_number_of_students']) ;
        admin.maxDoctorGroups  = int.parse(res['form_rules']['max_doctor_groups']) ;
        await PrefHelper.setAdminInfo(admin) ;
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  // Get all doctors for a specific section
  static Future<List<Doctor>> getDoctors(Map<String, dynamic> data) async {
    List<Doctor> doctors = [];

    try {
      var res = await DioHelper.get(ApiConstants.getAllDoctors, params: data);
      List<dynamic> arr = res["data"]["doctors"];
      for (int i = 0; i < arr.length; i++) {
        doctors.add(Doctor.fromJson(arr[i]));
      }
    } catch (_) {
      return doctors;
    }

    return doctors;
  }

  // Request for an OTP code
  static Future<bool> forgetPassword(Map<String, dynamic> data) async {
    try {
      var res = await DioHelper.post(data, ApiConstants.forgetPassword);
      if (res["success"]) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  // Reset password and verify OTP code
  static Future<bool> resetPassword(Map<String, dynamic> data) async {
    try {
      var res = await DioHelper.post(data, ApiConstants.resetPassword);
      if (res["success"]) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  // Check if file uploaded
  static Future<bool> checkFile(String section) async {
    try {
      var res = await DioHelper.get(ApiConstants.checkFile + section);
      if (res['success']) {
        return res['count'] != 0;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  ///TODO : Add try catch
  static Future<void> getFormRules(String section) async {
    Map<String, dynamic> formRules = {};
    String url = ApiConstants.getFormRules + section;
    var res = await DioHelper.get(url);
    if (res['success'] != null && res['success']) {
      Admin admin =await PrefHelper.getAdminInfo()  ;
      admin.mix = res['mix'];
      admin.minNumber = res['min_number_of_students'];
      admin.maxNumber = res['max_number_of_students'];
    }
  }
}
