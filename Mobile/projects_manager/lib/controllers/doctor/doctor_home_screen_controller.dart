//
//
//

import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/group.dart';
import 'package:projects_manager/services/doctor/doctor_services.dart';

class DoctorHomeScreenController extends GetxController {
  List<Group> groups = [];
  bool done = false;

  @override
  void onInit() {
    getDoctorGroups();
    super.onInit();
  }


  // Get all projects for the current doctor
  Future<void> getDoctorGroups() async {
    done = false;
    update();
    groups = await DoctorServices.getGroups(
        (await PrefHelper.getDoctorInfo()).doctorId!);
    done = true;
    update();
  }

}
