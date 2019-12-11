import 'dart:async';
import 'base.dart';
import 'package:rxdart/rxdart.dart';
import 'httpUtil.dart';
import '../util/log_util.dart';
import '../util/constant.dart';
import '../util/md5.dart';
import 'dart:convert';

Observable<BaseResponse> get(String url, {Map<String, dynamic> params}) =>
    Observable.fromFuture(_get(Constant.baseUrl + url, params: params))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<BaseResponse> _get(String url, {Map<String, dynamic> params}) async {
  var response = await HttpUtil()
      .dio
      .get(url, queryParameters: getQueryParameters(params));
  var res = BaseResponse.fromJson(response.data);
  if (res.code != "200") {
    LogUtil.v(res.message);
  }
  return res;
}

Observable<BaseResponse> post(String url,
        {dynamic body, Map<String, dynamic> queryParameters}) =>
    Observable.fromFuture(_post(Constant.baseUrl + url, body,
            queryParameters: getQueryParameters(queryParameters)))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<BaseResponse> _post(String url, dynamic body,
    {Map<String, dynamic> queryParameters}) async {
  var response = await HttpUtil()
      .dio
      .post(url, data: body, queryParameters: queryParameters);
//  LogUtil.v("post接收到的数据===="+response.data);
  var res = BaseResponse.fromJson(response.data);
  print("post接收到的数据===="+response.toString());
  if (res.code != "200") {
//    LogUtil.v(res.message);
  }
  return res;
}

Map<String, dynamic> getQueryParameters(Map<String, dynamic> params) {
  var timestamp = new DateTime.now().millisecondsSinceEpoch;
  var token = "";
  Map<String, Object> queryParameters = {
    'appid': Constant.AppId,
    'timestamp': timestamp,
    'version': '1.0',
    'sign': getSign(params, timestamp, token),
    'token': token,
    'params': json.encode(params)
  };
  return queryParameters;
}

String getSign(Map<String, dynamic> params, timestamp, token) {
  var resData = "appid=" +
      Constant.AppId +
      "&params=" +
      json.encode(params).toString() +
      "&timestamp=" +
      timestamp.toString() +
      '&token=' +
      token;
  //签名：
  var sign =
      MD5.generateMd5(resData + "&key=" + Constant.AppSecret).toUpperCase();
  return sign;
}
