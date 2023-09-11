// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetail _$PaymentDetailFromJson(Map<String, dynamic> json) =>
    PaymentDetail(
      typeId: json['typeId'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PaymentDetailToJson(PaymentDetail instance) =>
    <String, dynamic>{
      'typeId': instance.typeId,
      'amount': instance.amount,
    };
