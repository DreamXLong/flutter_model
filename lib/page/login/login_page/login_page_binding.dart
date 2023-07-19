import 'package:get/get.dart';

import 'login_page_logic.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageLogic());
  }
}
