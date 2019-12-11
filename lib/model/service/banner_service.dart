import 'package:rxdart/rxdart.dart';
import 'package:flutter_consumer/network/base.dart';

abstract class BannerService{

  Observable<BaseResponse> getBanner(String positionCode,{longitude,latitude});

  getBannerNew(String positionCode,{longitude,latitude});
}