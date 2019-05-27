import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {
  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  // 生成列表数据
  var _listData = List<String>.generate(30, (i) => 'Items $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DismissiblePage'),
      ),
      body: _createListView(),
    );
  }

  // 创建ListView
  Widget _createListView() {
    return ListView.builder(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return Dismissible(
          // Key
          key: Key('key${_listData[index]}'),
          // Child
          child: ListTile(
            title: Text('${_listData[index]}'),
          ),
          onDismissed: (direction) {
            var _snackStr;
            if (direction == DismissDirection.endToStart) {
              // 从右向左  也就是删除
              _snackStr = '删除了${_listData[index]}';
            } else if (direction == DismissDirection.startToEnd) {
              _snackStr = '收藏了${_listData[index]}';
            }

            // 展示 SnackBar
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(_snackStr),
              duration: Duration(milliseconds: 400),
            ));

            // 删除后刷新列表，以达到真正的删除
            setState(() {
              _listData.removeAt(index);
            });
          },
          background: Container(
            color: Colors.green,
            // 这里使用 ListTile 因为可以快速设置左右两端的Icon
            child: ListTile(
              leading: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ),

          secondaryBackground: Container(
            color: Colors.red,
            // 这里使用 ListTile 因为可以快速设置左右两端的Icon
            child: ListTile(
              trailing: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),

          confirmDismiss: (direction) async {
            var _confirmContent;

            var _alertDialog;

            if (direction == DismissDirection.endToStart) {
              // 从右向左  也就是删除
              _confirmContent = '确认删除${_listData[index]}？';
              _alertDialog = _createDialog(
                _confirmContent,
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('确认删除${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(true);
                },
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('不删除${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(false);
                },
              );
            } else if (direction == DismissDirection.startToEnd) {
              _confirmContent = '确认收藏${_listData[index]}？';
              _alertDialog = _createDialog(
                _confirmContent,
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('确认收藏${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(true);
                },
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('不收藏${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(false);
                },
              );
            }

            var isDismiss = await showDialog(
                context: context,
                builder: (context) {
                  return _alertDialog;
                });
            return isDismiss;
          },
        );
      },
    );
  }

  Widget _createDialog(
      String _confirmContent, Function sureFunction, Function cancelFunction) {
    return AlertDialog(
      title: Text('Confirm'),
      content: Text(_confirmContent),
      actions: <Widget>[
        FlatButton(onPressed: sureFunction, child: Text('sure')),
        FlatButton(onPressed: cancelFunction, child: Text('cancel')),
      ],
    );
  }
}
