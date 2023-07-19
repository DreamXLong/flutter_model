/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2021-07-12 11:17:37
 * @LastEditors: TT
 * @LastEditTime: 2021-07-23 16:40:08
 */

import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static SharedPreferences? _spf;

  static Future<SharedPreferences?> init() async {
    _spf ??= await SharedPreferences.getInstance();
    return _spf;
  }

}
