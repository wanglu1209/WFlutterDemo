import 'package:flutter/material.dart';

class WReorderData {
  Widget widget;
  BuildContext context;
  double height;

  WReorderData(this.widget);
}

typedef IndexChanged<int> = void Function(int a, int b);

class WReorderList extends StatefulWidget {
  final List<Widget> children;
  final IndexChanged onIndexChanged;
  final Duration duration;

  WReorderList({
    Key key,
    @required this.children,
    @required this.onIndexChanged,
    this.duration = const Duration(milliseconds: 500)
  }) : super(key: key);

  @override
  WReorderListState createState() => WReorderListState();

  static WReorderListState of(BuildContext context, {bool nullOk = false}) {
    assert(context != null);
    assert(nullOk != null);
    final WReorderListState result =
    context.ancestorStateOfType(const TypeMatcher<WReorderListState>());
    if (nullOk || result != null) return result;
    throw FlutterError(
        'WReorderList.of() called with a context that does not contain an WReorderList.');
  }
}

class WReorderListState extends State<WReorderList> with TickerProviderStateMixin<WReorderList> {
  List<WReorderData> data;
  List<int> swapIndex = [];

  @override
  void initState() {
    super.initState();
    data = widget.children.map((d) => WReorderData(d)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Builder(builder: (context) {
          Future.delayed(Duration(milliseconds: 100), () {
            data[index].context = context;
            data[index].height = context.size.height;
          });
          return swapIndex.contains(index)
              ? Container(height: data[index].height)
              : data[index].widget;
        });
      },
      itemCount: widget.children.length,
    );
  }

  swap(int i, int j) {
    setState(() {
      swapIndex = [i, j];
    });
    Navigator.push(context, WPopupPage(data1: data[i], data2: data[j], duration: widget.duration))
        .then((v) {
      setState(() {
        var temp = data[i];
        data[i] = data[j];
        data[j] = temp;
        widget.onIndexChanged(i, j);
        swapIndex = [];
      });
    });
  }
}

class WPopupPage extends PopupRoute {
  final WReorderData data1;
  final WReorderData data2;
  final Duration duration;

  WPopupPage({@required this.data1, @required this.data2, @required this.duration});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SwapIndexWidget(
      data1: data1,
      data2: data2,
      duration: duration,
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 100);
}

class SwapIndexWidget extends StatefulWidget {
  final WReorderData data1;
  final WReorderData data2;
  final Duration duration;

  SwapIndexWidget({@required this.data1, @required this.data2, @required this.duration});

  @override
  _SwapIndexWidgetState createState() => _SwapIndexWidgetState();
}

class _SwapIndexWidgetState extends State<SwapIndexWidget> {
  RenderBox rb1;
  RenderBox rb2;
  Rect child1Rect;
  Rect child2Rect;
  Widget child1;
  Widget child2;

  @override
  void initState() {
    super.initState();
    rb1 = widget.data1.context.findRenderObject();
    rb2 = widget.data2.context.findRenderObject();
    child1Rect = Rect.fromPoints(rb1.localToGlobal(Offset.zero),
        rb1.localToGlobal(Offset(rb1.size.width, rb1.size.height)));
    child2Rect = Rect.fromPoints(rb2.localToGlobal(Offset.zero),
        rb2.localToGlobal(Offset(rb2.size.width, rb2.size.height)));

    child1 = widget.data1.widget;
    child2 = widget.data2.widget;

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        var temp = child1Rect;
        child1Rect = child2Rect;
        child2Rect = temp;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          child1 = Container();
          child2 = Container();
        });
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned.fromRect(
            duration: widget.duration,
            rect: child1Rect,
            child: child1,
          ),
          AnimatedPositioned.fromRect(
            duration: widget.duration,
            rect: child2Rect,
            child: child2,
          ),
        ],
      ),
    );
  }
}