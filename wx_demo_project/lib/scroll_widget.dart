import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:wx_demo_project/main.dart';
import 'package:wx_demo_project/test_page.dart';

class ChildScrollWidget extends StatefulWidget {
  @override
  _ChildScrollWidgetState createState() => _ChildScrollWidgetState();
}

class _ChildScrollWidgetState extends State<ChildScrollWidget> {
  List<Widget> gridList = [];
  @override
  void initState() {
    super.initState();
    var grid = Container(
      width: screenWidth,
      child: GridView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        children: [
          'images/bg.jpg',
          'images/bg.png',
          'images/game1.jpg',
          'images/game2.png',
          'images/game3.jpg',
          'images/black_bg.jpg'
        ].map((image) {
          return Image.asset(
            image,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
    gridList.add(grid);
    gridList.add(grid);
    gridList.add(grid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            // Image.asset(
            //   'images/bg.jpg',
            //   width: 300,
            //   height: 300,
            // ),
            CustomPaint(
              size: Size(300, 300),
              painter: MyPainter(),
            )
          ],
        ),
      ),
    );
  }

  //通过 文件读取Image
  Future<ui.Image> loadImageByFile(String path) async {
    var list = await File(path).readAsBytes();
    return loadImageByUint8List(list);
  }

  //通过[Uint8List]获取图片
  Future<ui.Image> loadImageByUint8List(Uint8List list) async {
    ui.Codec codec = await ui.instantiateImageCodec(list);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }
}

class MyPainter extends CustomPainter {
  Paint _paint = Paint()
    ..blendMode = BlendMode.xor
    ..color = Colors.yellow;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTRB(0, 0, 100, 100), _paint);
    canvas.drawRect(
        Rect.fromLTRB(50, 50, 150, 150), _paint..color = Colors.cyan);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
