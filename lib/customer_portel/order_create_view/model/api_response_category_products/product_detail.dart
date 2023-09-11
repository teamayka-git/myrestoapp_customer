import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  int? status;
  List<Product>? products;

  ProductDetail({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.status,
    this.products,
  });

  ProductDetail.create({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.status,
    required this.products,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}
