import 'package:flutter/material.dart';
import 'package:wx_demo_project/popup_menu_button_page.dart';
import 'package:wx_demo_project/popup_route_page.dart';
import 'package:wx_demo_project/reorderable_list_view_page.dart';
import 'package:wx_demo_project/safe_area_page.dart';
import 'package:wx_demo_project/shader_mask_page.dart';
import 'package:wx_demo_project/spacer_page.dart';
import 'package:wx_demo_project/spread_page.dart';
import 'package:wx_demo_project/stepper_page.dart';
import 'package:wx_demo_project/slide_list_page.dart';
import 'package:wx_demo_project/test_page.dart';
import 'package:wx_demo_project/toggle_buttons_page.dart';
import 'package:wx_demo_project/tween_animation_builder_page.dart';
import 'package:wx_demo_project/valuelistenablebuilder_page.dart';
import 'package:wx_demo_project/w_reorder_list_page.dart';

import 'HeroDetailPage.dart';
import 'animated_container_page.dart';
import 'animated_cross_fade_page.dart';
import 'animated_icon_page.dart';
import 'animated_list_page.dart';
import 'animated_switcher_page.dart';
import 'animation_page.dart';
import 'aspect_ratio_page.dart';
import 'back_drop_filter_page.dart';
import 'banner_page.dart';
import 'clip_image_page.dart';
import 'constrained_box_page.dart';
import 'drop_down_button_page.dart';
import 'expansion_panel_page.dart';
import 'goods_list_page.dart';
import 'login_page.dart';
import 'long_press_menu_page.dart';
import 'lottery_page.dart';
import 'mergeable_material_page.dart';
import 'wrap_page.dart';
import 'dismissible_page.dart';
import 'draggable_page.dart';
import 'future_builder_page.dart';
import 'hero_page.dart';

void main() => runApp(MyApp());

double screenWidth;

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
        'AnimatedSwitcherPage': (context) => AnimatedSwitcherPage(),
        'PopupMenuButtonPage': (context) => PopupMenuButtonPage(),
        'PopupRoutePage': (context) => PopupRoutePage(),
        'TestPage': (context) => TestPage(),
        'LongPressMenuPage': (context) => LongPressMenuPage(),
        'AnimationPage': (context) => AnimationPage(),
        'SpreadPage': (context) => SpreadPage(),
        'LoginPage': (context) => LoginPage(),
        'ToggleButtonsPage': (context) => ToggleButtonsPage(),
        'LotteryPage': (context) => LotteryPage(),
        'SlideListPage': (context) => SlideListPage(),
        'WReorderListPage': (context) => WReorderListPage(),
        'ConstrainedBoxPage': (context) => ConstrainedBoxPage(),
        'TweenAnimationBuilderPage': (context) => TweenAnimationBuilderPage(),
        'ShaderMaskPage': (context) => ShaderMaskPage(),
        'MergeableMaterialPage': (context) => MergeableMaterialPage(),
        'AnimatedCrossFadePage': (context) => AnimatedCrossFadePage(),
        'GoodsListPage': (context) => GoodsListPage(),
        'ClipImagePage': (context) => ClipImagePage(),
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

    screenWidth = MediaQuery.of(context).size.width;
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
              RaisedButton(
                onPressed: () {
                  navigateTo('AnimatedSwitcherPage');
                },
                child: Text('AnimatedSwitcherPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('PopupMenuButtonPage');
                },
                child: Text('PopupMenuButtonPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('PopupRoutePage');
                },
                child: Text('PopupRoutePage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('TestPage');
                },
                child: Text('TestPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('LongPressMenuPage');
                },
                child: Text('LongPressMenuPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('AnimationPage');
                },
                child: Text('AnimationPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('SpreadPage');
                },
                child: Text('SpreadPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('LoginPage');
                },
                child: Text('LoginPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ToggleButtonsPage');
                },
                child: Text('ToggleButtonsPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('LotteryPage');
                },
                child: Text('LotteryPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('SlideListPage');
                },
                child: Text('SlideListPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('WReorderListPage');
                },
                child: Text('WReorderListPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ConstrainedBoxPage');
                },
                child: Text('ConstrainedBoxPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('TweenAnimationBuilderPage');
                },
                child: Text('TweenAnimationBuilderPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ShaderMaskPage');
                },
                child: Text('ShaderMaskPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('MergeableMaterialPage');
                },
                child: Text('MergeableMaterialPage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('AnimatedCrossFadePage');
                },
                child: Text('AnimatedCrossFadePage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('GoodsListPage');
                },
                child: Text('添加购物车效果'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('ClipImagePage');
                },
                child: Text('ClipImagePage'),
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
