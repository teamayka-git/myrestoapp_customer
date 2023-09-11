// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRate _$ProductRateFromJson(Map<String, dynamic> json) => ProductRate(
      rateId: json['rateId'] as int?,
      productId: json['productId'] as int?,
      barcode: json['barcode'] as String?,
      description: json['description'] as String?,
      unit: json['unit'] as String?,
      unitId: json['unitId'] as int?,
      unitQty: (json['unitQty'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductRateToJson(ProductRate instance) =>
    <String, dynamic>{
      'rateId': instance.rateId,
      'productId': instance.productId,
      'barcode': instance.barcode,
      'description': instance.description,
      'unit': instance.unit,
      'unitId': instance.unitId,
      'unitQty': instance.unitQty,
      'rate': instance.rate,
    };
