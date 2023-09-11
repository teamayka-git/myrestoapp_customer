import 'package:json_annotation/json_annotation.dart';

import 'product_rate.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? productId;
  String? productCode;
  String? productName;
  String? productNameLocal;
  String? productImage;
  int? categoryId;
  List<ProductRate>? productRates;

  Product({
    this.productId,
    this.productCode,
    this.productName,
    this.productNameLocal,
    this.productImage,
    this.categoryId,
    this.productRates,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
