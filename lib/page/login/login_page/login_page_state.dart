import 'package:flutter/cupertino.dart';
import 'package:flutter_model/core/utils/utils.dart';

class LoginPageState {
  late String appName;
  late int loginMode; //0：账号密码登陆，1：验证码登陆
  late TextEditingController phoneController;
  late TextEditingController passwordWordController;

  LoginPageState() {
    ///Initialize variables
    appName = "";
    loginMode = 0;
    phoneController = TextEditingController();
    passwordWordController = TextEditingController();
  }
}
