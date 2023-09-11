import 'package:json_annotation/json_annotation.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_edit_order/bundle_alternatives.dart';

import 'property.dart';

part 'sales_order_detail.g.dart';

@JsonSerializable()
class SalesOrderDetail {
  int? orderListId;
  int? productId;
  String? productName;
  int? unitId;
  double? qty;
  double? rate;
  double? total;
  double? discountAmount;
  double? taxAmount;
  double? netAmount;
  List<Property>? properties;
  List<BundleAlternatives>? bundleAlternatives;
  int? kitchenId;
  String? kotNotes;
  String? barcode;
  int? kotStatus;

  SalesOrderDetail({
    this.orderListId,
    this.productId,
    this.productName,
    this.unitId,
    this.qty,
    this.rate,
    this.total,
    this.discountAmount,
    this.bundleAlternatives,
    this.barcode,
    this.taxAmount,
    this.netAmount,
    this.properties,
    this.kitchenId,
    this.kotNotes,
    this.kotStatus,
  });

  SalesOrderDetail.create({
    required this.orderListId,
    required this.productId,
    required this.productName,
    required this.unitId,
    required this.qty,
    required this.rate,
    required this.total,
    required this.discountAmount,
    required this.bundleAlternatives,
    required this.barcode,
    required this.taxAmount,
    required this.netAmount,
    required this.properties,
    required this.kitchenId,
    required this.kotNotes,
    required this.kotStatus,
  });

  factory SalesOrderDetail.fromJson(Map<String, dynamic> json) {
    return _$SalesOrderDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalesOrderDetailToJson(this);
}
