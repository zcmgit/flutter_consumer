import 'package:flutter_consumer/model/service/banner_service.dart';
import 'package:flutter_consumer/network/base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_consumer/network/netUtils.dart';
import 'package:flutter_consumer/httpservice/httpmanager.dart';


class BannerServiceImpl extends BannerService{

  @override
  Observable<BaseResponse> getBanner(String positionCode, {longitude, latitude}) {
    // TODO: implement getBanner
    var param = {
      'positionCode': positionCode
    };
    var response = post("/other/bannerList",queryParameters: param);
    return response;
  }

  @override
  getBannerNew(String positionCode, {longitude, latitude}) {
    // TODO: implement getBannerNew
    var param = {
      'positionCode': positionCode
    };
    var response = httpManager.request("/other/bannerList", param, null);
    return response;
  }

}
