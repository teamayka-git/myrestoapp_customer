// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymnentdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paymnentdetail _$PaymnentdetailFromJson(Map<String, dynamic> json) =>
    Paymnentdetail(
      typeId: json['typeId'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PaymnentdetailToJson(Paymnentdetail instance) =>
    <String, dynamic>{
      'typeId': instance.typeId,
      'amount': instance.amount,
      'description': instance.description,
    };
