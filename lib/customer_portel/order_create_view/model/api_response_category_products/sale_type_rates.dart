import 'package:json_annotation/json_annotation.dart';

part 'sale_type_rates.g.dart';

@JsonSerializable()
class SaleTypeRates {
  int? salesTypeId;
  String? salesType;
  double? rate;

  SaleTypeRates({
    this.salesTypeId,
    this.salesType,
    this.rate,
  });
  factory SaleTypeRates.fromJson(Map<String, dynamic> json) {
    return _$SaleTypeRatesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaleTypeRatesToJson(this);
}
