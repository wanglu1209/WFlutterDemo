import 'package:flutter/material.dart';
import 'package:wx_demo_project/safe_area_page.dart';

import 'HeroDetailPage.dart';
import 'animated_container_page.dart';
import 'back_drop_filter_page.dart';
import 'future_builder_page.dart';
import 'hero_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'SafeAreaDemo': (context) => SafeAreaDemo(),
        'AnimatedContainerDemo': (context) => AnimatedContainerDemo(),
        'FutureBuilderPage': (context) => FutureBuilderPage(),
        'BackdropFilterPage': (context) => BackdropFilterPage(),
        'HeroPage': (context) => HeroPage(),
        'HeroDetailPage': (context) => HeroDetailPage(),
      },
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
                navigateTo('SafeAreaDemo');
              },
              child: Text('SafeAreaDemo'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo('AnimatedContainerDemo');
              },
              child: Text('AnimatedContainerDemo'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo('FutureBuilderDemo');
              },
              child: Text('FutureBuilderDemo'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo('BackdropFilterPage');
              },
              child: Text('BackdropFilterPage'),
            ),
            RaisedButton(
              onPressed: () {
                navigateTo('HeroPage');
              },
              child: Text('HeroPage'),
            ),
          ],
        ),
      ),
    );
  }

  navigateTo(name) {
    Navigator.of(context).pushNamed(name);
  }
}
