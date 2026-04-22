import 'package:flutter/material.dart';
import 'package:lorawan/components/Device/search_label.dart';

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
          Row(children: []), //总设备|在线设备|离线设备
          Center(child: Searchlabel()), //文本输入搜索框
          Row(children: [SizedBox()]), //四个圆角按钮
          //可滚动的传感器列表，每项为紧挨着长方形按钮，占据左右大部分空间，点击按钮跳转到具体的传感器详情页面
          Flexible(
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
