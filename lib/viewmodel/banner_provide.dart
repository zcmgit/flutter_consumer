import 'package:rxdart/rxdart.dart';
import '../model/service/banner_service.dart';
import '../model/impl/banner_service_impl.dart';
import 'package:flutter_consumer/entity/banner_entity.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class CommentProvide extends ChangeNotifier {
  BannerService bannerService = BannerServiceImpl();

  BannerEntity _dataArr ;
  BannerEntity get dataArr => _dataArr;
  set dataArr(BannerEntity arr) {
    _dataArr = arr;
    this.notify();
  }
  List<BannerBeanList> _list = new List();
  List<BannerBeanList> get getList => _list;
  set setList(List<BannerBeanList> list) {
    _list = list;
  }

  int _num = 0;
  int get getNum => _num;
  set setNum(int num){
    _num = num;
  }

  refreshNum(num){
    _num = num;
    notifyListeners();
}

  getBanner(positionCode) async{
    var res = await bannerService.getBannerNew(positionCode);
    final data = json.decode(res.data.toString());
    _list = BannerEntity.fromJson(data['data']).list;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }
}
