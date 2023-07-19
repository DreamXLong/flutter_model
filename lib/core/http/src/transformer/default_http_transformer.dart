/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2021-07-16 09:40:43
 * @LastEditors: TT
 * @LastEditTime: 2021-07-21 10:41:34
 */

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';

import '../http_response.dart';
import '../http_transformer.dart';

//  服务器默认返回的数据接口合适
//   {
//     "code": 200,
//     "data": {} || [] || null,
//     "msg": "success"
// }

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    var json = response.data as Map<String, dynamic>?;
    if (json == null) {
      return HttpResponse.failure(errorMsg: '请求的数据为空', errorCode: -1);
    }
    var code = json['code'] ?? json['status'];
    if ('$code' == '200') {
      return HttpResponse.success(json['data'], response: json);
    }

    return HttpResponse.failure(
        errorMsg: (json["msg"] != null) ? json["msg"] : json["message"],
        errorCode: code,
        data: json['data']);
  }

  /// 单例对象
  static DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}

class DynamicHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response<dynamic> response) {
    var json = response.data as dynamic;
    if (json == null) {
      return HttpResponse.failure(errorMsg: '请求的数据为空', errorCode: -1);
    }
    Map<String, dynamic> result = json;
    var code = result['code'] ?? result['status'];
    if ('$code' == '200') {
      return HttpResponse.success(result['data'], response: result);
    }
    return HttpResponse.failure(
      errorMsg: (result["msg"] != null) ? result["msg"] : result["message"],
      errorCode: code,
    );
  }

  // 单例对象
  static DynamicHttpTransformer _instance = DynamicHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DynamicHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DynamicHttpTransformer.getInstance() => _instance;
}
