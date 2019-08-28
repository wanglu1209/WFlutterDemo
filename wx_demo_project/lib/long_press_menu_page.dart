import 'package:flutter/material.dart';

class LongPressMenuPage extends StatefulWidget {
  @override
  _LongPressMenuPageState createState() => _LongPressMenuPageState();
}

class _LongPressMenuPageState extends State<LongPressMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LongPressMenuPage'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: (){
            Navigator.push(context, TestPopup());
          },
          onPanUpdate: (details){
            print('onPanUpdate --- ${details.globalPosition}');
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}


class TestPopup extends PopupRoute{
  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Center(
      child: GestureDetector(
        onLongPress: (){
          print('onLongPress');
        },
        onPanUpdate: (details){
          print('onPanUpdate --- ${details.globalPosition}');
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration.zero;

}
