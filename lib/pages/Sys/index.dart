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
      appBar: AppBar(
        title: Text("系统管理"),
      ),
      body: Center(),
    );
  }
}
