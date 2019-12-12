import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_consumer/viewmodel/banner_provide.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//class HomePage extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    // 创建 Widget 持有 CounterNotifier 数据
//    return ChangeNotifierProvider.value(
//      value: CommentProvide(),
//      child: MaterialApp(
//        title: 'Privoder Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        color: Colors.white,
//        home: MyHomePage(title: 'Provider 测试页面'),
//      ),
//    );
//  }
//}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(title: const Text('首页')),
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            new Text("home"),
          ],
        ));
  }

  //首页banner
  banner() {
    var imgs = [
      'https://www.wanandroid.com/blogimgs/acc23063-1884-4925-bdf8-0b0364a7243e.png'
    ];
    return new Container(
      height: 200,
      padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),
      child: Consumer<CommentProvide>(
        builder: (context, CommentProvide provide, _) => Swiper(
          itemCount: imgs.length,
          loop: true,
          autoplay: true,
          duration: 500,
          //触发时是否停止播放
          autoplayDisableOnInteraction: true,
          //item数量
          itemBuilder: (BuildContext context, int index) {
            //item构建
            return new Image.network(
//                    provide.getList[index].source,
              imgs[index],
              fit: BoxFit.fill,
            );
          },
          pagination: new SwiperPagination(),
          onTap: (int index) {
            print("index-----" + index.toString());
          },
        ),
      ),
    );
  }
}
