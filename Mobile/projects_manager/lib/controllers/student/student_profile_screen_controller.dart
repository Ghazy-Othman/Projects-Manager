//
//
//

import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/student.dart';

class StudentProfileScreenController extends GetxController {
  Student? student;
  bool done = false;

  @override
  void onInit() {
    _getStudentInfo();
    super.onInit();
  }

  void _getStudentInfo() async {
    student = await PrefHelper.getStudentInfo();
    done = true;
    update();
  }
}
