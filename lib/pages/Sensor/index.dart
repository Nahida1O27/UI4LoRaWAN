//传感器详情页
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/txt_line_card.dart';
import 'package:lorawan/components/Card/ctrl_card.dart';
import 'package:lorawan/components/Card/chart_card.dart';

final List<String> _cardTitles = [
  "设备信息",
  "最新数据",
  "设备控制",
  "数据历史",
  "温度变化",
  "湿度变化",
];
final List<List<Map<String, String>>> _cardData = [
  [
    {"设备名称": "123456"},
    {"应用ID": "1"},
    {"应用名称": "桌面的温湿度传感器"},
  ],
  [
    {"温度": "29.0℃"},
    {"湿度": "54.0%"},
  ],
];

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("传感器详情")),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            TextLineCard(title: _cardTitles[0], data: _cardData[0]),
            TextLineCard(title: _cardTitles[1], data: _cardData[1]),
            ControlCard(title: _cardTitles[2]),

            TableCard(title: _cardTitles[3]),
            ChartCard(title: _cardTitles[4]),
            ChartCard(title: _cardTitles[5]),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
