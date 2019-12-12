import 'package:flutter/material.dart';
import 'package:flutter_consumer/util/my_colors.dart';
import 'package:flutter_consumer/view/home_page.dart';
import 'package:flutter_consumer/view/list_page.dart';
import 'package:flutter_consumer/view/near_page.dart';
import 'package:flutter_consumer/view/car_page.dart';
import 'package:flutter_consumer/view/mine_page.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new IndexPageWidget());
  }
}
class IndexPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<IndexPageWidget> {
  var _currentIndex = 0;
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.home),
        title: Text('首页')),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.widgets),
        title: Text('分类')),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.widgets),
        title: Text('附近')),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.add_shopping_cart),
        title: Text('购物车')),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.perm_identity),
        title: Text('我的')),
  ];
  final List<Widget> tabBodies = [
    HomePage(),
    ListPage(),
    NearPage(),
    CarPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,
//      body: IndexedStack(index: _currentIndex, children: tabBodies),
      body: IndexedStack(index: _currentIndex, children: tabBodies),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );

  }
}


