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
    _controller.addListener((){
//      print(_controller.offset);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TestPage'),
        ),
        body: PageView(
          controller: _controller,
          physics: CustomScrollableScrollPhysics(),
          children: ['A', 'B', 'C'].map((s) => Center(child: Text(s),)).toList(),
        ));
  }
}

class CustomScrollableScrollPhysics extends ScrollPhysics {
  /// Creates scroll physics that does not let the user scroll.
  const CustomScrollableScrollPhysics({ ScrollPhysics parent }) : super(parent: parent);

  @override
  NeverScrollableScrollPhysics applyTo(ScrollPhysics ancestor) {
    return NeverScrollableScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) => true;

  @override
  bool get allowImplicitScrolling => false;
}
