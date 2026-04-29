import 'package:flutter/material.dart';

//设备卡片容器组件 - 包含三个卡片
class DeviceCard extends StatelessWidget {
  final List<String> cardInfo;
  final bool isLast;
  const DeviceCard({super.key, required this.cardInfo, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: isLast ? EdgeInsets.zero : const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        //Column内文本居中放置
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cardInfo[1],
            style: TextStyle(
              fontSize: 20,
              color: Color(int.parse(cardInfo[2])),
            ),
          ),
          Text(
            cardInfo[0],
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
