//
//
//
import 'package:admin/core/utils/pref_helper.dart';
import 'package:admin/data/models/admin.dart';
import 'package:get/get.dart';

class AdminProfilePageController extends GetxController {

  Admin? admin ;
  bool done = false ;

  @override
  void onInit() {
    _getCurrentAdmin() ;
    super.onInit();
  }

  void _getCurrentAdmin() async {
    admin = await PrefHelper.getAdminInfo() ;
    done = true ;
    update()  ;
  }



}