//
// This file manages API requests and response via DIO package
//

import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/core/utils/progress_dialog_utils.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioHelper {
  static late Dio dio;

  DioHelper() {
    dio = Dio();
  }

  // GET
  static Future get(String url , {Map<String , dynamic>? data , bool needAuth = false ,Map<String , dynamic>? params } ) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      if(needAuth){
        headers.addAll({"Authorization": "Bearer ${PrefHelper.getToken()}"});
      }
      ProgressDialogUtils.showProgressDialog();
      final response = await dio.get(url ,
          data: data,
          queryParameters: params,
          options: Options(
        headers: headers
      ));
      ProgressDialogUtils.hideProgressDialog();
      return response.data;
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
      Fluttertoast.showToast(msg: "Something went wrong !! \n"
          "Please try again .") ;
    }
  }

  // POST
  static Future post(Map<String, dynamic> data, String url,
      {bool needAuth = false}) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      if(needAuth){
        headers.addAll({"Authorization": "Bearer ${PrefHelper.getToken()}"});
      }
      ProgressDialogUtils.showProgressDialog();
      final response = await dio.post(url,
          data: FormData.fromMap(data), options: Options(headers: headers));
      ProgressDialogUtils.hideProgressDialog();
      return response.data;
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
      print("-------------------");
      print(e.toString()) ;
      print("-------------------");
      Fluttertoast.showToast(msg: "Something went wrong !! \n"
          "Please try again .") ;
    }

  }
}
