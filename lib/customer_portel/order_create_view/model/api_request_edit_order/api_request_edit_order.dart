import 'package:json_annotation/json_annotation.dart';

import 'paymnentdetail.dart';
import 'sales_order_detail.dart';

part 'api_request_edit_order.g.dart';

@JsonSerializable()
class ApiRequestEditOrder {
  String? orderId;
  int? customerId;
  int? invoiceDate;
  String? customerName;
  String? customerAddress;
  String? customerPhone;
  String? deliveryStaffId;
  double? grossAmount;
  double? discountAmount;
  double? taxAmount;
  double? netAmount;
  List<Paymnentdetail>? paymnentdetails;
  double? balanceAmount;
  int? orderStatus;
  int? saleType;
  int? paymentStatus;
  List<String>? chairsId;
  List<SalesOrderDetail>? salesOrderDetails;
  String? onlineReferenceNumber;

  ApiRequestEditOrder({
    this.orderId,
    this.customerId,
    this.invoiceDate,
    this.customerName,
    this.customerAddress,
    this.deliveryStaffId,
    this.customerPhone,
    this.grossAmount,
    this.discountAmount,
    this.taxAmount,
    this.netAmount,
    this.paymentStatus,
    this.paymnentdetails,
    this.balanceAmount,
    this.orderStatus,
    this.saleType,
    this.chairsId,
    this.salesOrderDetails,
    this.onlineReferenceNumber,
  });

  ApiRequestEditOrder.create({
    required this.orderId,
    required this.customerId,
    required this.invoiceDate,
    required this.customerName,
    required this.customerAddress,
    required this.deliveryStaffId,
    required this.customerPhone,
    required this.paymentStatus,
    required this.grossAmount,
    required this.discountAmount,
    required this.taxAmount,
    required this.netAmount,
    required this.paymnentdetails,
    required this.balanceAmount,
    required this.orderStatus,
    required this.saleType,
    required this.chairsId,
    required this.salesOrderDetails,
    required this.onlineReferenceNumber,
  });

  factory ApiRequestEditOrder.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestEditOrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestEditOrderToJson(this);
}
