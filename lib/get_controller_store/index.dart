import 'package:flutter_model/config/env_config.dart';
import 'package:flutter_model/core/http/src/http_config.dart';
import 'package:flutter_model/core/http/src/smallProgramInterceptor.dart';
import 'package:get/get.dart';

import '../core/http/src/http_client.dart';

bool DEBUG = false;

/// 初始化所有的全局状态
Future<void> initGlobalStates() async {
  String baseUrl =
      DEBUG ? "https://G35.test.llvision.com/" : "https://hey.llvision.com/";

  // 注入网络请求组件
  Get.put(HttpClient(dioConfig: HttpConfig(baseUrl: baseUrl,
          //proxy: "10.10.10.84:8888",
          interceptors: [SmallPInterceptor()])),
      permanent: true, tag: HttpClient.defaultClientTag);
  Get.put(HttpClient(dioConfig: HttpConfig(baseUrl: baseUrl)),
      permanent: true, tag: HttpClient.imageClientTag);
  // 注入环境配置对象
  Get.put(EnvConfiguration(rtMapConfiguration: RtMapConfiguration(baseUrl)),
      permanent: true);
}
