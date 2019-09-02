import 'package:flutter/material.dart';

import 'widget_w_popup_menu.dart';

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
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('PopupRoutePage'),
//        ),
//        body: Column(
//          children: <Widget>[
//            Expanded(
//              child: ListView.builder(
//                  shrinkWrap: true,
//                  itemCount: 40,
//                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                  itemBuilder: (context, index) {
//                    return Container(
//                      padding: EdgeInsets.symmetric(vertical: 5),
//                      alignment: index % 2 == 0
//                          ? Alignment.centerLeft
//                          : Alignment.centerRight,
//                      child: WPopupMenu(
//                        height: 50,
//                        width: 350,
//                        alignment: Alignment.center,
//                        decoration: ShapeDecoration(
//                          shape: RoundedRectangleBorder(
//                              borderRadius:
//                              BorderRadius.all(Radius.circular(5))),
//                          color: index % 2 == 0
//                              ? Colors.orangeAccent
//                              : Colors.blue,
//                        ),
//                        onValueChanged: (int value) {
//                          Scaffold.of(context).showSnackBar(SnackBar(
//                            content: Text(actions[value]),
//                            duration: Duration(milliseconds: 500),
//                          ));
//                        },
//                        pressType: PressType.longPress,
//                        actions: actions,
//                        child: Text(
//                          '我是Title $index',
//                          style: TextStyle(color: Colors.white),
//                        ),
//                      ),
//                    );
//                  }),
//            ),
//            TextField()
//          ],
//        ));
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: WPopupMenu(
                onValueChanged: (value) {},
                actions: ['Quit Circle'],
                menuWidth: 110,
                menuHeight: 50,
                backgroundColor: Color(0xaa000000),
                pressType: PressType.singleClick,
                child: Icon(Icons.linear_scale),
              ),
            )
          ],
        ),
      ),
    );
  }
}
