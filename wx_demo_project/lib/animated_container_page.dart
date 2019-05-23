import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  var _colors = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.blue,
    Colors.deepPurple
  ];

  var _alignments = [
    Alignment.center,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  double _weight = 400;
  double _height = 400;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainerDemo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              next();
            });
          },
          child: AnimatedContainer(
            width: _weight,
            height: _height,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            color: _colors[index],
            alignment: _alignments[index],
            child: Text(
              'A',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }

  next() {
    setState(() {
      if(_weight == 400){
        _weight -= 100;
        _height -= 100;
      }else {
        _weight += 100;
        _height += 100;
      }
      index = Random().nextInt(5);
    });
  }
}
