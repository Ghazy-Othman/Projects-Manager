//
//
//

import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/services/group/group_services.dart';
import 'package:projects_manager/services/project/project_services.dart';

class DoctorProjectRequestScreenController extends GetxController {
  bool done = false;
  int? groupId;
  Group? group;

  //
  Future<void> getGroupInfo() async {
    done = false;
    update();
    group = await GroupServices.getGroupInfo(groupId!);
    done = true;
    update();
  }


  //
  Future<void> updateProjectRequest(int projectReqId, int newStatus) async {
    Map<String, dynamic> data = {
      'project_request_id': projectReqId,
      'new_status': newStatus
    };
    ProgressDialogUtils.showProgressDialog();
    bool res = await ProjectServices.updateProjectRequest(data);
    ProgressDialogUtils.hideProgressDialog();
    if (res) {

      Fluttertoast.showToast(msg: "Project request updated successfully");
      Get.back();
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
      Get.back();
    }
  }
}
