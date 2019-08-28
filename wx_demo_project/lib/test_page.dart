import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

double offset = 0;

class _TestPageState extends State<TestPage> {
  PageController _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
//      print(_controller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage'),
      ),
      body: SafeArea(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ),
        ),
      ),

    );
  }
}
