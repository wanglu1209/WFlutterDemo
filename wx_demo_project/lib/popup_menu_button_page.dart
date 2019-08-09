import 'package:flutter/material.dart';

class PopupMenuButtonPage extends StatefulWidget {
  @override
  _PopupMenuButtonPageState createState() => _PopupMenuButtonPageState();
}

class _PopupMenuButtonPageState extends State<PopupMenuButtonPage> {

  WhyFarther _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonPage'),
        actions: <Widget>[
          Theme(
            data: ThemeData(cardColor: Colors.red),
            child: PopupMenuButton<WhyFarther>(
              onSelected: (WhyFarther result) {
                setState(() {
                  _selection = result;
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.harder,
                  child: Text('Working a lot harder'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.smarter,
                  child: Text('Being a lot smarter'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.selfStarter,
                  child: Text('Being a self-starter'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.tradingCharter,
                  child: Text('Placed in charge of trading charter'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}

enum WhyFarther {
  harder,
  smarter,
  selfStarter,
  tradingCharter,
}
