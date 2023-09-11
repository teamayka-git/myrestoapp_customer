// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesOrderDetail _$SalesOrderDetailFromJson(Map<String, dynamic> json) =>
    SalesOrderDetail(
      orderListId: json['orderListId'] as int?,
      productId: json['productId'] as int?,
      productName: json['productName'] as String?,
      unitId: json['unitId'] as int?,
      qty: (json['qty'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      bundleAlternatives: (json['bundleAlternatives'] as List<dynamic>?)
          ?.map((e) => BundleAlternatives.fromJson(e as Map<String, dynamic>))
          .toList(),
      barcode: json['barcode'] as String?,
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      kitchenId: json['kitchenId'] as int?,
      kotNotes: json['kotNotes'] as String?,
      kotStatus: json['kotStatus'] as int?,
    );

Map<String, dynamic> _$SalesOrderDetailToJson(SalesOrderDetail instance) =>
    <String, dynamic>{
      'orderListId': instance.orderListId,
      'productId': instance.productId,
      'productName': instance.productName,
      'unitId': instance.unitId,
      'qty': instance.qty,
      'rate': instance.rate,
      'total': instance.total,
      'discountAmount': instance.discountAmount,
      'taxAmount': instance.taxAmount,
      'netAmount': instance.netAmount,
      'properties': instance.properties,
      'bundleAlternatives': instance.bundleAlternatives,
      'kitchenId': instance.kitchenId,
      'kotNotes': instance.kotNotes,
      'barcode': instance.barcode,
      'kotStatus': instance.kotStatus,
    };
