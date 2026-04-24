import 'package:flutter/material.dart';

//按钮为无状态组件，由父组件传递参数来控制按钮的状态和行为
class DeviceButton extends StatelessWidget {
  const DeviceButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed,
        //选中时，蓝底白字；未选中时，白底蓝字
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
