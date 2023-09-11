import 'package:json_annotation/json_annotation.dart';

part 'product_details_print.g.dart';

@JsonSerializable()
class ProductDetailsPrint {
  bool? isStrike;
  String? productName;
  String? localName;
  String? variantName;
  double? qty;
  double? rate;
  int? status;
  double? netAmount;
  String? printer;
  String? printerName;
  String? kotNotes;
  String? remarks;

  ProductDetailsPrint({
    this.isStrike,
    this.productName,
    this.variantName,
    this.localName,
    this.qty,
    this.rate,
    this.status,
    this.netAmount,
    this.printer,
    this.printerName,
    this.kotNotes,
    this.remarks,
  });

  factory ProductDetailsPrint.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailsPrintFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDetailsPrintToJson(this);
}
