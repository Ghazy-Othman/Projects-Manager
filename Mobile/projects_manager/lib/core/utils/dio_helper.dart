//
// This file manages API requests and response via DIO package
//

import 'package:dio/dio.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';

class DioHelper {
  static late Dio dio;

  DioHelper() {
    dio = Dio();
  }

  // GET
  static Future get(String url ,String user ,  {bool needAuth = false , Map<String , dynamic>? params } ) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      if(needAuth){
        headers.addAll({"Authorization": "Bearer ${PrefHelper.getToken(user)}"});
      }
      final response = await dio.get(url ,
          queryParameters: params,
          options: Options(
        headers: headers
      ));
      return response.data;
    } catch (e) {
      print("++++++++++++++++++++");
      print(e.toString());
      print("++++++++++++++++++++");
    }
  }

  // POST
  static Future post(Map<String, dynamic> data, String url,String user ,
      {bool needAuth = false}) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      if(needAuth){
        headers.addAll({"Authorization": "Bearer ${PrefHelper.getToken(user)}"});
      }
      final response = await dio.post(url,
          data: FormData.fromMap(data), options: Options(headers: headers));
      return response.data;
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString()) ;
      print("****************************");
      print(e.toString());
      print("****************************");
    }
  }
}
