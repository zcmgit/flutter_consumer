import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer, Provider;
export 'package:provider/provider.dart';
import 'package:flutter_consumer/viewmodel/banner_provide.dart';

class Store {
  static BuildContext context;
  static BuildContext widgetCtx;

  //  我们将会在main.dart中runAPP实例化init
  static init({context, child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BannerProvider())
      ],
      child: child,
    );
  }

  //  通过Provider.value<T>(context)获取状态数据
  static T value<T>(context) {
    return Provider.of(context);
  }

  //  通过Consumer获取状态数据
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}