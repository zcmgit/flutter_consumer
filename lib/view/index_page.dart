import 'package:flutter/material.dart';
import 'package:flutter_consumer/util/my_colors.dart';
import 'package:flutter_consumer/view/home_page.dart';
import 'package:flutter_consumer/view/list_page.dart';
import 'package:flutter_consumer/view/near_page.dart';
import 'package:flutter_consumer/view/car_page.dart';
import 'package:flutter_consumer/view/mine_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_consumer/viewmodel/current_index_provider.dart';

class IndexPage extends StatelessWidget{
// TODO: implement build
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.widgets),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.widgets),
        title: Text('附近')
    ),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.add_shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        backgroundColor: MyColors.MAIN_COLORS,
        icon: Icon(Icons.perm_identity),
        title: Text('我的')
    ),
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
    var provider = Provider.of<CurrentIndexProvider>(context);
    var currentIndex = provider.currentIndex;
    return new Container(
        child: Consumer<CurrentIndexProvider>(
            builder: (context, CurrentIndexProvider provide, _) =>Scaffold(
                backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
                bottomNavigationBar: BottomNavigationBar(
                  type:BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  items:bottomItems,
                  onTap: (index){
                    provider.changeIndex(index);
                  },
                ),
                body: IndexedStack(
                index: currentIndex,
                children: tabBodies
            ),
            ),

        ),

    );
  }

}