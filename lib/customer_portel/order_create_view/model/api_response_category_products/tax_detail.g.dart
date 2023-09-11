// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxDetail _$TaxDetailFromJson(Map<String, dynamic> json) => TaxDetail(
      schemeId: json['schemeId'] as int?,
      description: json['description'] as String?,
      taxRate: (json['taxRate'] as num?)?.toDouble(),
      effectiveFrom: json['effectiveFrom'] as int?,
      effectiveTo: json['effectiveTo'] as int?,
      isTaxInclusive: json['isTaxInclusive'] as bool?,
    );

Map<String, dynamic> _$TaxDetailToJson(TaxDetail instance) => <String, dynamic>{
      'schemeId': instance.schemeId,
      'description': instance.description,
      'taxRate': instance.taxRate,
      'effectiveFrom': instance.effectiveFrom,
      'effectiveTo': instance.effectiveTo,
      'isTaxInclusive': instance.isTaxInclusive,
    };
