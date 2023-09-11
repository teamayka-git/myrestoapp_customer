import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'category_detail.g.dart';

@JsonSerializable()
class CategoryDetail {
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  List<Product>? products;

  CategoryDetail({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.products,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return _$CategoryDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);
}
