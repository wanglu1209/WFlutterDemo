import 'package:flutter/material.dart';

class ShaderMaskPage extends StatefulWidget {
  @override
  _ShaderMaskPageState createState() => _ShaderMaskPageState();
}

class _ShaderMaskPageState extends State<ShaderMaskPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _animation;
  double _gradientValue = 0;
  List<Color> _colors = [
    Colors.deepOrangeAccent,
    Colors.deepOrange,
    Colors.cyan
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.addStatusListener((state) {
      print(state);
      if (state == AnimationStatus.completed) {
        _colors = [Colors.deepOrangeAccent, Colors.deepOrange, Colors.cyan];
        _controller.reverse();
      } else if (state == AnimationStatus.dismissed) {
        _colors = [Colors.deepOrange, Colors.cyan, Colors.deepOrangeAccent];
        _controller.forward();
      }
    });
    _controller.addListener(() {
      setState(() {
        _gradientValue = _animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShaderMskPage'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _controller.forward(),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) {
              return LinearGradient(colors: _colors, stops: [
                0 + _gradientValue * 0.2,
                _gradientValue * 0.8,
                1 - _gradientValue * 0.3
              ]).createShader(bounds);
            },
            child: ListView.builder(
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text('This ListTile Title $index'),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}
