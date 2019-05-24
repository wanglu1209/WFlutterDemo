import 'dart:ui';

import 'package:flutter/material.dart';

class BlurImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'images/wanimal.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    color: Colors.white10,
                  ),
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                color: Colors.orangeAccent,
                child: Text('充钱查看更多', style: TextStyle(fontSize: 16),),
                onPressed: (){},
              )
            ],
          )),
    );
  }
}
