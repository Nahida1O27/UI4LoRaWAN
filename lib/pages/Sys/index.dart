//系统信息页
import 'package:flutter/material.dart';

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
        child: Column(children: []), //从上到下：系统概览、网关信息、最近活动
      ),
    );
  }
}
