import 'package:flutter/material.dart';

class ClipImagePage extends StatefulWidget {
  @override
  _ClipImagePageState createState() => _ClipImagePageState();
}

class _ClipImagePageState extends State<ClipImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('裁切图片'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            
            Image.asset('images/bg.jpg', height: 300,),
            Container(height: 1,color: Colors.black,margin: EdgeInsets.symmetric(vertical: 10),),
            ClipPath(
              clipper: MyClipper(),
              child: Image.asset('images/bg.jpg', height: 300,),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    // 从 60，0 开始
    path.moveTo(60, 0);
    // 二阶贝塞尔曲线画弧
    path.quadraticBezierTo(0, 0, 0, 60);
    // 连接到底部
    path.lineTo(0, size.height / 1.2);
    // 三阶贝塞尔曲线画弧
    path.cubicTo(size.width / 4, size.height, size.width / 4 * 3, size.height / 1.5, size.width, size.height / 1.2);
    // 再连接回去
    path.lineTo(size.width, 60);
    // 再用二阶贝塞尔曲线画弧
    path.quadraticBezierTo(size.width - 60, 60, size.width - 60, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}