import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'api_response_order_create.g.dart';

@JsonSerializable()
class ApiResponseOrderCreate {
  String? message;
  Data? data;

  ApiResponseOrderCreate({this.message, this.data});

  factory ApiResponseOrderCreate.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseOrderCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseOrderCreateToJson(this);
}
