import 'package:dio/dio.dart';
import 'dart:collection';
import 'package:flutter_consumer/httpservice/interceptors/token_interceptor.dart';
import 'package:flutter_consumer/httpservice/interceptors//header_interceptor.dart';
import 'package:flutter_consumer/httpservice/interceptors/log_interceptor.dart';
import 'package:flutter_consumer/httpservice/code.dart';
import 'package:flutter_consumer/httpservice/interceptors/error_interceptor.dart';
import 'package:flutter_consumer/httpservice/interceptors/response_interceptor.dart';
import 'package:flutter_consumer/httpservice/result_data.dart';
import 'package:flutter_consumer/util/md5.dart';
import 'package:flutter_consumer/util/constant.dart';
import 'dart:convert';

/**
 * 网络请求封装类
 */
class HttpManager {

  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = new Dio(); // 使用默认配置

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HttpManager() {
    _dio.interceptors.add(new HeaderInterceptors());

    _dio.interceptors.add(_tokenInterceptors);

    _dio.interceptors.add(new LogsInterceptors());

    _dio.interceptors.add(new ErrorInterceptors(_dio));

    _dio.interceptors.add(new ResponseInterceptors());
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  Future<ResultData> request(
      url, params, Map<String, dynamic> header, {Options option,noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "post");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio.request(Constant.baseUrl + url, queryParameters: getQueryParameters(params), options: option);//直接key-value传递方式
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }
  ///清除授权
  clearAuthorization() {
    // _tokenInterceptors.clearAuthorization();//2019112 先注释掉
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
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

}
final HttpManager httpManager = new HttpManager();