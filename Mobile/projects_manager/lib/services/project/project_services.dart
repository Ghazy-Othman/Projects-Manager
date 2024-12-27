//
//
//
import 'package:projects_manager/constants/api_constants.dart';
import 'package:projects_manager/core/utils/dio_helper.dart';

class ProjectServices {

  static Future<bool> sendProjectRequest(Map<String , dynamic> data) async  {
    var res = await DioHelper.post(data, ApiConstants.sendProjectRequest, "student" , needAuth: true) ;
    if(res["success"]) {
      return true;
    }
    else {}
    return false ;
  }

  //
  static Future<bool> updateProjectRequest(Map<String , dynamic> data) async {
    var res = await DioHelper.post(data, ApiConstants.updateProjectRequest, "doctor" , needAuth: true ) ;
    if(res['success']) {
      return true ;
    }
    else {}
    return false ;
  }
}