//统一风格的卡片组件
//以便代码复用和继承
import 'package:flutter/material.dart';

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
            Row(
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
                //if (onRefresh != null)
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: onRefresh,
                  iconSize: 20,
                ),
              ],
            ),
            //卡片第一行结束

            //卡片的第二三四...行
            if (data != null && data!.isNotEmpty) ...[
              ...data!.asMap().entries.map((entry) {
                final item = entry.value;
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
                        Text(item.keys.first, style: TextStyle(fontSize: 13)),
                        Text(item.values.first, style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ],
                );
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
