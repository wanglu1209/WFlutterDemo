import 'package:flutter/material.dart';
import 'package:wx_demo_project/slide_item_widget.dart';

class SlideListPage extends StatefulWidget {
  @override
  _SlideListPageState createState() => _SlideListPageState();
}

class _SlideListPageState extends State<SlideListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlideListPage'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return SlideItem(
          onTap: (){
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('点击了，当前第$index个item')));
          },
          menu: <SlideMenuItem>[
            SlideMenuItem(
              onTap: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('点击了，当前第$index个item的Menu，值为「置顶」')));
              },
              child: Center(
                child: Text(
                  '置顶',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              color: Colors.grey,
            ),
            SlideMenuItem(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('确认'),
                        content: Text('确认删除吗？'),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('确认'))
                        ],
                      );
                    });
              },
              child: Center(
                child: Text(
                  '删除',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              color: Colors.red,
            ),
          ],
          child: Container(
            height: 60,
            child: Center(
              child: Text('我是第$index个'),
            ),
          ),
        );
      }),
    );
  }
}
