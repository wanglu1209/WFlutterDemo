import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  IconData _actionIcon = Icons.delete;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedSwitcherPage'),
          actions: <Widget>[
            AnimatedSwitcher(
              transitionBuilder: (child, anim){
                return ScaleTransition(child: child,scale: anim);
              },
              duration: Duration(milliseconds: 300),
              child: IconButton(
                  key: ValueKey(_actionIcon),
                  icon: Icon(_actionIcon),
                  onPressed: () {
                    setState(() {
                      if (_actionIcon == Icons.delete)
                        _actionIcon = Icons.done;
                      else
                        _actionIcon = Icons.delete;
                    });
                  }),
            )
          ],
        ),
        body: Container());
  }
}
