import 'package:flutter/material.dart';

class ReorderableListViewPage extends StatefulWidget {
  @override
  _ReorderableListViewPageState createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  List<Color> _data = [
    Colors.blue,
    Colors.pinkAccent,
    Colors.deepPurple,
    Colors.orangeAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReorderableListViewPage'),
      ),
      body: ReorderableListView(
          header: Container(
            height: 50,
          ),
          children: _data
              .map((s) => Dismissible(
                    key: Key(s.toString()),
                    child: Card(
                      color: s,
                      key: Key(s.toString()),
                      child: Container(
                        width: 300,
                        height: 100,
                      ),
                    ),
                  ))
              .toList(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if(oldIndex < newIndex) {
                newIndex -= 1;
              }

              var temp = _data.removeAt(oldIndex);
              _data.insert(newIndex, temp);
            });
          }),
    );
  }
}
