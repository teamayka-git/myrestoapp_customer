// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxScheme _$TaxSchemeFromJson(Map<String, dynamic> json) => TaxScheme(
      taxId: json['taxId'] as int?,
      taxRate: (json['taxRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TaxSchemeToJson(TaxScheme instance) => <String, dynamic>{
      'taxId': instance.taxId,
      'taxRate': instance.taxRate,
    };
