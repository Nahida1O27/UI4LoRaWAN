//系统信息页
import 'package:flutter/material.dart';
//引入一个卡片父类测试
import 'package:lorawan/components/Card/txt_line_card.dart';

final List<String> _cardTitles = ["系统概览", "网关信息", "最近活动"];
final List<List<Map<String, String>>> _cardData = [
  [
    //存储键值对的列表
    {"系统名称": "LORAWAN"}, {"系统版本": "1.0.0"},
    {"网关ID": "1234567890"},
  ],
  [
    {"网关名称": "LORAWAN网关"},
    {"活动时间": "2023-08-01 10:00:00"},
    {"活动类型": "连接成功"},
    {"活动描述": "网关成功连接到服务器"},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextLineCard(title: _cardTitles[0], data: _cardData[0]),
            TextLineCard(title: _cardTitles[1]),
            TextLineCard(title: _cardTitles[2], data: _cardData[1]),
          ],
        ), //从上到下：系统概览、网关信息、最近活动
      ),
    );
  }
}
