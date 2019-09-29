import 'package:flutter/material.dart';

const double _kMenuScreenPadding = 8.0;

class TrianglePainter extends CustomPainter {
  Paint _paint;
  final Color color;
  final RelativeRect position;
  final Size size;
  final double radius;
  final bool isInverted;
  final double screenWidth;

  TrianglePainter(
      {@required this.color,
      @required this.position,
      @required this.size,
      this.radius = 20,
      this.isInverted = false,
      this.screenWidth}) {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 10
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    // 如果 menu 的长度 大于 child 的长度
    if (size.width > this.size.width) {
      // 靠右
      if (position.left + this.size.width / 2 > position.right) {
        if (screenWidth - (position.left + this.size.width) > size.width / 2 + _kMenuScreenPadding) {
          path.moveTo(size.width / 2, isInverted ? 0 : size.height);
          path.lineTo(size.width / 2 - radius / 2, isInverted ? size.height : 0);
          path.lineTo(size.width / 2 + radius / 2, isInverted ? size.height : 0);
        }else {
          path.moveTo(size.width - this.size.width + this.size.width / 2,
              isInverted ? 0 : size.height);
          path.lineTo(
              size.width - this.size.width + this.size.width / 2 - radius / 2,
              isInverted ? size.height : 0);
          path.lineTo(
              size.width - this.size.width + this.size.width / 2 + radius / 2,
              isInverted ? size.height : 0);
        }
      }else{
        // 靠左
        if(position.left > size.width / 2 + _kMenuScreenPadding){
          path.moveTo(size.width / 2, isInverted ? 0 : size.height);
          path.lineTo(size.width / 2 - radius / 2, isInverted ? size.height : 0);
          path.lineTo(size.width / 2 + radius / 2, isInverted ? size.height : 0);
        }else {
          path.moveTo(this.size.width / 2, isInverted ? 0 : size.height);
          path.lineTo(
              this.size.width / 2 - radius / 2, isInverted ? size.height : 0);
          path.lineTo(
              this.size.width / 2 + radius / 2, isInverted ? size.height : 0);
        }
      }
    } else {
      path.moveTo(size.width / 2, isInverted ? 0 : size.height);
      path.lineTo(
          size.width / 2 - radius / 2, isInverted ? size.height : 0);
      path.lineTo(
          size.width / 2 + radius / 2, isInverted ? size.height : 0);
    }

    path.close();

    canvas.drawPath(
      path,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
