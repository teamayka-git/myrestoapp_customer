import 'package:json_annotation/json_annotation.dart';

import 'payment_detail.dart';
import 'sales_order_detail.dart';

part 'api_request_order_create.g.dart';

@JsonSerializable()
class ApiRequestOrderCreate {
  int? customerId;
  int? orderDate;
  String? customerName;
  String? customerAddress;
  String? customerPhone;
  int? orderId;
  int? editCount;
  double? grossAmount;
  double? discountAmount;
  double? discountPercent;
  double? offerAmount;
  double? offerPercent;
  bool? isApplyToProduct;
  double? taxAmount;
  double? roundOff;
  double? rewardAmount;
  double? rewardPoint;
  double? netAmount;
  double? cashAmount;
  double? customerCredit;
  double? deliveryCharge;
  bool? isTableChanged;
  int? saleType;
  List<int>? chairsId;
  int? deliveryStaffId;
  String? onlineReferenceNumber;
  List<PaymentDetail>? paymentDetails;
  List<SalesOrderDetail>? salesOrderDetails;
  String? description;
  int? paymentStatus;
  int? orderStatus;
  int? deliveryProviderId;
  int? createdBy;

  ApiRequestOrderCreate({
    this.customerId,
    this.orderDate,
    this.customerName,
    this.customerAddress,
    this.customerPhone,
    this.orderId,
    this.grossAmount,
    this.discountAmount,
    this.discountPercent,
    this.offerAmount,
    this.offerPercent,
    this.isApplyToProduct,
    this.isTableChanged,
    this.taxAmount,
    this.roundOff,
    this.rewardAmount,
    this.rewardPoint,
    this.netAmount,
    this.cashAmount,
    this.customerCredit,
    this.deliveryCharge,
    this.saleType,
    this.chairsId,
    this.deliveryStaffId,
    this.onlineReferenceNumber,
    this.paymentDetails,
    this.salesOrderDetails,
    this.description,
    this.paymentStatus,
    this.orderStatus,
    this.editCount,
    this.deliveryProviderId,
    this.createdBy,
  });

  ApiRequestOrderCreate.create({
    required this.customerId,
    required this.deliveryProviderId,
    required this.orderDate,
    required this.customerName,
    required this.customerAddress,
    required this.customerPhone,
    required this.orderId,
    required this.grossAmount,
    required this.discountAmount,
    required this.discountPercent,
    required this.offerAmount,
    required this.offerPercent,
    required this.isApplyToProduct,
    required this.taxAmount,
    required this.roundOff,
    required this.rewardAmount,
    required this.rewardPoint,
    required this.netAmount,
    required this.cashAmount,
    required this.customerCredit,
    required this.deliveryCharge,
    required this.saleType,
    required this.chairsId,
    required this.deliveryStaffId,
    required this.isTableChanged,
    required this.onlineReferenceNumber,
    required this.paymentDetails,
    required this.salesOrderDetails,
    required this.description,
    required this.paymentStatus,
    required this.orderStatus,
    required this.editCount,
    required this.createdBy,
  });

  factory ApiRequestOrderCreate.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestOrderCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestOrderCreateToJson(this);
}
