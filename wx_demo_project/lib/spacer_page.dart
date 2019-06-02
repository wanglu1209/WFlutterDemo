import 'package:flutter/material.dart';

class SpacerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SpacerPage'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
              ),
              Spacer(flex: 2,),
              Container(
                color: Colors.blue,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 50,
              ),
              Spacer(),
              Container(
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
              ),
            ],
          ),
        )
    );
  }
}
