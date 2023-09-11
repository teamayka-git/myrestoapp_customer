import 'package:json_annotation/json_annotation.dart';

part 'api_request_get_product_data.g.dart';

@JsonSerializable()
class ApiRequestGetProductData {
  int? sortType;
  int? sortOrder;
  List<int>? statusArray;
  List<int>? screenType;
  String? searchingText;
  List<dynamic>? responseFormat;
  int? limit;
  int? skip;
  List<int>? id;

  ApiRequestGetProductData({
    this.sortType,
    this.sortOrder,
    this.statusArray,
    this.screenType,
    this.searchingText,
    this.responseFormat,
    this.limit,
    this.skip,
    this.id,
  });

  ApiRequestGetProductData.create({
    required this.sortType,
    required this.sortOrder,
    required this.statusArray,
    required this.screenType,
    required this.searchingText,
    required this.responseFormat,
    required this.limit,
    required this.skip,
    required this.id,
  });

  factory ApiRequestGetProductData.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestGetProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestGetProductDataToJson(this);
}
