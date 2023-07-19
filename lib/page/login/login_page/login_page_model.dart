import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_model/core/http/src/http_client.dart';
import 'package:flutter_model/core/http/src/http_response.dart';
import 'package:get/get.dart';

import '../../../utils/ase_utils.dart';

String author = "Basic YXBwOmFwcA==";

class LoginPageModel {
  // 发送验证码
  static Future<HttpResponse> loginWithPassword(
      String userName, String password, String deviceId) async {
    Map<String, dynamic> arguments = {};
    arguments["grant_type"] = "password";
    arguments["loginType"] = "2";
    arguments["deviceId"] = deviceId;
    arguments["app"] = "app";
    Options options = Options();
    options.headers = {};
    options.headers!["Authorization"] = author;
    options.headers!["Content-Type"] = Headers.formUrlEncodedContentType;
    Map<String, dynamic> data = {};
    data["username"] = userName;
    var encrypt = AesUtils.encrypt(password);
    data["password"] = encrypt;

    var httpClient = Get.find<HttpClient>(tag: HttpClient.defaultClientTag);
    var response = await httpClient.post('/auth/oauth/token',
        data: data, options: options, queryParameters: arguments);
    return response;
  }
}
