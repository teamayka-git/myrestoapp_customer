import 'package:json_annotation/json_annotation.dart';

part 'api_request_table_free.g.dart';

@JsonSerializable()
class ApiRequestTableFree {
  int? tableId;

  ApiRequestTableFree({this.tableId});
  ApiRequestTableFree.create({required this.tableId});

  factory ApiRequestTableFree.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestTableFreeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestTableFreeToJson(this);
}
