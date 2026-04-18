//传感器详情页
import 'package:flutter/material.dart';

class SenserPage extends StatefulWidget {
  const SenserPage({super.key});

  @override
  State<SenserPage> createState() => _SenserPageState();
}

class _SenserPageState extends State<SenserPage> {
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
