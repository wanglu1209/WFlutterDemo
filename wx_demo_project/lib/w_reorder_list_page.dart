import 'package:flutter/material.dart';
import 'package:wx_demo_project/widget_reorder_list.dart';

class WReorderListPage extends StatefulWidget {
  @override
  _WReorderListPageState createState() => _WReorderListPageState();
}

class _WReorderListPageState extends State<WReorderListPage> {
  GlobalKey<WReorderListState> key = GlobalKey<WReorderListState>();
  List<Widget> children = [
    Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.red),
    ),
    Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.green),
    ),
    Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.cyanAccent),
    ),
    Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.deepOrange),
    ),
    Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.pink),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WReorderListPage'),
      ),
      body: WReorderList(
          key: key,
          children: children,
          onIndexChanged: (i, j) {
            setState(() {
              var temp = children[i];
              children[i] = children[j];
              children[j] = temp;
            });
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        key.currentState.swap(0, 2);
      }),
    );
  }
}
