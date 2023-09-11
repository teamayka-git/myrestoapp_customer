// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_category_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseCategoryProducts _$ApiResponseCategoryProductsFromJson(
        Map<String, dynamic> json) =>
    ApiResponseCategoryProducts(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseCategoryProductsToJson(
        ApiResponseCategoryProducts instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
