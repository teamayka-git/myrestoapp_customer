import 'package:json_annotation/json_annotation.dart';

import 'product_details_print.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  int? orderId;
  String? orderNumber;
  String? kotNo;
  int? tokenNo;
  int? salesType;
  String? customerName;
  String? refNo;
  String? customerAddress;
  String? customerPhone;
  int? currentTime;
  List<String>? tableNames;
  List<ProductDetailsPrint>? productDetailsPrint;

  OrderDetail({
    this.orderId,
    this.orderNumber,
    this.kotNo,
    this.tokenNo,
    this.salesType,
    this.customerName,
    this.customerAddress,
    this.refNo,
    this.customerPhone,
    this.currentTime,
    this.tableNames,
    this.productDetailsPrint,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return _$OrderDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
