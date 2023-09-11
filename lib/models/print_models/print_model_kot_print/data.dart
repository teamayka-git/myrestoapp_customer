import 'package:json_annotation/json_annotation.dart';

import 'list_kot_item.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? orderTypeName;
  String? name;
  List<String>? listCustomerDetailsString;
  String? staffName;
  String? token;
  String? notes;
  int? orderTimeMil;
  List<ListKotItem>? listKotItems;

  Data({
    required this.orderTypeName,
    required this.name,
    required this.listCustomerDetailsString,
    required this.staffName,
    required this.token,
    required this.notes,
    required this.orderTimeMil,
    required this.listKotItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
