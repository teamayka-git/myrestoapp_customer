// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_kot_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListKotItem _$ListKotItemFromJson(Map<String, dynamic> json) => ListKotItem(
      name: json['name'] as String?,
      localName: json['localName'] as String?,
      kotNote: json['kotNote'] as String?,
      variantName: json['variantName'] as String?,
      isStrike: json['isStrike'] as bool?,
      qty: json['qty'] as String?,
      unitPrice: json['unitPrice'] as String?,
    );

Map<String, dynamic> _$ListKotItemToJson(ListKotItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'localName': instance.localName,
      'kotNote': instance.kotNote,
      'variantName': instance.variantName,
      'isStrike': instance.isStrike,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
    };
