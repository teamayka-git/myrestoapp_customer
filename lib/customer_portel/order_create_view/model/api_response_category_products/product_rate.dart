import 'package:json_annotation/json_annotation.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/sale_type_rates.dart';

part 'product_rate.g.dart';

@JsonSerializable()
class ProductRate {
  int? id;
  String? description;
  int? unitId;
  String? unit;
  double? unitQty;
  double? rate;
  int? kitchenId;
  List<SaleTypeRates>? salesTypeRates;

  ProductRate({
    this.id,
    this.description,
    this.unitId,
    this.unit,
    this.unitQty,
    this.rate,
    this.kitchenId,
    this.salesTypeRates,
  });
  factory ProductRate.fromJson(Map<String, dynamic> json) {
    return _$ProductRateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductRateToJson(this);
}
