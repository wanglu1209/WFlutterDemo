import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController _controller = TextEditingController(text: '123');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TestPage'),
        ),
        body: Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(flex: 1,child: Padding(
                padding: const EdgeInsets.only(right:18.0),
                child: TextFormField(
                  controller: _controller,
                ),
              )),
              RaisedButton(onPressed: () {
                Navigator.of(context).pop();
              })
            ],
          ),
        ));
  }
}
