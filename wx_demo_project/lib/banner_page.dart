import 'package:flutter/material.dart';
import 'package:wx_demo_project/widget_banner.dart';

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final List<String> _imgData = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563852038472&di=de56cb53c9725ec5ee7cc9ea04d3e423&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0183cb5859e975a8012060c82510f6.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563815013125&di=6e774e0ec425a5036a9f0b657c6f7d39&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01a949581aeb9fa84a0d304fd05eeb.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563815013123&di=d5f7acf8d7fb6e81ff8cc521f33481f8&imgtype=0&src=http%3A%2F%2Fpic.97ui.com%2Fyc_pic%2F00%2F00%2F08%2F79%2F53e3829fe1012cf8b092a602b7ba0e16.jpg%2521w1200",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BannerPage'),
        ),
        body: CustomBanner(_imgData)
    );
  }
}
