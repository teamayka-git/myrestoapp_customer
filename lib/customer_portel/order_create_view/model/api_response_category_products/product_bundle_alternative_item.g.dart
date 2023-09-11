// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bundle_alternative_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBundleAlternative _$ProductBundleAlternativeFromJson(
        Map<String, dynamic> json) =>
    ProductBundleAlternative(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      unitId: json['unitId'] as int?,
      unitQty: (json['unitQty'] as num?)?.toDouble(),
      status: json['status'] as int?,
      variantName: json['variantName'] as String?,
      productunitlinkId: json['productunitlinkId'] as int?,
      productName: json['productName'] as String?,
      productNameLocal: json['productNameLocal'] as String?,
      printerIp: json['printerIp'] as String?,
      printer: json['printer'] as String?,
      productImage: json['productImage'] as String?,
    );

Map<String, dynamic> _$ProductBundleAlternativeToJson(
        ProductBundleAlternative instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'unitId': instance.unitId,
      'unitQty': instance.unitQty,
      'status': instance.status,
      'variantName': instance.variantName,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productNameLocal': instance.productNameLocal,
      'printerIp': instance.printerIp,
      'printer': instance.printer,
      'productunitlinkId': instance.productunitlinkId,
    };
