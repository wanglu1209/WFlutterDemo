import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

double offset = 0;

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin{
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: Container(
              child: Image.asset('images/bg.jpg', fit: BoxFit.fill,),
            ),
            bottom: PreferredSize(
                child: TabBar(tabs: [Tab(text: 'haha'), Tab(text: 'heihei')], controller: TabController( length: 2, vsync: this),),
                preferredSize: Size.fromHeight(100)),
          ),
        ],
      ),
    );
  }
}
