// Flutter code sample for TweenAnimationBuilder

// This example shows an [IconButton] that "zooms" in when the widget first
// builds (its size smoothly increases from 0 to 24) and whenever the button
// is pressed, it smoothly changes its size to the new target value of either
// 48 or 24.

import 'package:flutter/material.dart';
import 'package:wx_demo_project/test_data.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  TweenAnimationBuilderPage({Key key}) : super(key: key);

  @override
  _TweenAnimationBuilderPageState createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: Duration(seconds: 1),
          builder: (BuildContext context, double size, Widget child) {
            return IconButton(
              iconSize: size,
              color: Colors.blue,
              icon: child,
              onPressed: () {
                setState(() {
                  targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                });
              },
            );
          },
          child: Icon(Icons.aspect_ratio),
        ),
      ),
    );
  }
}
