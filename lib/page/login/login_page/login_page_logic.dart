import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_model/core/utils/utils.dart';
import 'package:flutter_model/page/login/login_page/login_page_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'login_page_state.dart';

class LoginPageLogic extends GetxController {
  final LoginPageState state = LoginPageState();

  @override
  void onReady() {
    // TODO: implement onReady
    getAppName();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loginWithPwd(String userName, String password, String deviceId) async {
    EasyLoading.show();
    var response =
        await LoginPageModel.loginWithPassword(userName, password, deviceId);
    EasyLoading.dismiss();
    if (response.ok) {
      Logger().i("密码登陆成功");
    } else {
      Logger().i("密码登陆失败,${response.error}");
    }
  }

  void changeLoginMode (int mode){
    state.loginMode = mode;
    update();
  }

  void getAppName() async {
    state.appName = await Utils.getAppName();
    update();
  }
}
