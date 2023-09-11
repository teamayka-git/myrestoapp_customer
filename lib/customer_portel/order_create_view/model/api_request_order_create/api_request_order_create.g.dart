// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request_order_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRequestOrderCreate _$ApiRequestOrderCreateFromJson(
        Map<String, dynamic> json) =>
    ApiRequestOrderCreate(
      customerId: json['customerId'] as int?,
      orderDate: json['orderDate'] as int?,
      customerName: json['customerName'] as String?,
      customerAddress: json['customerAddress'] as String?,
      customerPhone: json['customerPhone'] as String?,
      orderId: json['orderId'] as int?,
      grossAmount: (json['grossAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
      offerAmount: (json['offerAmount'] as num?)?.toDouble(),
      offerPercent: (json['offerPercent'] as num?)?.toDouble(),
      isApplyToProduct: json['isApplyToProduct'] as bool?,
      isTableChanged: json['isTableChanged'] as bool?,
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      roundOff: (json['roundOff'] as num?)?.toDouble(),
      rewardAmount: (json['rewardAmount'] as num?)?.toDouble(),
      rewardPoint: (json['rewardPoint'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      cashAmount: (json['cashAmount'] as num?)?.toDouble(),
      customerCredit: (json['customerCredit'] as num?)?.toDouble(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      saleType: json['saleType'] as int?,
      chairsId:
          (json['chairsId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      deliveryStaffId: json['deliveryStaffId'] as int?,
      onlineReferenceNumber: json['onlineReferenceNumber'] as String?,
      paymentDetails: (json['paymentDetails'] as List<dynamic>?)
          ?.map((e) => PaymentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      salesOrderDetails: (json['salesOrderDetails'] as List<dynamic>?)
          ?.map((e) => SalesOrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      paymentStatus: json['paymentStatus'] as int?,
      orderStatus: json['orderStatus'] as int?,
      editCount: json['editCount'] as int?,
      deliveryProviderId: json['deliveryProviderId'] as int?,
      createdBy: json['createdBy'] as int?,
    );

Map<String, dynamic> _$ApiRequestOrderCreateToJson(
        ApiRequestOrderCreate instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'orderDate': instance.orderDate,
      'customerName': instance.customerName,
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'orderId': instance.orderId,
      'editCount': instance.editCount,
      'grossAmount': instance.grossAmount,
      'discountAmount': instance.discountAmount,
      'discountPercent': instance.discountPercent,
      'offerAmount': instance.offerAmount,
      'offerPercent': instance.offerPercent,
      'isApplyToProduct': instance.isApplyToProduct,
      'taxAmount': instance.taxAmount,
      'roundOff': instance.roundOff,
      'rewardAmount': instance.rewardAmount,
      'rewardPoint': instance.rewardPoint,
      'netAmount': instance.netAmount,
      'cashAmount': instance.cashAmount,
      'customerCredit': instance.customerCredit,
      'deliveryCharge': instance.deliveryCharge,
      'isTableChanged': instance.isTableChanged,
      'saleType': instance.saleType,
      'chairsId': instance.chairsId,
      'deliveryStaffId': instance.deliveryStaffId,
      'onlineReferenceNumber': instance.onlineReferenceNumber,
      'paymentDetails': instance.paymentDetails,
      'salesOrderDetails': instance.salesOrderDetails,
      'description': instance.description,
      'paymentStatus': instance.paymentStatus,
      'orderStatus': instance.orderStatus,
      'deliveryProviderId': instance.deliveryProviderId,
      'createdBy': instance.createdBy,
    };
