import 'package:flutter/material.dart';

class DeviceButton extends StatefulWidget {
  const DeviceButton({super.key, required this.text});
  final String text;

  @override
  State<DeviceButton> createState() => _DeviceButtonState();
}

//按钮有两种状态：
//1.被选择状态：蓝底白字
//2.未被选择状态：白底黑字
class _DeviceButtonState extends State<DeviceButton> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          if (!isSelected) {
            isSelected = true;
            ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            );
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
