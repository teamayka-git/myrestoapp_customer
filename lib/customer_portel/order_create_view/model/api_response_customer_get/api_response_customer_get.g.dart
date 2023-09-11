// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_customer_get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseCustomerGet _$ApiResponseCustomerGetFromJson(
        Map<String, dynamic> json) =>
    ApiResponseCustomerGet(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseCustomerGetToJson(
        ApiResponseCustomerGet instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
