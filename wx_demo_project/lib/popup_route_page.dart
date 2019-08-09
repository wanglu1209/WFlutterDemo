import 'package:flutter/material.dart';
import 'package:wx_demo_project/widget_w_popup_menu.dart';

class PopupRoutePage extends StatefulWidget {
  @override
  _PopupRoutePageState createState() => _PopupRoutePageState();
}

class _PopupRoutePageState extends State<PopupRoutePage> {
  final List<String> actions = [
    '复制',
    '转发',
    '收藏',
    '删除',
    '多选',
    '提醒',
    '翻译',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupRoutePage'),
      ),
      body: ListView.builder(
          itemCount: 40,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (context, index) {
            return Container(
              alignment:
                  index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 180,
                child: WPopupMenu(
                  onValueChanged: (int value) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(actions[value]), duration: Duration(milliseconds: 500),));
                  },
                  actions: actions,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      color: index % 2 == 0 ? Colors.orangeAccent : Colors.blue,
                    ),
                    child: Text(
                      '我是Title $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
