// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleTypes _$SaleTypesFromJson(Map<String, dynamic> json) => SaleTypes(
      id: json['id'] as int?,
      type: json['type'] as String?,
      selections:
          (json['selections'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$SaleTypesToJson(SaleTypes instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'selections': instance.selections,
    };
