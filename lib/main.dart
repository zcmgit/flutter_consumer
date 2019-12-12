import 'package:flutter/material.dart';

import 'package:flutter_consumer/view/index_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_consumer/viewmodel/store.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建 Widget 持有 CounterNotifier 数据
    return  Store.init(
        context: context,
        child: MaterialApp(
        title: 'Privoder Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        color: Colors.white,
        home: IndexPage(),
        )
    );
  }
}

