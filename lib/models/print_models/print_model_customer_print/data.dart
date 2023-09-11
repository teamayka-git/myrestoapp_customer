import 'package:json_annotation/json_annotation.dart';

import 'list_kot_item.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? orderTypeName;
  String? taxString;
  String? notes;
  bool? isOpenDrawer;
  List<String>? listCustomerDetailsString;
  String? subTotalAmount;
  String? staffName;
  String? orderNumber;
  String? token;
  int? orderTimeMil;
  String? deliveryCharge;
  String? taxAmount;
  String? grandTotalAmount;
  String? footerBig;
  String? footerSmall;
  bool? isShowPaidStamb;
  List<ListKotItem>? listKotItems;

  Data({
    required this.orderTypeName,
    required this.taxString,
    required this.notes,
    required this.isOpenDrawer,
    required this.listCustomerDetailsString,
    required this.subTotalAmount,
    required this.staffName,
    required this.orderNumber,
    required this.token,
    required this.orderTimeMil,
    required this.deliveryCharge,
    required this.taxAmount,
    required this.grandTotalAmount,
    required this.footerBig,
    required this.footerSmall,
    required this.isShowPaidStamb,
    required this.listKotItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
