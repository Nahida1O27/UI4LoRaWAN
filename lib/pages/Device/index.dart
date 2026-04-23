import 'package:flutter/material.dart';
import 'package:lorawan/components/Device/device_card.dart';
import 'package:lorawan/components/Device/search_label.dart';

final List<Map<String, String>> _deviceInfo = [
  {"设备类型": "全部设备", "设备数量": "100", "设备数量文本颜色": "0xff66ccff"},
  {"设备类型": "在线设备", "设备数量": "81", "设备数量文本颜色": "0xff009A00"}, //深绿色
  {"设备类型": "离线设备", "设备数量": "19", "设备数量文本颜色": "0xffcc6666"},
];
//把list信息传入，生成一行卡片组建
List<DeviceCard> _generateDeviceCards(List<Map<String, String>> info) {
  return List.generate(info.length, (int index) {
    return DeviceCard(cardInfo: info[index]);
  });
}

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("设备管理")),
      body: Column(
        children: [
          //总设备|在线设备|离线设备
          Center(child: Row(children: _generateDeviceCards(_deviceInfo))),
          //文本输入搜索框
          Center(child: Searchlabel()),
          //四个圆角按钮
          Row(children: [SizedBox()]),
          //可滚动的传感器列表，每项为紧挨着长方形按钮，占据左右大部分空间，点击按钮跳转到具体的传感器详情页面
          Flexible(
            //延迟加载列表项，优化性能
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(
                    child: Text("传感器$index"),
                    onPressed: () {
                      //点击按钮跳转到具体的传感器详情页面
                      Navigator.pushNamed(context, "/sensor");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
