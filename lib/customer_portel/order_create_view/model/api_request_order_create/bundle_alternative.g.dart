// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_alternative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BundleAlternative _$BundleAlternativeFromJson(Map<String, dynamic> json) =>
    BundleAlternative(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      unitId: json['unitId'] as int?,
      unitQty: (json['unitQty'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BundleAlternativeToJson(BundleAlternative instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'unitId': instance.unitId,
      'unitQty': instance.unitQty,
    };
