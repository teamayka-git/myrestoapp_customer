import 'package:json_annotation/json_annotation.dart';

part 'product_rate.g.dart';

@JsonSerializable()
class ProductRate {
  int? rateId;
  int? productId;
  String? barcode;
  String? description;
  String? unit;
  int? unitId;
  double? unitQty;
  double? rate;

  ProductRate({
    this.rateId,
    this.productId,
    this.barcode,
    this.description,
    this.unit,
    this.unitId,
    this.unitQty,
    this.rate,
  });

  factory ProductRate.fromJson(Map<String, dynamic> json) {
    return _$ProductRateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductRateToJson(this);
}
