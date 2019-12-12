import 'package:flutter/material.dart';
class MinePage extends StatefulWidget {
  MinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MinePageState createState() => _MinePageState();

}
class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(title: const Text('我的')),
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            new Text("minePage"),
          ],
        ));
  }
}