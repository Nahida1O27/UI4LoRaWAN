import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义底部导航数据
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/1.png", //未激活图标
      "active_icon": "lib/assets/2.png", //激活的图标
      "text": "设备",
    },
    {
      "icon": "lib/assets/3.png", //未激活图标
      "active_icon": "lib/assets/4.png", //激活的图标
      "text": "系统",
    },
  ];

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"]!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("LoRaWAN传感器管理")),
      bottomNavigationBar: BottomNavigationBar(items: _getTabBarWidget()),
    );
  }
}
