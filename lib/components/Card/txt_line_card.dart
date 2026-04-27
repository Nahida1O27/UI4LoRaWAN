//统一风格的卡片组件
//以便代码复用和继承
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/card_base.dart';
import 'package:lorawan/components/Card/txt_line.dart';

//准确来说，每张卡片应该拿到一个键值对的列表（List<Map<String,String>>），
//每个键值对表示卡片的一行内容，键是居左文本，值是居右文本
//除了卡片标题这一行，每行文本上面用分割线隔开。

class TextLineCard extends CardBase {
  //允许data为空，方便测试
  final List<Map<String, String>>? data;

  const TextLineCard({
    super.key,
    super.onRefresh,
    required super.title,
    required this.data,
  });

  @override
  List<Widget> buildCardContent(BuildContext context) {
    return data != null && data!.isNotEmpty
        ? data!.asMap().entries.map((entry) {
            final item = entry.value;
            return TextLine(data: item);
          }).toList()
        : [];
  }
}
