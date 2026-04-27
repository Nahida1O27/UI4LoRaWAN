//放置设备控制按钮的卡片
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/card_base.dart';

class ControlCard extends CardBase {
  static const List<String> _buttonText = [
    "下发传感器配置",
    "下发LoRa配置",
    "查看待下发指令",
    "查看命令历史",
    "清除设备数据",
  ];
  final List<MapEntry<Color, Color>> _buttonColors = [
    MapEntry(Colors.blue, Colors.white),
    MapEntry(Colors.blue, Colors.white),
    MapEntry(Colors.white, Colors.black),
    MapEntry(Colors.white, Colors.black),
    MapEntry(Colors.red, Colors.white),
  ];
  ControlCard({super.key, required super.title});

  @override
  List<Widget> buildCardContent(BuildContext context) {
    return List.generate(_buttonText.length, (index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3.0),
        child: Center(
          child: ElevatedButton(
            //按钮背景为蓝色，文字为白色
            style: ElevatedButton.styleFrom(
              backgroundColor: _buttonColors[index].key,
              foregroundColor: _buttonColors[index].value,
              //长条形圆角按钮
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              //尽量让按钮占满宽度
              minimumSize: Size(double.infinity, 40),
            ),
            onPressed: () {}, //暂时不实现功能
            child: Text(_buttonText[index]),
          ),
        ),
      );
    });
  }
}
