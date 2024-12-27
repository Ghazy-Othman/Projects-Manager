//
//
//
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/core/utils/progress_dialog_utils.dart';
import 'package:projects_manager/data/models/doctor.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/data/models/student.dart';
import 'package:projects_manager/services/doctor/doctor_services.dart';
import 'package:projects_manager/services/group/group_services.dart';
import 'package:projects_manager/views/student_views/project_request_screen/project_request_screen.dart';

class StudentHomeScreenController extends GetxController {
  bool done = false; // True : When get all doctors
  List<Doctor> doctors = []; // List of doctors to show

  // Get all doctors when page is creating
  @override
  void onInit() {
    getAllDoctors();
    super.onInit();
  }

  // Get all doctors on student home screen
  // If admin mix value is true , then doctors will be from both software and network sections .
  // else , doctors will be from student section
  Future<void> getAllDoctors() async {
    done = false;
    update();
    Student student = await PrefHelper.getStudentInfo();
    doctors = await DoctorServices.getDoctors(student.studentId!);
    done = true;
    update();
  }

  // Go to project request screen if you are admin of a group
  Future<void> goToProjectRequestScreen(Doctor doctor) async {
    Student currentStudent = await PrefHelper.getStudentInfo();
    // If student doesn't have a group , then this action can't be done
    if (currentStudent.groupId == null) {
      Fluttertoast.showToast(msg: "Join group first to make this action !!");
      return;
    }

    try {
      ProgressDialogUtils.showProgressDialog();
      Group group = await GroupServices.getGroupInfo(currentStudent.groupId!);
      ProgressDialogUtils.hideProgressDialog();
      // If student have a project , he can't do this action
      if (group.project != null) {
        Fluttertoast.showToast(msg: "You already have a project");
        return;
      }
      // If the student is an admin for a group , then go to project request screen
      // Else , this action can't be done
      else if (group.adminStudentId == currentStudent.studentId) {
        Get.to(() => ProjectRequestScreen(
            doctorId: doctor.doctorId!, groupId: group.groupId!));
      } else {
        Fluttertoast.showToast(
            msg: "You can not do this action!!\n"
                "You have to be a group admin");
      }
    } on Exception catch (_) {
      // In case error with backend (Server error)
      Fluttertoast.showToast(msg: "Something went wrong!!\n Try again");
      return;
    }
  }
}
