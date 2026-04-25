//系统信息页
import 'package:flutter/material.dart';
//引入一个卡片父类测试
import 'package:lorawan/components/card.dart';

final List<String> _cardTitles = ["系统概览", "网关信息", "最近活动"];

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
            CustomCard(title: _cardTitles[0]),
            CustomCard(title: _cardTitles[1]),
            CustomCard(title: _cardTitles[2]),
          ],
        ), //从上到下：系统概览、网关信息、最近活动
      ),
    );
  }
}
