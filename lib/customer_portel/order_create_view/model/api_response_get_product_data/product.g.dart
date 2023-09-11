// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as int?,
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      productNameLocal: json['productNameLocal'] as String?,
      productImage: json['productImage'] as String?,
      categoryId: json['categoryId'] as int?,
      productRates: (json['productRates'] as List<dynamic>?)
          ?.map((e) => ProductRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productNameLocal': instance.productNameLocal,
      'productImage': instance.productImage,
      'categoryId': instance.categoryId,
      'productRates': instance.productRates,
    };
