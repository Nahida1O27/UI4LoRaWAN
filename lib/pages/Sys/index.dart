//系统信息页
import 'package:flutter/material.dart';
//引入一个卡片父类测试
import 'package:lorawan/components/Card/txt_line_card.dart';

final List<String> _cardTitles = ["系统概览", "网关信息", "最近活动"];
final List<List<Map<String, String>>> _cardData = [
  [
    {"设备总数": "100"},
    {"在线设备": "50"},
    {"离线设备": "50"},
  ],
  [
    {"本地网关": "LORAWAN网关"},
  ],
  [
    {"（具体传感器ID）": "2026-08-01 10:00:00"},
  ],
];

class SysPage extends StatefulWidget {
  const SysPage({super.key});

  @override
  State<SysPage> createState() => _SysPageState();
}

class _SysPageState extends State<SysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("管理系统")),
      body: Flexible(
        child: ListView.builder(
          itemCount: _cardTitles.length,
          itemBuilder: (context, index) {
            return TextLineCard(
              title: _cardTitles[index],
              //如果index在_cardData越界了，就返回一个空列表
              //否则返回_cardData[index]的值
              data: index < _cardData.length ? _cardData[index] : [],
              onRefresh: () {}, //做些刷新操作
            );
          },
        ),
      ),
    );
  }
}
