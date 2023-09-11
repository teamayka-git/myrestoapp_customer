import 'package:json_annotation/json_annotation.dart';

part 'api_request_get_tables.g.dart';

@JsonSerializable()
class ApiRequestGetTables {
  int? sortType;
  int? sortOrder;
  List<int>? statusArray;
  List<int>? screenType;
  String? searchingText;
  List<int>? responseFormat;
  int? limit;
  int? skip;
  List<int>? id;

  ApiRequestGetTables({
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

  ApiRequestGetTables.create({
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

  factory ApiRequestGetTables.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestGetTablesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestGetTablesToJson(this);
}
