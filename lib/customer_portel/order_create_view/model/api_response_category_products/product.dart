import 'package:json_annotation/json_annotation.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/product_bundle_item.dart';

import 'product_rate.dart';
import 'property.dart';
import 'tax_detail.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? productId;
  String? productCode;
  String? productName;
  String? productNameLocal;
  String? productImage;
  String? printer;
  String? kitchen;
  bool? isTaxInclusive;
  List<ProductRate>? productRates;
  List<ProductBundleItem>? productBundles;
  List<TaxDetail>? taxDetails;
  List<Property>? properties;

  Product({
    this.productId,
    this.productCode,
    this.productName,
    this.productNameLocal,
    this.productImage,
    this.printer,
    this.kitchen,
    this.productRates,
    this.productBundles,
    this.taxDetails,
    this.properties,
    this.isTaxInclusive,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
