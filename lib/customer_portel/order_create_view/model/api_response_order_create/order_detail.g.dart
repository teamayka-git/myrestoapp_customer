// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      orderId: json['orderId'] as int?,
      orderNumber: json['orderNumber'] as String?,
      kotNo: json['kotNo'] as String?,
      tokenNo: json['tokenNo'] as int?,
      salesType: json['salesType'] as int?,
      customerName: json['customerName'] as String?,
      customerAddress: json['customerAddress'] as String?,
      refNo: json['refNo'] as String?,
      customerPhone: json['customerPhone'] as String?,
      currentTime: json['currentTime'] as int?,
      tableNames: (json['tableNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productDetailsPrint: (json['productDetailsPrint'] as List<dynamic>?)
          ?.map((e) => ProductDetailsPrint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNumber': instance.orderNumber,
      'kotNo': instance.kotNo,
      'tokenNo': instance.tokenNo,
      'salesType': instance.salesType,
      'customerName': instance.customerName,
      'refNo': instance.refNo,
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'currentTime': instance.currentTime,
      'tableNames': instance.tableNames,
      'productDetailsPrint': instance.productDetailsPrint,
    };
