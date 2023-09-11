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
      printer: json['printer'] as String?,
      kitchen: json['kitchen'] as String?,
      productRates: (json['productRates'] as List<dynamic>?)
          ?.map((e) => ProductRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      productBundles: (json['productBundles'] as List<dynamic>?)
          ?.map((e) => ProductBundleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxDetails: (json['taxDetails'] as List<dynamic>?)
          ?.map((e) => TaxDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      isTaxInclusive: json['isTaxInclusive'] as bool?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productNameLocal': instance.productNameLocal,
      'productImage': instance.productImage,
      'printer': instance.printer,
      'kitchen': instance.kitchen,
      'isTaxInclusive': instance.isTaxInclusive,
      'productRates': instance.productRates,
      'productBundles': instance.productBundles,
      'taxDetails': instance.taxDetails,
      'properties': instance.properties,
    };
