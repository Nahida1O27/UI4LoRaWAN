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
  //文件内静态变量，用于记录当前选中的按钮索引
  static int _selectedIndex = 0;
  final List<String> _deviceButtonText = ["全部设备", "在线设备", "离线设备"];
  static List<MapEntry<bool, String>> info = [];
  final List<List<String>> _deviceInfo = [
    ["全部设备", "100", "0xff66ccff"],
    ["在线设备", "81", "0xff009A00"],
    ["离线设备", "19", "0xffcc6666"],
  ];

  Widget _buildDeviceCards(List<List<String>> cardsInfo) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: List.generate(cardsInfo.length, (index) {
          return Expanded(
            child: DeviceCard(
              cardInfo: cardsInfo[index],
              isLast: index == cardsInfo.length - 1,
            ),
          );
        }),
      ),
    );
  }

  void _onButtonPressed(int index) {
    _selectedIndex = index;
    //根据选中的按钮索引，更新传感器列表
    //如果index==0，info=_sensorInfo
    //如果index==1，info=_sensorInfo中所有项的key为true的项
    //如果index==2，info=_sensorInfo中所有项的key为false的项
    info = _selectedIndex == 0
        ? _sensorInfo
        : _selectedIndex == 1
        ? _sensorInfo.where((element) => element.key).toList()
        : _sensorInfo.where((element) => !element.key).toList();
    setState(() {});
  }

  void _onSearch(String value) {
    if (value.isEmpty) {
      info = _selectedIndex == 0
          ? _sensorInfo
          : _selectedIndex == 1
          ? _sensorInfo.where((element) => element.key).toList()
          : _sensorInfo.where((element) => !element.key).toList();
    } else {
      info = info.where((element) => element.value.contains(value)).toList();
    }
    setState(() {});
  }

  //把 list 信息传入，生成一行按钮组件
  List<Widget> _buildDeviceButtons(List<String> text) {
    return List.generate(text.length, (int index) {
      return Container(
        margin: index == 0
            ? const EdgeInsets.only(left: 16, right: 4, top: 8, bottom: 8)
            : const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: DeviceButton(
          text: text[index],
          isSelected: _selectedIndex == index,
          onPressed: () => _onButtonPressed(index),
        ),
      );
    });
  }

  //页面初始化时，生成全部传感器列表
  @override
  void initState() {
    super.initState();
    info = _sensorInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("设备管理")),
      body: Column(
        children: [
          //总设备|在线设备|离线设备
          _buildDeviceCards(_deviceInfo),
          //文本输入搜索框
          Center(child: SearchLabel(onSearch: _onSearch)),
          //一行三个圆角按钮
          Row(children: _buildDeviceButtons(_deviceButtonText)),
          //传感器列表：所有项组成一个大圆角卡片，每项带在线状态指示灯
          Flexible(child: SensorList(sensorInfo: info)),
        ],
      ),
    );
  }
}
