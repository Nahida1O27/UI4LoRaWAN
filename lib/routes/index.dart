import 'package:flutter/material.dart';
import 'package:lorawan/pages/Main/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    //命名路由
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => const MainPage(), //主页路由
  };
}
