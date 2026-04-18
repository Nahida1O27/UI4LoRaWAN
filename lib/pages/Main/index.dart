//Flutter项目主页面
import 'package:flutter/material.dart';
import 'package:lorawan/pages/Sys/index.dart';
import 'package:lorawan/pages/Device/index.dart';

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

  int _currentIndex = 0;

  List<Widget> _getShowWidget() {
    return [DevicePage(), SysPage()];
  }

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
      appBar: AppBar(title: Text("LoRaWAN传感器管理"), backgroundColor: Colors.blue),
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getShowWidget()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        useLegacyColorScheme: false,
        selectedItemColor: Colors.blue,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
