//
//
//

import 'package:projects_manager/constants/api_constants.dart';
import 'package:projects_manager/core/utils/dio_helper.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/data/models/student.dart';

class GroupServices {

  //
  static Future<Group> getGroupInfo(int groupId) async {

    String url = ApiConstants.groupInfo + groupId.toString();
    var res = await DioHelper.get(url , "student") ;
    Group group = Group() ;
    if(res['group'] != null) {
      group = Group.fromJson(res['group']);
    }
    return group ;
  }


  //
  static Future<List<Student>> getStudentsForGrouping () async {

    List<Student> students = [] ;
    var res = await DioHelper.get(ApiConstants.allStudents, "student" , params:{
      'student_id' : (await PrefHelper.getStudentInfo()).studentId
    } ) ;
    if(res['success'] != null && res['success']) {
      List<dynamic> arr = res['students'] ;
      for(int i = 0 ; i < arr.length ; i++){
        students.add(Student.fromJson(arr[i])) ;
      }
    }

    return students ;

  }

  // Create new group
  static Future<bool> createGroup() async {
    var res = await DioHelper.post({}, ApiConstants.createGroup, "student", needAuth: true) ;
    if(res['success'] != null &&  res["success"]) {
      Group group = Group.fromJson(res['group']) ;
      Student student = await PrefHelper.getStudentInfo() ;
      student.groupId = group.groupId ;
      await PrefHelper.setStudentInfo(student) ;
      return true ;
    }
    else {}
    return false ;
  }

  //
  static Future<Map<String , dynamic> > getFormRules(String section) async {
    Map<String , dynamic> formRules = {} ;
    String url = ApiConstants.getFormRules + section ;
    var res = await DioHelper.get(url, "student") ;
    if(res['success'] != null && res['success']) {
      formRules['mix'] = res['mix'] ;
      formRules['min_number_of_student'] = res['min_number_of_student'] ;
      formRules['max_number_of_student'] = res['max_number_of_student'] ;
    }
    return formRules;
  }

}