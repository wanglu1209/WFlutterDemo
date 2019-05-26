import 'package:flutter/material.dart';

import 'Person.dart';

const String constString = "";

class DartPage extends StatelessWidget {
  final String _finalString;

  DartPage(this._finalString);

  @override
  Widget build(BuildContext context) {
    demo('HaSaKi', age: 18);

    Person()
      ..name = '哈哈'
      ..age = 18
      ..say();

    return Container();
  }

  String demo(String name, {int age = 18}) {
    String result = '我的名字叫$name';
    if (age != null) {
      result += '，我今年$age岁了';
    }
    return result;
  }
}
