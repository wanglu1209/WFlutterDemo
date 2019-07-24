import 'package:flutter/material.dart';

import 'dropdown.dart';

String dropdownValue;

class DropDownButtonPage extends StatefulWidget {
  DropDownButtonPage({Key key}) : super(key: key);

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TestDropdownButton<String>(
          hint: Text('我是提示'),
          underline: Container(),
          value: dropdownValue,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}