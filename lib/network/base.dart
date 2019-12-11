//library baseresponse;

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse<T> {
  String code;
  dynamic data;
  String message;

  BaseResponse();

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  static Map<String, dynamic> toJson(BaseResponse instance) =>
      _$BaseResponseToJson(instance);
}

@JsonSerializable()
class CommonResponse {
  String code;
  dynamic data;
  String message;

  CommonResponse();

  factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

  static Map<String, dynamic> toJson(CommonResponse instance) => _$CommonResponseToJson(instance);
}

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return BaseResponse<T>()
    ..code = json['code'] as String
    ..data = json['data']
    ..message = json['message'] as String;
}

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse()
    ..code = json['code'] as String
    ..data = json['data']
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };