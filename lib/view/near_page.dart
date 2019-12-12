import 'package:flutter/material.dart';
class NearPage extends StatefulWidget {
  NearPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NearPageState createState() => _NearPageState();

}
class _NearPageState extends State<NearPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(title: const Text('附近')),
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            new Text("nearPage"),
          ],
        ));
  }
}