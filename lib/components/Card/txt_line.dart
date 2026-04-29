import 'package:flutter/material.dart';

//卡片第一行（标题）以及可能的刷新按钮
class FirstTextLine extends StatelessWidget {
  final String title;
  final VoidCallback? onRefresh;
  const FirstTextLine({super.key, required this.title, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 2),
        ),
      ),
      child: Row(
        //卡片标题和刷新按钮之间的间距
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          if (onRefresh != null)
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: onRefresh,
              iconSize: 20,
            ),
        ],
      ),
    );
  }
}

//TextLineCard的第二三四...行文本
class TextLine extends StatelessWidget {
  final Map<String, String> data;

  /// 是否是最后一行，最后一行不绘制底部分割线
  final bool isLast;
  const TextLine({super.key, required this.data, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data.keys.first, style: TextStyle(fontSize: 13)),
          Text(data.values.first, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
