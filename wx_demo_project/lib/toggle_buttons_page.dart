import 'package:flutter/material.dart';

class ToggleButtonsPage extends StatefulWidget {
  @override
  _ToggleButtonsPageState createState() => _ToggleButtonsPageState();
}

class _ToggleButtonsPageState extends State<ToggleButtonsPage> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ToggleButtonsPage'),
        ),
        body: Center(
          child: ToggleButtons(
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.call),
              Icon(Icons.cake),
            ],
            onPressed: (int index) {
              int count = 0;
              isSelected.forEach((bool val) {
                if (val) count++;
              });

              if (isSelected[index] && count < 2)
                return;

              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
        ));
  }
}
