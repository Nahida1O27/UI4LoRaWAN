//生成传感器列表
import 'package:flutter/material.dart';

class SensorList extends StatelessWidget {
  final List<MapEntry<bool, String>> sensorInfo;
  const SensorList({super.key, required this.sensorInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        //生成传感器列表项
        child: ListView.builder(
          itemCount: sensorInfo.length,
          itemBuilder: (context, index) => _buildSensorItem(context, index),
        ),
      ),
    );
  }

  InkWell _buildSensorItem(BuildContext context, int index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/sensor"),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        decoration: BoxDecoration(
          //最后一项底下不加分割线
          border: index < sensorInfo.length - 1
              ? Border(bottom: BorderSide(color: Colors.blueGrey.shade200))
              : null,
        ),
        child: Row(
          children: [
            //放置在线状态的指示灯的容器
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sensorInfo[index].key ? Colors.green : Colors.red,
              ),
            ),
            //横向间距
            SizedBox(width: 12),
            // 传感器ID
            Text(sensorInfo[index].value, style: TextStyle(fontSize: 15)),
            Spacer(),
            // 右箭头，引导点击
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
