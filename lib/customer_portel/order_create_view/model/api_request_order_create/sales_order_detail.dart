import 'package:json_annotation/json_annotation.dart';

import 'bundle_alternative.dart';
import 'property.dart';
import 'tax_scheme.dart';

part 'sales_order_detail.g.dart';

@JsonSerializable()
class SalesOrderDetail {
  int? orderListId;
  int? productId;
  String? productName;
  int? unitId;
  double? qty;
  double? rate;
  double? discountAmount;
  double? discountPercent;
  double? billWisediscountAmount;
  double? billWisediscountPercent;
  double? offerAmountItem;
  double? offerPercentItem;
  double? offerAmountBill;
  double? offerPercentBill;
  double? saleTotal;
  double? taxAmount;
  List<TaxScheme>? taxScheme;
  double? netAmount;
  int? kitchenId;
  List<Property>? properties;
  int? status;
  String? kotNotes;
  int? kotStatus;
  List<BundleAlternative>? bundleAlternatives;

  SalesOrderDetail({
    this.orderListId,
    this.productId,
    this.productName,
    this.unitId,
    this.qty,
    this.rate,
    this.discountAmount,
    this.discountPercent,
    this.billWisediscountAmount,
    this.billWisediscountPercent,
    this.offerAmountItem,
    this.offerPercentItem,
    this.offerAmountBill,
    this.offerPercentBill,
    this.saleTotal,
    this.taxAmount,
    this.taxScheme,
    this.netAmount,
    this.kitchenId,
    this.properties,
    this.status,
    this.kotNotes,
    this.kotStatus,
    this.bundleAlternatives,
  });
  SalesOrderDetail.create({
    required this.orderListId,
    required this.productId,
    required this.productName,
    required this.unitId,
    required this.qty,
    required this.rate,
    required this.discountAmount,
    required this.discountPercent,
    required this.billWisediscountAmount,
    required this.billWisediscountPercent,
    required this.offerAmountItem,
    required this.offerPercentItem,
    required this.offerAmountBill,
    required this.offerPercentBill,
    required this.saleTotal,
    required this.taxAmount,
    required this.taxScheme,
    required this.netAmount,
    required this.kitchenId,
    required this.properties,
    required this.status,
    required this.kotNotes,
    required this.kotStatus,
    required this.bundleAlternatives,
  });

  factory SalesOrderDetail.fromJson(Map<String, dynamic> json) {
    return _$SalesOrderDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalesOrderDetailToJson(this);
}
