//统一风格的卡片组件
//以便代码复用和继承
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/txt_line.dart';

//每种卡片都要有一行标题，一个可选的刷新按钮
//卡片的设计风格还要统一

abstract class CardBase extends StatelessWidget {
  final String title;
  final VoidCallback? onRefresh;

  const CardBase({super.key, required this.title, this.onRefresh});

  // 抽象方法：强制子类提供内部内容
  List<Widget> buildCardContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14.0),
      color: Color.fromARGB(255, 245, 245, 245), //卡片背景颜色和背景有所区别
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      elevation: 2, //卡片下方的阴影
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
          //卡片内容左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //卡片第一行开始——标题行带底部分割线
            FirstTextLine(title: title, onRefresh: onRefresh),
            //卡片第一行结束

            //卡片的第二三四...行
            ...buildCardContent(context),

            //最后一行下方填充空间，看上去别那么挤
            Padding(padding: EdgeInsets.symmetric(vertical: 3)),
          ],
        ),
      ),
    );
  }
}
