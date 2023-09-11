import 'package:json_annotation/json_annotation.dart';

part 'list_kot_item.g.dart';

@JsonSerializable()
class ListKotItem {
  String? name;
  String? localName;
  String? kotNote;
  String? variantName;
  bool? isStrike;
  String? qty;
  String? unitPrice;

  ListKotItem({
    required this.name,
    required this.localName,
    required this.kotNote,
    required this.variantName,
    required this.isStrike,
    required this.qty,
    required this.unitPrice,
  });

  factory ListKotItem.fromJson(Map<String, dynamic> json) {
    return _$ListKotItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListKotItemToJson(this);
}
