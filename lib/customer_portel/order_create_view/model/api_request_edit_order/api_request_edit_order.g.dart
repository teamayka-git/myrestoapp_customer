// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request_edit_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRequestEditOrder _$ApiRequestEditOrderFromJson(Map<String, dynamic> json) =>
    ApiRequestEditOrder(
      orderId: json['orderId'] as String?,
      customerId: json['customerId'] as int?,
      invoiceDate: json['invoiceDate'] as int?,
      customerName: json['customerName'] as String?,
      customerAddress: json['customerAddress'] as String?,
      deliveryStaffId: json['deliveryStaffId'] as String?,
      customerPhone: json['customerPhone'] as String?,
      grossAmount: (json['grossAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      paymentStatus: json['paymentStatus'] as int?,
      paymnentdetails: (json['paymnentdetails'] as List<dynamic>?)
          ?.map((e) => Paymnentdetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      balanceAmount: (json['balanceAmount'] as num?)?.toDouble(),
      orderStatus: json['orderStatus'] as int?,
      saleType: json['saleType'] as int?,
      chairsId: (json['chairsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      salesOrderDetails: (json['salesOrderDetails'] as List<dynamic>?)
          ?.map((e) => SalesOrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      onlineReferenceNumber: json['onlineReferenceNumber'] as String?,
    );

Map<String, dynamic> _$ApiRequestEditOrderToJson(
        ApiRequestEditOrder instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerId': instance.customerId,
      'invoiceDate': instance.invoiceDate,
      'customerName': instance.customerName,
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'deliveryStaffId': instance.deliveryStaffId,
      'grossAmount': instance.grossAmount,
      'discountAmount': instance.discountAmount,
      'taxAmount': instance.taxAmount,
      'netAmount': instance.netAmount,
      'paymnentdetails': instance.paymnentdetails,
      'balanceAmount': instance.balanceAmount,
      'orderStatus': instance.orderStatus,
      'saleType': instance.saleType,
      'paymentStatus': instance.paymentStatus,
      'chairsId': instance.chairsId,
      'salesOrderDetails': instance.salesOrderDetails,
      'onlineReferenceNumber': instance.onlineReferenceNumber,
    };
