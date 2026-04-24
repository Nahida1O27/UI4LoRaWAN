//设备页文本搜索框组件的实现
//一个文本输入框，输入名称匹配设备名字
import 'package:flutter/material.dart';

class SearchLabel extends StatefulWidget {
  final Function(String)? onSearch;
  final String hintText;
  const SearchLabel({super.key, this.hintText = "搜索设备名称", this.onSearch});

  @override
  State<SearchLabel> createState() => _SearchLabelState();
}

class _SearchLabelState extends State<SearchLabel> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false; //默认为空
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
      if (widget.onSearch != null) {
        widget.onSearch!(_controller.text);
      }
    });
  }

  //组件销毁时，释放资源
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //清除搜索框
  void _clearSearch() {
    _controller.clear();
    if (widget.onSearch != null) {
      widget.onSearch!("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10), //圆角半径
        boxShadow: [
          //外围阴影
          BoxShadow(
            color: Colors.black.withAlpha(40), //阴影颜色RGBA
            blurRadius: 8, //阴影模糊半径
            offset: Offset(0, 2), //阴影偏移量
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 24),
          suffixIcon: _hasText
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[600], size: 20),
                  onPressed: _clearSearch,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        //输入文本的样式
        style: TextStyle(fontSize: 16, color: Colors.black87),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (widget.onSearch != null) {
            widget.onSearch!(value);
          }
        },
      ),
    );
  }
}
