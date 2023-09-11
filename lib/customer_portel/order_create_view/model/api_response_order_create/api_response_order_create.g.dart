// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_order_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseOrderCreate _$ApiResponseOrderCreateFromJson(
        Map<String, dynamic> json) =>
    ApiResponseOrderCreate(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseOrderCreateToJson(
        ApiResponseOrderCreate instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
