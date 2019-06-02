import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AspectRatioPage'),
        ),
        body: Center(child: _createGridView()));
  }

  Widget _createGridView() {
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      // padding
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 每一行的个数
        mainAxisSpacing: 10, // 间距
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 0.5, // 宽高比
            child: Image.asset(
              'images/game3.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
