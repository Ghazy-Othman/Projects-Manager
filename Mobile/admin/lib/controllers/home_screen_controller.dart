//
//
//
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/data/models/doctor.dart';
import 'package:admin/services/admin_services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  List<Doctor> doctors = [] ;
  bool done = false ;

  @override
  void onInit() {
    getDoctors() ;
    super.onInit() ;
  }

  //
  Future<void> getDoctors() async {
    done = false ;
    update() ;
    Map<String ,dynamic> data = {
      'section' : (await PrefHelper.getAdminInfo()).section
    } ;
    doctors = await AdminServices.getDoctors(data) ;
    done = true ;
    update() ;
  }

  //
  void addDoctorToList(Doctor newDoctor) {
    doctors.add(newDoctor);
    update() ;
  }
}



