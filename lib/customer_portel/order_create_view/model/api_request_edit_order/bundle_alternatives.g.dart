// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_alternatives.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BundleAlternatives _$BundleAlternativesFromJson(Map<String, dynamic> json) =>
    BundleAlternatives(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      unitId: json['unitId'] as int?,
      unitQty: (json['unitQty'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BundleAlternativesToJson(BundleAlternatives instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'unitId': instance.unitId,
      'unitQty': instance.unitQty,
    };
