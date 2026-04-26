//统一风格的卡片组件
//以便代码复用和继承
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/txt_line.dart';

//准确来说，每张卡片应该拿到一个键值对的列表（List<Map<String,String>>），
//每个键值对表示卡片的一行内容，键是居左文本，值是居右文本
//除了卡片标题这一行，每行文本上面用分割线隔开。

class TextLineCard extends StatelessWidget {
  final String title;
  final List<Map<String, String>>? data;
  final Widget? child;
  final VoidCallback? onRefresh;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? color;
  final double borderRadius;

  const TextLineCard({
    super.key,
    required this.title,
    this.data,
    this.child,
    this.onRefresh,
    this.margin = const EdgeInsets.all(8.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
    this.color = const Color.fromARGB(255, 245, 245, 245), //卡片背景颜色和背景有所区别
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 2, //卡片下方的阴影
      child: Padding(
        padding: padding,
        child: Column(
          //卡片内容左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //卡片第一行开始
            FirstTextLine(title: title, onRefresh: onRefresh),
            //卡片第一行结束

            //卡片的第二三四...行
            if (data != null && data!.isNotEmpty) ...[
              ...data!.asMap().entries.map((entry) {
                final item = entry.value;
                return TextLine(data: item);
              }),
            ],

            //最后一行下方填充空间，看上去别那么挤
            Padding(padding: const EdgeInsets.symmetric(vertical: 3)),
          ],
        ),
      ),
    );
  }
}
