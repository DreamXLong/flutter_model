import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_model/page/login/login_page/login_page_binding.dart';
import 'package:flutter_model/page/login/login_page/login_page_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:permission_handler/permission_handler.dart';

import '../generated/i18n.dart';
import '../get_controller_store/index.dart';
import '../page/404/index.dart';
import '../router/route_map.dart';
import '../utils/sputils.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() async {
    var startTime = DateTime.now();
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await initApp();
    initPermissions();
    runApp(const MyApp());
    var endTime = DateTime.now();
    var time = endTime.millisecond - startTime.millisecond;
    print('启动时间time - $time ${DateTime.now()}');
    FlutterNativeSplash.remove();
  }

  //程序初始化操作
  static Future<void> initApp() async {
    // 初始化存储
    await SPUtils.init();
    // 初始化全局状态
    await initGlobalStates();
    // 初始化第三方插件
    initPlugin();
  }

  //程序初始化操作
  static Future<void> initPermissions() async {
    var status = await Permission.notification.request();
    if (status == PermissionStatus.denied) {
      //点击拒绝权限相关操作

    }
  }

  /// 初始化第三方插件
  static void initPlugin() async {}
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  Widget _getRootNode() {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: GetMaterialApp(
        // builder: EasyLoading.init(),
        builder: (context, child) {
          child = BotToastInit()(context, child);
          return child;
        },
        navigatorObservers: [routeObserver],
        initialRoute: RouteMap.loginPageUrl,
        initialBinding: LoginPageBinding(),
        getPages: RouteMap.getPages,
        unknownRoute: GetPage(name: '/notFound', page: () => NotFoundPage()),
        defaultTransition: Transition.rightToLeft,
        supportedLocales: I18n.delegate.supportedLocales,
        localizationsDelegates: const [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return _getRootNode();
      },
      designSize: const Size(1080, 2340),
    );
  }
}
