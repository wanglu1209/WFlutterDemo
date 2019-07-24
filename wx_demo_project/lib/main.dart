import 'package:flutter/material.dart';
import 'package:wx_demo_project/reorderable_list_view_page.dart';
import 'package:wx_demo_project/safe_area_page.dart';
import 'package:wx_demo_project/spacer_page.dart';
import 'package:wx_demo_project/stepper_page.dart';
import 'package:wx_demo_project/valuelistenablebuilder_page.dart';

import 'HeroDetailPage.dart';
import 'animated_container_page.dart';
import 'animated_icon_page.dart';
import 'animated_list_page.dart';
import 'aspect_ratio_page.dart';
import 'back_drop_filter_page.dart';
import 'banner_page.dart';
import 'drop_down_button_page.dart';
import 'expansion_panel_page.dart';
import 'wrap_page.dart';
import 'dismissible_page.dart';
import 'draggable_page.dart';
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
        'DismissiblePage': (context) => DismissiblePage(),
        'ValueListenableBuildPage': (context) => ValueListenableBuildPage(),
        'DraggablePage': (context) => DraggablePage(),
        'AspectRatioPage': (context) => AspectRatioPage(),
        'SpacerPage': (context) => SpacerPage(),
        'AnimatedListPage': (context) => AnimatedListPage(),
        'WrapPage': (context) => WrapPage(),
        'ExpansionPanelPage': (context) => ExpansionPanelPage(),
        'AnimatedIconPage': (context) => AnimatedIconPage(),
        'DropDownButtonPage': (context) => DropDownButtonPage(),
        'StepperPage': (context) => StepperPage(),
        'ReorderableListViewPage': (context) => ReorderableListViewPage(),
        'BannerPage': (context) => BannerPage(),
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(child: Column(
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
                  navigateTo('FutureBuilderPage');
                },
                child: Text('FutureBuilderPage'),
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
              RaisedButton(
                onPressed: () {
                  navigateTo('DismissiblePage');
                },
                child: Text('DismissiblePage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ValueListenableBuildPage');
                },
                child: Text('ValueListenableBuildPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('DraggablePage');
                },
                child: Text('DraggablePage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('AspectRatioPage');
                },
                child: Text('AspectRatioPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('SpacerPage');
                },
                child: Text('SpacerPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('AnimatedListPage');
                },
                child: Text('AnimatedListPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('WrapPage');
                },
                child: Text('WrapPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ExpansionPanelPage');
                },
                child: Text('ExpansionPanelPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('AnimatedIconPage');
                },
                child: Text('AnimatedIconPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('DropDownButtonPage');
                },
                child: Text('DropDownButtonPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('StepperPage');
                },
                child: Text('StepperPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ReorderableListViewPage');
                },
                child: Text('ReorderableListViewPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('BannerPage');
                },
                child: Text('BannerPage'),
              ),
            ],
          ),),
        ),
      ),
    );
  }

  navigateTo(name) {
    Navigator.of(context).pushNamed(name);
  }
}
