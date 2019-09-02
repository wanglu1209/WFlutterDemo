import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> with TickerProviderStateMixin {
  List<String> strs = ['Hi,', 'wat ', 'is ', 'je ', 'naam?'];
  List<AnimationController> _strController = [];
  List<CurvedAnimation> _strPositionAnimation = [];
  double opacity = 0;
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    strs.forEach((s) {
      var controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 600));
      _strController.add(
        controller,
      );
      _strPositionAnimation.add(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      ));
    });

    _strPositionAnimation[strs.length - 1].addStatusListener((status){
      if(status == AnimationStatus.completed){
        setState(() {
          opacity = 1;
          FocusScope.of(context).requestFocus(myFocusNode);
        });
      }
    });

    Future.delayed(Duration(milliseconds: 300), () {
      startAnim();
    });
  }

  void startAnim() async {
    for (int i = 0; i < strs.length; i++) {
      Future.delayed(
          Duration(
            milliseconds: i * 100,
          ), () {
        _strController[i].forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.arrow_forward, color: Colors.black87,),backgroundColor: Color(0xFF58E7ED),),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF0A0922),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        margin: EdgeInsets.only(top: 40),
        child: DefaultTextStyle(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AnimatedStrWidget(
                  animation: _strPositionAnimation[0], child: Text(strs[0])),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    AnimatedStrWidget(
                        animation: _strPositionAnimation[1],
                        child: Text(strs[1])),
                    AnimatedStrWidget(
                        animation: _strPositionAnimation[2],
                        child: Text(strs[2])),
                    AnimatedStrWidget(
                        animation: _strPositionAnimation[3],
                        child: Text(strs[3])),
                    AnimatedStrWidget(
                        animation: _strPositionAnimation[4],
                        child: Text(strs[4])),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: opacity,
                duration: Duration(milliseconds: 300),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xFF3D3D4D)),
                  child: TextField(
                    focusNode: myFocusNode,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Jouw naam',
                        hintStyle: TextStyle(color: Colors.white54)),
                  ),
                ),
              )
            ],
          ),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class AnimatedStrWidget extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<Offset> _offsetTween =
      Tween(begin: Offset(0, 3), end: Offset(0, 0));
  final Widget child;

  AnimatedStrWidget(
      {Key key, @required Animation<double> animation, @required this.child})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation) < 0
          ? 0
          : _opacityTween.evaluate(animation) > 1
              ? 1
              : _opacityTween.evaluate(animation),
      child: SlideTransition(
        position: _offsetTween.animate(animation),
        child: child,
      ),
    );
  }
}
