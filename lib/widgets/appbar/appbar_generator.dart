/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2021-06-30 15:50:54
 * @LastEditors: TT
 * @LastEditTime: 2021-07-29 22:05:19
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarGenerator {
  static AppBar getDefault(
      {required String title,
      PreferredSizeWidget? bottom,
      Color? textColor,
      Color? leadingIconColor,
      Color backgroundColor = Colors.white,
      bool haveLeading = true,
      Function()? leadingCallback}) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: !haveLeading
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: leadingIconColor ?? Color(0xff292733),
              ),
              onPressed: leadingCallback ?? () => Get.back(),
            ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 17.w,
            color: textColor ?? Color(0xff222222),
            fontWeight: FontWeight.w500),
      ),
      elevation: 0,
      bottom: bottom,
    );
  }

  static AppBar getNoramlAppBar(
      {required BuildContext context,
      required String title,
      Widget? titleW,
      bool showBack = false,
      PreferredSizeWidget? bottom,
      Color? textColor,
      Color? leadingIconColor,
      Color backgroundColor = Colors.white,
      Function()? leadingCallback}) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    showBack = parentRoute?.canPop ?? false;

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: showBack
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: leadingIconColor ?? Color(0xff292733),
              ),
              onPressed: leadingCallback ?? () => Get.back(),
            )
          : null,
      title: titleW == null
          ? Text(
              title,
              style: TextStyle(
                  fontSize: 18, color: textColor ?? Color(0xff222222)),
            )
          : titleW,
      elevation: 0,
      bottom: bottom,
      automaticallyImplyLeading: showBack,
    );
  }

  static bool isfirstPage(BuildContext context) {
    bool showback;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    showback = parentRoute?.canPop ?? false;
    return !showback;
  }
}
