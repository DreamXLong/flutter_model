/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2021-06-25 09:30:03
 * @LastEditors: TT
 * @LastEditTime: 2021-07-30 10:11:40
 */
import 'package:bot_toast/bot_toast.dart';
import 'package:date_format/date_format.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'toast.dart';

///常用工具类
class Utils {
  Utils._internal();

  //=============url_launcher==================//

  ///处理链接
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      BotToast.showText(text: "暂不能处理这条链接:$url");
    }
  }

  //=============package_info==================//

  ///获取应用包信息
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  ///获取应用包信息
  static Future<Map<String, dynamic>> getPackageInfoMap() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return <String, dynamic>{
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }

  static Future<String> getAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  static String formatDateTime(DateTime dateTime) =>
      formatDate(dateTime, [yyyy, '-', mm, '-', dd]);
}
