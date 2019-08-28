import 'package:flutter/material.dart';
import 'package:wx_demo_project/widget_animated_up_arrow.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Image.asset(
            "images/black_bg.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: AnimatedUpArrowWidget(),
            bottom: 0,
          )
        ],
      ),
    );
  }
}
