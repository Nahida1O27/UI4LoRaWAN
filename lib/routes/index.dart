import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lorawan/pages/Main/index.dart';
import 'package:lorawan/pages/Sensor/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    locale: const Locale('zh', 'CN'), //默认语言为中文
    //本地化代理
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate, //全局材料本地化代理
      GlobalWidgetsLocalizations.delegate, //全局小部件本地化代理
      GlobalCupertinoLocalizations.delegate, //全局cupertino本地化代理
    ],
    //支持的语言
    supportedLocales: const [Locale('zh', 'CN')],
    //命名路由
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => const MainPage(), //主页路由
    "/sensor": (context) => const SensorPage(), //传感器详情路由
  };
}
