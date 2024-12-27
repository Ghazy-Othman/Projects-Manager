//
//
//

import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/services/doctor/doctor_services.dart';

class DoctorNotificationScreenController extends GetxController{

  bool done = false ;
  List<Map<String , dynamic > > projectsRequests = [];

  @override
  void onInit() {
    getDoctorProjectsRequests() ;
    super.onInit();
  }

  //
  Future<void> getDoctorProjectsRequests() async {
    done = false ;
    update() ;
    projectsRequests = await DoctorServices.getProjectRequests((await PrefHelper.getDoctorInfo()).doctorId!) ;
    done = true ;
    update() ;
  }

}
