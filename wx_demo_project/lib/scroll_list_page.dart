import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollListPage extends StatefulWidget {
  @override
  _ScrollListPageState createState() => _ScrollListPageState();
}

class _ScrollListPageState extends State<ScrollListPage> {
  List<int> list = [1, 2, 3, 4];
  Tween<double> _tween = Tween(begin: 0.0, end: 1.0);
  GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();
  Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      timer = Timer.periodic(Duration(seconds: 1), (e) {
        var item = list.removeAt(0);
        _animatedListKey.currentState.removeItem(0, (context, animation) {
          return SizeTransition(
            sizeFactor: animation.drive(_tween),
            axisAlignment: 1.0,
            child: _buildItemWidget(item.toString()),
          );
        });
        list.add(item);
        _animatedListKey.currentState.insertItem(2);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedList(
          padding: EdgeInsets.zero,
          key: _animatedListKey,
          shrinkWrap: true,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return SizeTransition(
              axis: Axis.vertical,
              axisAlignment: -1.0,
              sizeFactor: animation.drive(_tween),
              child: _buildItemWidget(list[index].toString()),
            );
          },
          initialItemCount: 3,
        ),
      ),
    );
  }

  Widget _buildItemWidget(String title) {
    return ListTile(
      leading: ClipOval(
          child: Stack(
        children: <Widget>[
          Image.asset(
            'images/wanimal.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                color: Colors.white10,
              ),
            ),
          )
        ],
      )),
      title: Text('想你的夜 -> $title'),
      subtitle: Text('我这是个性签名，没有个性不签名'),
      trailing: Icon(Icons.call, color: Colors.amber,),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
