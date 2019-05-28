import 'package:flutter/material.dart';

import 'Person.dart';
import 'PersonNotifier.dart';

class ValueListenableBuildPage extends StatefulWidget {
  @override
  _ValueListenableBuildPageState createState() =>
      _ValueListenableBuildPageState();
}

class _ValueListenableBuildPageState extends State<ValueListenableBuildPage> {
  PersonNotifier _valueListenable = PersonNotifier(Person(name: 'WAnimal', age: 18, head: 'images/bg.jpg'));

  Widget _contentWidget;
  @override
  void initState() {
    super.initState();
    _contentWidget =
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文',
            style: TextStyle(fontSize: 16),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableBuildPage'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _valueListenable,
        builder: (BuildContext context, Person value, Widget child) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ClipOval(
                    child: Image.asset(
                      value.head,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${value.name}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'age：${value.age}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipOval(
                                child: Image.asset(
                                  value.head,
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    '${value.name}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  'age: ${value.age}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        child
                      ],
                    );
                  },
                )
              ],
            ),
          );
        },
        child: _contentWidget,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _valueListenable.changePersonName("91李先生");
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
