
import 'http_exceptions.dart';

class HttpResponse {
  late bool ok;
  dynamic data;
  HttpException? error;
  Map<String, dynamic>? response;
  HttpResponse._internal({this.ok = false});

  HttpResponse.success(this.data, {Map<String, dynamic>? response}) {
    this.ok = true;
    if (response != null) {
      this.response = response;
    }
  }

  HttpResponse.failure(
      {String? errorMsg = '网络请求失败',
      int? errorCode = 404,
      Map<String, dynamic>? response,
      this.data}) {
    this.error = BadRequestException(message: errorMsg, code: errorCode);
    this.ok = false;
  }

  HttpResponse.failureFormResponse({dynamic data}) {
    this.error = BadResponseException(data);
    this.ok = false;
  }

  HttpResponse.failureFromError([HttpException? error]) {
    this.error = error ?? UnknownException();
    this.ok = false;
  }
}
