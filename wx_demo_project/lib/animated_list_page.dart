import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  List<String> _listData = List<String>.generate(10, (i) => 'item $i');
  GlobalKey<AnimatedListState> _animListKey = new GlobalKey();
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = new Tween(begin: 0, end: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedListPage'),
      ),
      body: AnimatedList(
        key: _animListKey,
        initialItemCount: _listData.length,
        itemBuilder: (context, index, anim) {
          return FadeTransition(
            opacity: anim.drive(_tween),
            child: GestureDetector(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('删除该条'),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                var data = _listData[index];
                                _animListKey.currentState.removeItem(index,
                                    (context, anim) {
                                  return FadeTransition(
                                    opacity: anim.drive(_tween),
                                    child: ListTile(
                                      title: Text(data),
                                    ),
                                  );
                                });
                                _listData.removeAt(index);
                                Navigator.of(context).pop(true);
                              },
                              child: Text('确定')),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('取消')),
                        ],
                      );
                    });
              },
              child: ListTile(
                title: Text(_listData[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _listData.insert(0, '+1');
            _animListKey.currentState.insertItem(0);
            print(_listData);
          }),
    );
  }
}
