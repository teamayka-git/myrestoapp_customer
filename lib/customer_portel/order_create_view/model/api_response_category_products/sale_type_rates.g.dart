// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_type_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleTypeRates _$SaleTypeRatesFromJson(Map<String, dynamic> json) =>
    SaleTypeRates(
      salesTypeId: json['salesTypeId'] as int?,
      salesType: json['salesType'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SaleTypeRatesToJson(SaleTypeRates instance) =>
    <String, dynamic>{
      'salesTypeId': instance.salesTypeId,
      'salesType': instance.salesType,
      'rate': instance.rate,
    };
