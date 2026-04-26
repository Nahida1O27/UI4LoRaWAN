import 'package:flutter/material.dart';

//卡片第一行（标题）以及可能的刷新按钮
class FirstTextLine extends StatelessWidget {
  final String title;
  final VoidCallback? onRefresh;
  const FirstTextLine({super.key, required this.title, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

//TextLineCard的第二三四...行文本
class TextLine extends StatelessWidget {
  final Map<String, String> data;
  const TextLine({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //行与行之间的分割线
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: const Divider(
            height: 0,
            thickness: 1.5,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.keys.first, style: TextStyle(fontSize: 13)),
            Text(data.values.first, style: TextStyle(fontSize: 13)),
          ],
        ),
      ],
    );
  }
}
