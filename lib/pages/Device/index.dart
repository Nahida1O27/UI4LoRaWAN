import 'package:flutter/material.dart';
import 'package:lorawan/components/Device/device_card.dart';
import 'package:lorawan/components/Device/search_label.dart';
import 'package:lorawan/components/Device/device_button.dart';
import 'package:lorawan/components/Device/sensor_list.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  //传感器列表
  final List<MapEntry<bool, String>> _sensorInfo = [
    MapEntry(true, "123456"),
    MapEntry(false, "789012"),
    MapEntry(true, "345678"),
  ];
  final List<Map<String, String>> _deviceInfo = [
    {"设备类型": "全部设备", "设备数量": "100", "设备数量文本颜色": "0xff66ccff"},
    {"设备类型": "在线设备", "设备数量": "81", "设备数量文本颜色": "0xff009A00"},
    {"设备类型": "离线设备", "设备数量": "19", "设备数量文本颜色": "0xffcc6666"},
  ];
  //把list信息传入，生成一行卡片组件
  List<DeviceCard> _generateDeviceCards(List<Map<String, String>> info) {
    return List.generate(info.length, (int index) {
      return DeviceCard(cardInfo: info[index]);
    });
  }

  //文件内静态变量，用于记录当前选中的按钮索引
  static int _selectedIndex = 0;
  final List<String> _deviceButtonText = ["全部设备", "在线设备", "离线设备"];
  void _onButtonPressed(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  //把list信息传入，生成一行按钮组件
  List<DeviceButton> _generateDeviceButtons(List<String> text) {
    return List.generate(text.length, (int index) {
      return DeviceButton(
        text: text[index],
        isSelected: _selectedIndex == index,
        onPressed: () => _onButtonPressed(index),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("设备管理")),
      body: Column(
        children: [
          //总设备|在线设备|离线设备
          Center(child: Row(children: _generateDeviceCards(_deviceInfo))),
          //文本输入搜索框
          Center(child: SearchLabel()),
          //一行三个圆角按钮
          Row(children: _generateDeviceButtons(_deviceButtonText)),
          //传感器列表：所有项组成一个大圆角卡片，每项带在线状态指示灯
          Flexible(child: SensorList(sensorInfo: _sensorInfo)),
        ],
      ),
    );
  }
}
