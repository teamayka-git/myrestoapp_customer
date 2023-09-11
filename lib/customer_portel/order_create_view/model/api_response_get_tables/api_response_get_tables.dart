import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'api_response_get_tables.g.dart';

@JsonSerializable()
class ApiResponseGetTables {
  String? message;
  Data? data;

  ApiResponseGetTables({this.message, this.data});

  factory ApiResponseGetTables.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseGetTablesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseGetTablesToJson(this);
}
