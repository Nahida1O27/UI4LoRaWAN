//设备页文本搜索框组件的实现
//一个文本输入框，输入名称匹配设备名字
import 'package:flutter/material.dart';

class Searchlabel extends StatefulWidget {
  const Searchlabel({super.key});

  @override
  State<Searchlabel> createState() => _SearchlabelState();
}

class _SearchlabelState extends State<Searchlabel> {
  Widget _getSearch() {
    return Positioned(
      top: 10.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索设备",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getSearch();
  }
}
