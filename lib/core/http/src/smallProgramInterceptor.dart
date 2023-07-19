import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/env_config.dart';

class SmallPInterceptor extends Interceptor {
  SmallPInterceptor(
      {this.request = true,
      this.requestHeader = true,
      this.requestBody = true});
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.baseUrl == EnvConfiguration.value.rtMapConfiguration.baseUrl) {
      String requestObj = '';
      Map<String, dynamic>? dataMap;
      if (options.method == 'GET' || options.method == 'get') {
        dataMap = options.queryParameters;
        // get方法
        var keys = dataMap.keys.toList();
        if (keys.length > 0) {
          keys.sort();
          List<String> array = [];
          keys.forEach((key) {
            var value = dataMap?[key];
            array.add('$key=$value');
          });
          requestObj = array.join('&');
        }
      } else {
        dataMap = options.data as Map<String, dynamic>?;
        if (dataMap != null) {
          requestObj = json.encode(dataMap);
        }
      }
      // options.headers['token'] = getOptions(requestObj);
      // print('token = ${options.headers['token']}');
    }
    handler.next(options);
  }

  String getOptions(String dataBody) {
    return '';
  }
}
