import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<AnimatedIcon> _icons;
  List<String> _names;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..drive(Tween(begin: 0, end: 1))
      ..duration = Duration(milliseconds: 500);

//    _controller.forward();
//    _controller.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        _controller.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        _controller.forward();
//      }
//    });

    _names = [
      'play_pause',
      'add_event',
      'arrow_menu',
      'close_menu',
      'ellipsis_search',
      'event_add',
      'home_menu',
      'list_view',
      'menu_arrow',
      'menu_close',
      'menu_home',
      'pause_play',
      'search_ellipsis',
      'view_list',
    ];
    _icons = [
      AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.add_event,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.close_menu,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.ellipsis_search,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.event_add,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.home_menu,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.list_view,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.menu_home,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.pause_play,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.search_ellipsis,
        progress: _controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: _controller,
        size: 35,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedIconPage'),
      ),
      body: _buildPausePlayIcon(),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      itemCount: _icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _icons[index],
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(_names[index]),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPausePlayIcon() {
    return Center(
      child: InkWell(
        child: AnimatedIcon(
          icon: AnimatedIcons.pause_play,
          progress: _controller,
          size: 35,
        ),
        onTap: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
