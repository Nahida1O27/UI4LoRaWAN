import 'package:flutter/material.dart';

//单个卡片组件
class DeviceCard extends StatelessWidget {
  final Map<String, String> cardInfo;
  const DeviceCard({super.key, required this.cardInfo});

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width * 11 / 36;
    final double containerMargin =
        (MediaQuery.of(context).size.width - 3 * containerWidth) / 6.0;
    return Container(
      //根据屏幕宽度，每个卡片占1/3个屏幕（算上预留的空间）
      width: containerWidth,
      height: 75,
      margin: EdgeInsets.symmetric(
        horizontal: containerMargin,
        vertical: 5,
      ), //容器外部间距
      padding: EdgeInsets.all(10), //容器内部间距
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 0.1),
      ),
      child: Column(
        children: [
          Text(
            cardInfo["设备数量"]!,
            style: TextStyle(
              fontSize: 20,
              color: Color(int.parse(cardInfo["设备数量文本颜色"]!)),
            ),
          ),
          Text(
            cardInfo["设备类型"]!,
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
