import 'dart:math';

import 'package:flutter/material.dart';

class LotteryPage extends StatefulWidget {
  @override
  _LotteryPageState createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LotteryPage'),
        ),
        body: Center(
          child: LotteryWidget(),
        ));
  }
}

class LotteryWidget extends StatefulWidget {
  @override
  _LotteryWidgetState createState() => _LotteryWidgetState();
}

class _LotteryWidgetState extends State<LotteryWidget>
    with TickerProviderStateMixin {
  int _index = 0;
  Tween<double> _tween;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _tween = Tween(begin: 0, end: pi);
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation = _tween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack))
      ..addListener(() {
        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _controller.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          setState(() {
            _index = 1;
          });
        });
      },
      child: Transform(
        transform: Matrix4.rotationY(_animation.value),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: IndexedStack(
            index: _index,
            children: <Widget>[
              LotteryFirstPage(),
              LotterySecondsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

/// 抽奖的第一页
class LotteryFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.deepOrangeAccent,
    );
  }
}

/// 抽奖的第二页
class LotterySecondsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.lightBlueAccent,
    );
  }
}
