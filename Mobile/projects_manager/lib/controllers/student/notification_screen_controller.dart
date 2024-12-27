//
//
//

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/student_main_screen_controller.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/data/models/add_request.dart';
import 'package:projects_manager/data/models/student.dart';
import 'package:projects_manager/services/add_requests/add_requests_services.dart';

class NotificationScreenController extends GetxController {
  bool done = false;
  List<AddRequest> addRes = [];

  @override
  void onInit() {
    getAddRequests();
    super.onInit();
  }

  //
  Future<void> getAddRequests() async {
    try {
      addRes = await AddRequestsServices.getAllAddRequests(
          Get.find<StudentMainScreenController>().currentStudent.studentId!);
      done = true;
      update();
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: "Something went wrong");
      Get.back();
    }
  }

  //
  Future<void> updateAddRequestStatus(int index, int newStatus) async {
    Map<String, dynamic> data = {
      'add_request_id': addRes[index].addRequestID,
      'new_status': newStatus
    };

    ProgressDialogUtils.showProgressDialog();
    bool res = await AddRequestsServices.updateAddRequest(data);
    ProgressDialogUtils.hideProgressDialog();
    if (res) {
      done = false;
      update();
      getAddRequests();
      if (newStatus == 1) {
        Student student =
            Get.find<StudentMainScreenController>().currentStudent;
        student.groupId = addRes[index].groupID;
        PrefHelper.setStudentInfo(student);
        Get.find<StudentMainScreenController>().updateCurrentStudent();
      }
    }
  }
}
