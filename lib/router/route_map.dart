
import 'package:flutter_model/page/login/login_page/login_page_view.dart';
import 'package:get/get.dart';

import '../page/404/index.dart';
import '../page/app_web_h5/index.dart';
import '../page/login/login_page/login_page_binding.dart';

class RouteMap {
  static const String webViewUrl = "/web";
  static const String loginPageUrl = "/loginPage";

  static List<GetPage> getPages = [
    GetPage(
        name: webViewUrl,
        page: () {
          var url = Get.parameters['url'] ?? '';
          if (url.isNotEmpty) {
            return AppWebViewPage(url);
          }
          return NotFoundPage();
        }),
    GetPage(name: loginPageUrl, page: (){ return const LoginPage();}, binding: LoginPageBinding()),
  ];
}
