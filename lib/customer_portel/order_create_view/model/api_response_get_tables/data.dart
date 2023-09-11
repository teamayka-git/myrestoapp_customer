import 'package:json_annotation/json_annotation.dart';

import 'table_detail.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<TableDetail>? tableDetails;

  Data({this.tableDetails});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
