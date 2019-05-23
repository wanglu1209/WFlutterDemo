import 'package:flutter/material.dart';

class SafeAreaDemo extends StatefulWidget {
  @override
  _SafeAreaDemoState createState() => _SafeAreaDemoState();
}

class _SafeAreaDemoState extends State<SafeAreaDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SafeAreaDemo'),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        left: true,
        right: false,
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, bottom: 18),
            child: Text(
              'Data',
              style: TextStyle(fontSize: 18),
            ),
          );
        }),
      ),
    );
  }
}
