import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage>
    with SingleTickerProviderStateMixin {
  bool _first = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFadePage'),
      ),
      body: buildGestureDetector(),
    );
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _first = !_first;
        });
      },
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 50,),
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: Container(
                color: Colors.cyan,
                child: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
              ),
              secondChild: Container(
                  color: Colors.deepOrangeAccent,
                  child: const FlutterLogo(
                      style: FlutterLogoStyle.stacked, size: 200.0)),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              layoutBuilder:
                  (topChild, topChildKey, bottomChild, bottomChildKey) {
                return Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      key: topChildKey,
                      child: topChild,
                    ),
                    Positioned(
                      key: bottomChildKey,
                      top: 0,
                      child: bottomChild,
                    ),
                  ],
                );
              },
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: '我是Demo文字，\n', style: TextStyle(fontSize: 16)),
                TextSpan(text: '加微信17610912320进群！', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18))
              ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
