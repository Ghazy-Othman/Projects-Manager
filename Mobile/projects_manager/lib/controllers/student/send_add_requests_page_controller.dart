//
//
//
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/student_group_screen_controller.dart';
import 'package:projects_manager/controllers/student/student_main_screen_controller.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/data/models/student.dart';
import 'package:projects_manager/services/add_requests/add_requests_services.dart';
import 'package:projects_manager/services/group/group_services.dart';

class SendAddRequestPageController extends GetxController {

  List<Student> students = [];
  bool done = false , formDone = false ;
  late Map<String , dynamic> formRules ;
  List<bool> checkedStudents = [];
  int cnt = 0 ;

  @override
  void onInit() {
    _getFormRules() ;
    getStudents();
    super.onInit();
  }


  Future<void> getStudents() async {
    students = await GroupServices.getStudentsForGrouping();
    done = true;
    for (int i = 0; i < students.length; i++) {
      checkedStudents.add(false);
      update();
    }
    update();
  }

  void updateCheckedStudent(int index , bool value) {
    if(value == true ) {
      cnt++;
      update();
    } else {
      cnt--;
      update();
    }
    checkedStudents[index] = value;
    update();
  }

  //
  Future<void> sendAddRequests() async {

    if(checkedStudents.contains(true) == false ) {
      Fluttertoast.showToast(msg:"You didn't choose any student "
          "\nPlease choose students and try again") ;
      return ;
    }


    List<Map<String, int>> arr = [] ;
    for(int i = 0 ; i < checkedStudents.length ; i++) {
      if(checkedStudents[i] == true) {
        arr.add({"receiver_student_id" : students[i].studentId!});
      }
    }

    Group group = Get.find<StudentGroupScreenController>().studentGroup ;

    Map<String, dynamic> data = {
      'group_id': group.groupId,
      'receiver_students': jsonEncode(arr)
    };
    ProgressDialogUtils.showProgressDialog();
    bool response = await AddRequestsServices.sendAddRequest(data);
    ProgressDialogUtils.hideProgressDialog();

    if (response) {
      Fluttertoast.showToast(msg: "Add requests send successfully") ;
      Get.back() ;
    } else {}
  }


  Future<void> _getFormRules() async {
    try {
      formRules = await GroupServices.getFormRules(Get.find<StudentMainScreenController>().currentStudent.section!);
      formDone = true ;
      update() ;
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: "Something went wrong") ;
      Get.back() ;
    }
  }


  void checkIfCanChooseStudent(int num) {
    if(num == formRules['max_number_of_students']) {
      Fluttertoast.showToast(msg: "You can not choose any students") ;
      Get.back();
    }
  }
}
