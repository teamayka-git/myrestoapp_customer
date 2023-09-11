// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_get_product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseGetProductData _$ApiResponseGetProductDataFromJson(
        Map<String, dynamic> json) =>
    ApiResponseGetProductData(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseGetProductDataToJson(
        ApiResponseGetProductData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
