import 'package:flutter/material.dart';
class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListPageState createState() => _ListPageState();

}
class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(title: const Text('精选')),
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            new Text("listPage"),
          ],
        ));
  }
}