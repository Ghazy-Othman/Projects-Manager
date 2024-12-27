//
// Shared Preferences Helper
//
import 'dart:async';
import 'dart:convert';
import 'package:admin/data/models/admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static SharedPreferences? sharedPreferences;

  PrefHelper(){
    SharedPreferences.getInstance().then((value) => sharedPreferences = value) ;
  }

  // Set token value
  static Future<void> setToken(String token) async {
    try {
      ///TODO : Handle case of failure
      sharedPreferences!.setString("token", token);
    } catch (e) {
      // print("---------------------------");
      // print(e.toString());
      // print("---------------------------");
    }
  }

  // Get token value
  static String getToken() {
    try {
      return sharedPreferences!.getString("token") ?? "";
    } catch (e) {
      return "";
    }
  }

  // Set Admin info
  static Future<void> setAdminInfo(Admin admin) async{
    sharedPreferences!.setString("admin", jsonEncode(admin)) ;
  }

  static Future<Admin> getAdminInfo() async {
    String info = sharedPreferences!.getString("admin") ?? "" ;
    return Admin.fromJson(jsonDecode(info)) ;
  }

  // Clear all data
  static Future<void> clearData() async {
    sharedPreferences!.clear();
  }

}
