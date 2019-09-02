import 'package:flutter/material.dart';
import 'package:wx_demo_project/custom_checkbox.dart';

import 'login_page2.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _opacityController;
  Animation<double> _animation;
  double logoMargin = 160;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _opacityController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _opacityAnimation =
        CurvedAnimation(parent: _opacityController, curve: Curves.linear)
            .drive(Tween(begin: 1, end: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0922),
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                child: AnimatedContainer(
                  alignment: Alignment.topCenter,
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(top: logoMargin),
                  child: Image.asset(
                    'images/icon_login_logo.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                opacity: _opacityAnimation.value,
              );
            },
          ),
          AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 280,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 145),
                    child: RaisedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              Future.delayed(Duration(milliseconds: 50), () {
                                _animationController.forward();
                              });
                              return AnimatedUserAgreement(
                                animation: _animation,
                              );
                            }).then((va) {
                          _opacityController.forward().then((v) {
                            Future.delayed(Duration(milliseconds: 300),(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage2();
                                    },
                                    fullscreenDialog: true),
                              );
                            });
                          });
                          setState(() {
                            logoMargin = 100;
                          });
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: Color(0xFF58E7ED),
                      child: Text(
                        'Registrenren',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 280,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 70),
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          side: BorderSide(color: Color(0xFF58E7ED), width: 3)),
                      color: Colors.transparent,
                      child: Text(
                        'Inloggen',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF58E7ED)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class UserAgreementDialog extends StatefulWidget {
  @override
  _UserAgreementDialogState createState() => _UserAgreementDialogState();
}

class _UserAgreementDialogState extends State<UserAgreementDialog>
    with TickerProviderStateMixin {
  bool checkState = false;
  List<Color> btnColors = [Color(0xFF58E7ED), Color(0xFFB8F0F2)];
  Color btnColor;
  double btnWidth = 280;
  double btnHeight = 60;
  double btnMargin = 5;
  int btnDuration = 100;
  int index = 0;

  AnimationController _controller;
  AnimationController _widthController;
  Tween<double> _scaleTween;
  Tween<double> _widthTween;
  Animation<double> _animation;
  Animation<double> _widthAnimation;
  Color foregroundColor = Colors.white10;

  @override
  void initState() {
    super.initState();
    btnColor = btnColors[0];
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _scaleTween = Tween(begin: 0, end: 1);
    _widthTween = Tween(begin: 280, end: 60);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    _widthAnimation =
        CurvedAnimation(parent: _widthController, curve: Curves.easeInOutBack)
            .drive(_widthTween);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            foregroundDecoration: BoxDecoration(color: foregroundColor),
            duration: Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: TextStyle(height: 1.4),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Jonw privacy is belangrijk voor ons. jouw now persoonijjke gegevens rowden verwtk in njal oversdffmming met ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'onze pridvaojgltoand',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF58E7ED)),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 8, bottom: 20),
                      child: CustomCheckbox(
                        value: checkState,
                        activeColor: Color(0xFF58E7ED),
                        useTapTarget: false,
                        onChanged: (v) {
                          setState(() {
                            checkState = v;
                          });
                        },
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(height: 1.2),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Ik acceptter de ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Aligemene Voorwaarden',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF58E7ED)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTapDown: (d) {
              setState(() {
                btnColor = btnColors[1];
              });
            },
            onTapUp: (d) {
              Future.delayed(Duration(milliseconds: 60), () {
                setState(() {
                  foregroundColor = Colors.white70;
                  btnColor = btnColors[0];
                  index = 1;
                });
                _widthController.forward();
                Future.delayed(Duration(milliseconds: 200), () {
                  _controller.forward().then((va) {
                    Navigator.pop(context);
                  });
                });
              });
            },
            onTapCancel: () {
              setState(() {
                btnColor = btnColors[0];
              });
            },
            child: AnimatedBuilder(
              animation: _widthAnimation,
              builder: (BuildContext context, Widget child) {
                return Container(
                  width: _widthAnimation.value,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: btnColor),
                  margin: EdgeInsets.only(top: btnMargin),
                  height: btnHeight,
                  child: IndexedStack(
                    alignment: Alignment.center,
                    index: index,
                    children: <Widget>[
                      Text(
                        'Accepteer',
                        style: TextStyle(fontSize: 18),
                      ),
                      ScaleTransition(
                        scale: _scaleTween.animate(_animation),
                        child: Image.asset(
                          'images/ok.png',
                          width: 35,
                          height: 35,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedUserAgreement extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 20, end: 0);

  AnimatedUserAgreement({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: 270,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: UserAgreementDialog(),
                margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
