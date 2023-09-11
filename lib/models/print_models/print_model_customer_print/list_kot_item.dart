import 'package:json_annotation/json_annotation.dart';

part 'list_kot_item.g.dart';

@JsonSerializable()
class ListKotItem {
  String? name;
  String? kotNote;
  String? variantName;
  String? qty;
  String? unitPrice;
  String? totalPrice;

  ListKotItem({
    required this.name,
    required this.kotNote,
    required this.variantName,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory ListKotItem.fromJson(Map<String, dynamic> json) {
    return _$ListKotItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListKotItemToJson(this);
}
