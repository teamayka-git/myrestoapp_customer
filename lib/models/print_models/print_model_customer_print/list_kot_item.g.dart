// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_kot_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListKotItem _$ListKotItemFromJson(Map<String, dynamic> json) => ListKotItem(
      name: json['name'] as String?,
      kotNote: json['kotNote'] as String?,
      variantName: json['variantName'] as String?,
      qty: json['qty'] as String?,
      unitPrice: json['unitPrice'] as String?,
      totalPrice: json['totalPrice'] as String?,
    );

Map<String, dynamic> _$ListKotItemToJson(ListKotItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kotNote': instance.kotNote,
      'variantName': instance.variantName,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
    };
