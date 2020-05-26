import 'package:flutter/material.dart';

class MergeableMaterialPage extends StatefulWidget {
  @override
  _MergeableMaterialPageState createState() => _MergeableMaterialPageState();
}

class _MergeableMaterialPageState extends State<MergeableMaterialPage> {
  bool state = false;
  List<MergeableMaterialItem> children = [];

  @override
  void initState() {
    super.initState();
    children.addAll(
        [
          MaterialSlice(key: ValueKey('1'), child: Column(
            children: <Widget>[
              GestureDetector(child: Text('test1'), onTap: (){
                setState(() {
                  state = !state;
                });
              },),
              AnimatedCrossFade(
                firstChild: Container(height: 0.0),
                secondChild: Text('test123'),
                firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                crossFadeState: state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              )
            ],
          )),
          MaterialGap(key: ValueKey(-1)),
          MaterialSlice(key: ValueKey('2'), child: Text('test2')),
          MaterialSlice(key: ValueKey('3'), child: Text('test3')),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
            setState(() {
              children.add(
                MaterialSlice(key: ValueKey('122'), child: Text('test123232323')),
              );

            });
          })
        ],
      ),
      body: SingleChildScrollView(
        child: MergeableMaterial(
          children: children,
        ),
      ),
    );
  }
}
