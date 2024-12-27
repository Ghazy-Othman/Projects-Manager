//
//
//

import 'package:admin/controllers/login_page_controller.dart';
import 'package:get/get.dart';

class LoginScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(LoginPageController()) ;
  }
}