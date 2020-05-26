import 'package:flutter/material.dart';

import 'gif_image.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage>
    with SingleTickerProviderStateMixin {
  GifController _controller;
  bool _first = true;

  @override
  void initState() {
    super.initState();
    _controller =
        GifController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFadePage'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _first = !_first;
          });
        },
        child: Center(
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            firstChild: Container(
              color: Colors.cyan,
              child: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal, size: 100.0),
            ),
            secondChild: Container(
                color: Colors.deepOrangeAccent,
                child: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 200.0)),
            crossFadeState:
                _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
