// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRate _$ProductRateFromJson(Map<String, dynamic> json) => ProductRate(
      id: json['id'] as int?,
      description: json['description'] as String?,
      unitId: json['unitId'] as int?,
      unit: json['unit'] as String?,
      unitQty: (json['unitQty'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      kitchenId: json['kitchenId'] as int?,
      salesTypeRates: (json['salesTypeRates'] as List<dynamic>?)
          ?.map((e) => SaleTypeRates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductRateToJson(ProductRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'unitId': instance.unitId,
      'unit': instance.unit,
      'unitQty': instance.unitQty,
      'rate': instance.rate,
      'kitchenId': instance.kitchenId,
      'salesTypeRates': instance.salesTypeRates,
    };
