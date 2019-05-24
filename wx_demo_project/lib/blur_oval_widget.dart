import 'dart:ui';

import 'package:flutter/material.dart';

class BlurOvalWidget extends StatelessWidget {
  final Widget _widget;
  double _padding = 10;

  BlurOvalWidget(this._widget, {double padding = 0}) {
    if (padding != 0) this._padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.white10,
          padding: EdgeInsets.all(_padding),
          child: _widget,
        ),
      ),
    );
  }
}
