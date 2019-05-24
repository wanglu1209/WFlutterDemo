import 'package:flutter/material.dart';
import 'package:wx_demo_project/safe_area_page.dart';

import 'animated_container_page.dart';
import 'back_drop_filter_page.dart';
import 'future_builder_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                navigateTo(SafeAreaDemo());
              },
              child: Text('SafeAreaDemo'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo(AnimatedContainerDemo());
              },
              child: Text('AnimatedContainerDemo'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo(FutureBuilderPage());
              },
              child: Text('FutureBuilderDemo'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo(BackdropFilterPage());
              },
              child: Text('BackdropFilterPage'),
            ),
          ],
        ),
      ),
    );
  }

  navigateTo(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
