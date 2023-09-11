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
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
      billWisediscountAmount:
          (json['billWisediscountAmount'] as num?)?.toDouble(),
      billWisediscountPercent:
          (json['billWisediscountPercent'] as num?)?.toDouble(),
      offerAmountItem: (json['offerAmountItem'] as num?)?.toDouble(),
      offerPercentItem: (json['offerPercentItem'] as num?)?.toDouble(),
      offerAmountBill: (json['offerAmountBill'] as num?)?.toDouble(),
      offerPercentBill: (json['offerPercentBill'] as num?)?.toDouble(),
      saleTotal: (json['saleTotal'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      taxScheme: (json['taxScheme'] as List<dynamic>?)
          ?.map((e) => TaxScheme.fromJson(e as Map<String, dynamic>))
          .toList(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      kitchenId: json['kitchenId'] as int?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
      kotNotes: json['kotNotes'] as String?,
      kotStatus: json['kotStatus'] as int?,
      bundleAlternatives: (json['bundleAlternatives'] as List<dynamic>?)
          ?.map((e) => BundleAlternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalesOrderDetailToJson(SalesOrderDetail instance) =>
    <String, dynamic>{
      'orderListId': instance.orderListId,
      'productId': instance.productId,
      'productName': instance.productName,
      'unitId': instance.unitId,
      'qty': instance.qty,
      'rate': instance.rate,
      'discountAmount': instance.discountAmount,
      'discountPercent': instance.discountPercent,
      'billWisediscountAmount': instance.billWisediscountAmount,
      'billWisediscountPercent': instance.billWisediscountPercent,
      'offerAmountItem': instance.offerAmountItem,
      'offerPercentItem': instance.offerPercentItem,
      'offerAmountBill': instance.offerAmountBill,
      'offerPercentBill': instance.offerPercentBill,
      'saleTotal': instance.saleTotal,
      'taxAmount': instance.taxAmount,
      'taxScheme': instance.taxScheme,
      'netAmount': instance.netAmount,
      'kitchenId': instance.kitchenId,
      'properties': instance.properties,
      'status': instance.status,
      'kotNotes': instance.kotNotes,
      'kotStatus': instance.kotStatus,
      'bundleAlternatives': instance.bundleAlternatives,
    };
