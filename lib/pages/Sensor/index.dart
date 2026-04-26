//传感器详情页
import 'package:flutter/material.dart';

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
          children: List.generate(50, (int index) {
            return Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              color: Colors.blue,
              height: 100,
              alignment: Alignment.center,
            );
          }),
        ),
      ),
    );
  }
}
