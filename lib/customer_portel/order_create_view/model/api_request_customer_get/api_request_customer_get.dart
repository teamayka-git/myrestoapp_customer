import 'package:json_annotation/json_annotation.dart';

part 'api_request_customer_get.g.dart';

@JsonSerializable()
class ApiRequestCustomerGet {
  int? sortType;
  int? sortOrder;
  List<int>? statusArray;
  List<int>? screenType;
  String? searchingText;
  List<int>? responseFormat;
  int? limit;
  int? skip;
  List<int>? id;

  ApiRequestCustomerGet({
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

  ApiRequestCustomerGet.create({
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

  factory ApiRequestCustomerGet.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestCustomerGetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestCustomerGetToJson(this);
}
