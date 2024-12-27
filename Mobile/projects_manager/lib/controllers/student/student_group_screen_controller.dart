//
//
//
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/controllers/student/student_main_screen_controller.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/services/group/group_services.dart';

class StudentGroupScreenController extends GetxController {
  bool hasGroup = false;
  bool isAdmin = false;
  bool done = false;
  late Group studentGroup;

  @override
  void onInit() {
    hasGroup = _checkIfHasGroup();
    done = false;
    if (hasGroup) getStudentGroupInfo();
    super.onInit();
  }

  //
  Future<void> getStudentGroupInfo() async {
    done = false ;
    hasGroup = _checkIfHasGroup() ;
    update() ;
    studentGroup = await GroupServices.getGroupInfo(_getGroupId());
    done = true;
    isAdmin = _checkIfAdmin();
    update();
  }

  // Create new group
  Future<void> createNewGroup() async {
    ProgressDialogUtils.showProgressDialog();
    bool res = await GroupServices.createGroup();
    ProgressDialogUtils.hideProgressDialog();

    if (res) {
      hasGroup = true;
      await Get.find<StudentMainScreenController>().updateCurrentStudent();
      getStudentGroupInfo();
      update();
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  // Check if current student has a group
  bool _checkIfHasGroup() {
    return Get.find<StudentMainScreenController>().currentStudent.groupId ==
            null
        ? false
        : true;
  }

  bool _checkIfAdmin() {
    return studentGroup.adminStudentId ==
        Get.find<StudentMainScreenController>().currentStudent.studentId!;
  }

  //
  int _getGroupId() {
    return Get.find<StudentMainScreenController>().currentStudent.groupId!;
  }
}
