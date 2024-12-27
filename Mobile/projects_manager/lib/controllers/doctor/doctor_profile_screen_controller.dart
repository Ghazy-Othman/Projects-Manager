//
//
//




import 'package:get/get.dart';
import 'package:projects_manager/core/utils/pref_helper.dart';
import 'package:projects_manager/data/models/doctor.dart';

class DoctorProfileScreenController extends GetxController {

  Doctor? doctor ;
  bool done = false ;
  @override
  void onInit() {
    _getDoctorInfo() ;
    super.onInit();
  }


  Future<void> _getDoctorInfo() async {
    doctor = await PrefHelper.getDoctorInfo() ;
    done = true ;
    update() ;
  }
}