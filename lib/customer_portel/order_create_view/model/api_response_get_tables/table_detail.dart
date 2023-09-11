import 'package:json_annotation/json_annotation.dart';

import 'chair.dart';

part 'table_detail.g.dart';

@JsonSerializable()
class TableDetail {
  int? tableId;
  String? tableName;
  int? status;
  List<Chair>? chairs;

  TableDetail({this.tableId, this.tableName, this.status, this.chairs});

  factory TableDetail.fromJson(Map<String, dynamic> json) {
    return _$TableDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TableDetailToJson(this);
}
