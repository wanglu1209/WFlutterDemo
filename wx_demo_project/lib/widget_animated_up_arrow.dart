import 'package:flutter/material.dart';

class AnimatedUpArrowWidget extends StatefulWidget {
  @override
  _AnimatedUpArrowWidgetState createState() => _AnimatedUpArrowWidgetState();
}

class _AnimatedUpArrowWidgetState extends State<AnimatedUpArrowWidget> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1400));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          _animationController.reset();
        });
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedUpArrow(
      animation: _animation,
    );
  }
}

class AnimatedUpArrow extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 1, end: 0);
  final Tween<double> _marginTween = Tween(begin: 0, end: 50);

  AnimatedUpArrow({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);


  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return SafeArea(
      child: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.only(bottom: _marginTween.evaluate(animation)),
            child: Image.asset("images/UP.png", width: 20, height: 24,),
          ),
        ),
      ),
    );
  }
}
