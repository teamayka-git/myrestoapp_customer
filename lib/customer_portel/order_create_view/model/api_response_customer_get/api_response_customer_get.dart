import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'api_response_customer_get.g.dart';

@JsonSerializable()
class ApiResponseCustomerGet {
  String? message;
  Data? data;

  ApiResponseCustomerGet({this.message, this.data});

  factory ApiResponseCustomerGet.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseCustomerGetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseCustomerGetToJson(this);
}
