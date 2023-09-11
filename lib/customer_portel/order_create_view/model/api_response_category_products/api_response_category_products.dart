import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'api_response_category_products.g.dart';

@JsonSerializable()
class ApiResponseCategoryProducts {
  String? message;
  Data? data;

  ApiResponseCategoryProducts({this.message, this.data});

  factory ApiResponseCategoryProducts.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseCategoryProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseCategoryProductsToJson(this);
}
