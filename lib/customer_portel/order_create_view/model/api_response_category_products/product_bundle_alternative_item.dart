import 'package:json_annotation/json_annotation.dart';

part 'product_bundle_alternative_item.g.dart';

@JsonSerializable()
class ProductBundleAlternative {
  int? id;
  int? productId;
  int? unitId;
  double? unitQty;
  int? status;
  String? variantName;
  String? productName;
  String? productImage;
  String? productNameLocal;
  String? printerIp;
  String? printer;
  int? productunitlinkId;

  ProductBundleAlternative(
      {this.id,
      this.productId,
      this.unitId,
      this.unitQty,
      this.status,
      this.variantName,
      this.productunitlinkId,
      this.productName,
      this.productNameLocal,
      this.printerIp,
      this.printer,
      this.productImage});

  factory ProductBundleAlternative.fromJson(Map<String, dynamic> json) {
    return _$ProductBundleAlternativeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductBundleAlternativeToJson(this);
}
