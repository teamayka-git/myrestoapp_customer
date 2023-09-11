// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bundle_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBundleItem _$ProductBundleItemFromJson(Map<String, dynamic> json) =>
    ProductBundleItem(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      unitId: json['unitId'] as int?,
      unitQty: (json['unitQty'] as num?)?.toDouble(),
      status: json['status'] as int?,
      variantName: json['variantName'] as String?,
      productName: json['productName'] as String?,
      productNameLocal: json['productNameLocal'] as String?,
      printerIp: json['printerIp'] as String?,
      printer: json['printer'] as String?,
      productImage: json['productImage'] as String?,
      productunitlinkId: json['productunitlinkId'] as int?,
      alternatives: (json['alternatives'] as List<dynamic>?)
          ?.map((e) =>
              ProductBundleAlternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductBundleItemToJson(ProductBundleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'unitId': instance.unitId,
      'unitQty': instance.unitQty,
      'status': instance.status,
      'productunitlinkId': instance.productunitlinkId,
      'variantName': instance.variantName,
      'productNameLocal': instance.productNameLocal,
      'printerIp': instance.printerIp,
      'printer': instance.printer,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'alternatives': instance.alternatives,
    };
