//
//
//
import 'package:projects_manager/constants/api_constants.dart';
import 'package:projects_manager/core/utils/dio_helper.dart';
import 'package:projects_manager/data/models/add_request.dart';

class AddRequestsServices {
  //
  static Future<bool> sendAddRequest(Map<String, dynamic> data) async {
    var res = await DioHelper.post(data, ApiConstants.sendAddRequest, "student",
        needAuth: true);
    if (res["success"]) {
      return true;
    } else {}
    return false;
  }

  //
  static Future<bool> updateAddRequest(Map<String, dynamic> data) async {
    var res = await DioHelper.post(
        data, ApiConstants.updateAddRequest, "student",
        needAuth: true);
    if (res["success"]) {
      return true;
    } else {}
    return false;
  }

  static Future<List<AddRequest>> getAllAddRequests(int studentID) async {
    List<AddRequest> addRequest = [];
    String url = ApiConstants.getAddRequests + studentID.toString();
    var res = await DioHelper.get(url, "student");
    if (res['success'] != null && res['success']) {
      List<dynamic> arr = res['re_add_requests']['add_requests'];
      for (int i = 0; i < arr.length; i++) {
        AddRequest addRequest0  = AddRequest.fromJson(arr[i]) ;
        if(addRequest0.status == 2 )
        {
          addRequest.add(addRequest0);
        }
      }
    }
    return addRequest;
  }
}
