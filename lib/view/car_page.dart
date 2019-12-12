import 'package:flutter/material.dart';
class CarPage extends StatefulWidget {
  CarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CarPageState createState() => _CarPageState();

}
class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(title: const Text('购物车')),
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            new Text("CarPage"),
          ],
        ));
  }
}