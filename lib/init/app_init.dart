import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'default_app.dart';

//应用初始化
class AppInit {
  static void run() {
    //捕获异常
    runZonedGuarded(
        () => DefaultApp.run(),
        (err, stace) =>
            print(FlutterErrorDetails(exception: err, stack: stace)),
        zoneSpecification: const ZoneSpecification(print: collectLog));

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static void collectLog(
      Zone self, ZoneDelegate parent, Zone zone, String line) {
    if (line.length > 800) {
      parent.print(zone, '字符串长度为 ${line.length}');
      log(line);
    } else {
      parent.print(zone, line);
    }
  }
}
