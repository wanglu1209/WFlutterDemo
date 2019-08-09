import 'package:flutter/material.dart';

class WPopupMenu extends StatefulWidget {
  WPopupMenu({
    @required this.onValueChanged,
    @required this.actions,
    @required this.child,
    this.pressType = PressType.longPress,
    this.pageMaxChildCount = 5,
  })  : assert(onValueChanged != null),
        assert(actions != null && actions.length > 0),
        assert(child != null);

  final ValueChanged<int> onValueChanged;
  final List<String> actions;
  final Widget child;
  final PressType pressType; // 点击方式 长按 还是单击
  final int pageMaxChildCount;

  @override
  _WPopupMenuState createState() => _WPopupMenuState();
}

class _WPopupMenuState extends State<WPopupMenu> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      child: widget.child,
      onTap: () {
        print(_key.currentContext == null);
        if (widget.pressType == PressType.singleClick) {
          Navigator.push(
                  context,
                  _PopupMenuRoute(
                      _key, widget.actions, widget.pageMaxChildCount))
              .then((index) {
            widget.onValueChanged(index);
          });
        }
      },
      onLongPress: () {
        print(_key.currentContext == null);
        if (widget.pressType == PressType.longPress) {
          Navigator.push(
                  context,
                  _PopupMenuRoute(
                      _key, widget.actions, widget.pageMaxChildCount))
              .then((index) {
            widget.onValueChanged(index);
          });
        }
      },
    );
  }
}

enum PressType {
  // 长按
  longPress,
  // 单击
  singleClick,
}

class _PopupMenuRoute extends PopupRoute {
  final GlobalKey btnKey;
  double _height;
  double _width;
  final List<String> actions;
  final int _pageMaxChildCount;

  _PopupMenuRoute(this.btnKey, this.actions, this._pageMaxChildCount) {
    _height = btnKey.currentContext.size.height;
    _width = btnKey.currentContext.size.width;
  }

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, 2.0 / 3.0),
    );
  }

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _MenuPopWidget(btnKey, _height, _width, actions, _pageMaxChildCount);
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}

class _MenuPopWidget extends StatefulWidget {
  final GlobalKey btnKey;
  final double _height;
  final double _width;
  final List<String> actions;
  final int _pageMaxChildCount;

  _MenuPopWidget(this.btnKey, this._height, this._width, this.actions,
      this._pageMaxChildCount);

  @override
  __MenuPopWidgetState createState() => __MenuPopWidgetState();
}

class __MenuPopWidgetState extends State<_MenuPopWidget> {
  int _curPage = 0;
  final double _pageWidth = 300;
  final double _arrowWidth = 40;
  final double _separatorWidth = 1;

  RenderBox button;
  RenderBox overlay;
  RelativeRect position;

  @override
  void initState() {
    super.initState();
    button = widget.btnKey.currentContext.findRenderObject();
    overlay =
        Overlay.of(widget.btnKey.currentContext).context.findRenderObject();
    position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(Offset.zero, ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    // 这里计算出来 当前页的 child 一共有多少个
    int _curPageChildCount =
        (_curPage + 1) * widget._pageMaxChildCount > widget.actions.length
            ? widget.actions.length % widget._pageMaxChildCount
            : widget._pageMaxChildCount;

    double _curArrowWidth = 0;
    int _curArrowCount = 0; // 一共几个箭头

    if (widget.actions.length > widget._pageMaxChildCount) {
      // 数据长度大于 widget._pageMaxChildCount
      if (_curPage == 0) {
        // 如果是第一页
        _curArrowWidth = _arrowWidth;
        _curArrowCount = 1;
      } else {
        // 如果不是第一页 则需要也显示左箭头
        _curArrowWidth = _arrowWidth * 2;
        _curArrowCount = 2;
      }
    }

    double _curPageWidth = _pageWidth +
        (_curPageChildCount - 1 + _curArrowCount) * _separatorWidth +
        _curArrowWidth;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Builder(
        builder: (BuildContext context) {
          return CustomSingleChildLayout(
            // 这里计算偏移量
            delegate: _PopupMenuRouteLayout(position, widget._height,
                Directionality.of(widget.btnKey.currentContext), widget._width),
            child: SizedBox(
              height: 42,
              width: _curPageWidth,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // 左箭头：判断是否是第一页，如果是第一页则不显示
                        _curPage == 0
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    _curPage--;
                                  });
                                },
                                child: Container(
                                  width: _arrowWidth,
                                  child: Image.asset(
                                    'images/left_white.png',
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                        // 左箭头：判断是否是第一页，如果是第一页则不显示
                        _curPage == 0
                            ? Container()
                            : Container(
                                width: 1,
                                color: Colors.grey,
                              ),

                        // 中间是ListView
                        _buildList(_curPageChildCount, _curPageWidth,
                            _curArrowWidth, _curArrowCount),

                        // 右箭头：判断是否有箭头，如果有就显示，没有就不显示
                        _curArrowCount > 0
                            ? Container(
                                width: 1,
                                color: Colors.grey,
                              )
                            : Container(),
                        _curArrowCount > 0
                            ? InkWell(
                                onTap: () {
                                  if ((_curPage + 1) *
                                          widget._pageMaxChildCount <
                                      widget.actions.length)
                                    setState(() {
                                      _curPage++;
                                    });
                                },
                                child: Container(
                                  width: _arrowWidth,
                                  child: Image.asset(
                                    (_curPage + 1) *
                                                widget._pageMaxChildCount >=
                                            widget.actions.length
                                        ? 'images/right_gray.png'
                                        : 'images/right_white.png',
                                    fit: BoxFit.none,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildList(int _curPageChildCount, double _curPageWidth,
      double _curArrowWidth, int _curArrowCount) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: _curPageChildCount,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pop(
                context, _curPage * widget._pageMaxChildCount + index);
          },
          child: SizedBox(
            width: (_curPageWidth -
                    _curArrowWidth -
                    (_curPageChildCount - 1 + _curArrowCount) *
                        _separatorWidth) /
                _curPageChildCount,
            child: Center(
              child: Text(
                widget.actions[_curPage * widget._pageMaxChildCount + index],
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          width: 1,
          color: Colors.grey,
        );
      },
    );
  }
}

const double _kMenuScreenPadding = 8.0;

// Positioning of the menu on the screen.
class _PopupMenuRouteLayout extends SingleChildLayoutDelegate {
  _PopupMenuRouteLayout(
      this.position, this.selectedItemOffset, this.textDirection, this.width);

  // Rectangle of underlying button, relative to the overlay's dimensions.
  final RelativeRect position;

  // The distance from the top of the menu to the middle of selected item.
  //
  // This will be null if there's no item to position in this way.
  final double selectedItemOffset;

  // Whether to prefer going to the left or to the right.
  final TextDirection textDirection;

  final double width;

  // We put the child wherever position specifies, so long as it will fit within
  // the specified parent size padded (inset) by 8. If necessary, we adjust the
  // child's position so that it fits.

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // The menu can be at most the size of the overlay minus 8.0 pixels in each
    // direction.
    return BoxConstraints.loose(constraints.biggest -
        const Offset(_kMenuScreenPadding * 2.0, _kMenuScreenPadding * 2.0));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    // Find the ideal vertical position.
    double y;
    if (selectedItemOffset == null) {
      y = position.top;
    } else {
      y = position.top +
          (size.height - position.top - position.bottom) / 2.0 -
          selectedItemOffset;
    }

    // Find the ideal horizontal position.
    double x;
    if (position.left > position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
//      x = childSize.width - (size.width - position.right);
      x = position.left + width - childSize.width;
    } else if (position.left < position.right) {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
    } else {
      // Menu button is equidistant from both edges, so grow in reading direction.
      assert(textDirection != null);
      switch (textDirection) {
        case TextDirection.rtl:
          x = size.width - position.right - childSize.width;
          break;
        case TextDirection.ltr:
          x = position.left;
          break;
      }
    }

    // Avoid going outside an area defined as the rectangle 8.0 pixels from the
    // edge of the screen in every direction.
    if (x < _kMenuScreenPadding)
      x = _kMenuScreenPadding;
    else if (x + childSize.width > size.width - _kMenuScreenPadding)
      x = size.width - childSize.width - _kMenuScreenPadding;
    if (y < _kMenuScreenPadding)
      y = _kMenuScreenPadding;
    else if (y + childSize.height > size.height - _kMenuScreenPadding)
      y = size.height - childSize.height - _kMenuScreenPadding;
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupMenuRouteLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}
