//传感器详情页
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/txt_line_card.dart';
import 'package:lorawan/components/Card/ctrl_card.dart';
import 'package:lorawan/components/Card/chart_card.dart';

final List<String> _cardTitles = ["设备信息", "最新数据", "设备控制", "数据历史", "数据变化"];
final List<List<Map<String, String>>> _cardData = [
  [
    {"设备名称": "1234567890"},
    {"设备EUI": "设备ID"},
    {"应用ID": "index"},
    {"应用名称": "CO2"},
  ],
  [
    {"电池": "3.82V"},
    {"温度": "23.8℃"},
    {"角度": "176.4°"},
    {"湿度": "40.8"},
    {"CO2": "362"},
    {"距离": "-"},
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
          ],
        ),
      ),
    );
  }
}
