import 'package:json_annotation/json_annotation.dart';

part 'sale_types.g.dart';

@JsonSerializable()
class SaleTypes {
  int? id;
  String? type;
  List<int>? selections;

  SaleTypes({this.id, this.type, this.selections});

  factory SaleTypes.fromJson(Map<String, dynamic> json) {
    return _$SaleTypesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaleTypesToJson(this);
}
