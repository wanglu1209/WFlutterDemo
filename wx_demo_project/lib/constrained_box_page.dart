import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(itemBuilder: (context, index){
        return UnconstrainedBox(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.amber,
          ),
        );
      }, itemCount: 10, separatorBuilder: (BuildContext context, int index) {
        return Container(height: 10,);
      },),
    );
  }
}


