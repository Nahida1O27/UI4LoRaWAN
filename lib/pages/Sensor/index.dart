//传感器详情页
import 'package:flutter/material.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("传感器详情"),
            Text("设备信息"),
            Text("最新数据"),
            Text("设备控制"),
            Text("温度变化"),
            Text("电池电压"),
          ],
        ),
      ),
    );
  }
}
