import 'package:flutter/material.dart';
import 'package:flutter_model/constrants/style_const.dart';
import 'package:flutter_model/generated/i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'login_page_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginPageLogic>();
    final state = Get
        .find<LoginPageLogic>()
        .state;

    return ConstrainedBox(
      constraints:
      BoxConstraints(maxHeight: MediaQuery
          .of(context)
          .size
          .height),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: GetBuilder<LoginPageLogic>(builder: (logic) {
            return Container(
              padding: EdgeInsets.only(left: 72.h, right: 72.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 72.h),
                      child: Text(
                        I18n.of(context)!.welcome(state.appName),
                        style: StyleConst.c585ffc_34Bold,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 72.h),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            logic.changeLoginMode(0);
                          },
                          child: Text('密码登陆',
                              style: state.loginMode == 0
                                  ? StyleConst.c3F454F_14Bold
                                  : StyleConst.cB0B9C3_14Bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 72.w),
                          child: GestureDetector(
                            onTap: () {
                              logic.changeLoginMode(1);
                            },
                            child: Text('验证码',
                                style: state.loginMode == 1
                                    ? StyleConst.c3F454F_14Bold
                                    : StyleConst.cB0B9C3_14Bold),
                          ),
                        ),
                      ],
                    ),

                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
