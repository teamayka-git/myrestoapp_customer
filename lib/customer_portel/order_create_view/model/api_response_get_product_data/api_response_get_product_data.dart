import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'api_response_get_product_data.g.dart';

@JsonSerializable()
class ApiResponseGetProductData {
  String? message;
  Data? data;

  ApiResponseGetProductData({this.message, this.data});

  factory ApiResponseGetProductData.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseGetProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseGetProductDataToJson(this);
}
