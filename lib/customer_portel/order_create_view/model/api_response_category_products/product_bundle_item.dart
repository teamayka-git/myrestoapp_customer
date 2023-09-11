import 'package:json_annotation/json_annotation.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/product_bundle_alternative_item.dart';

part 'product_bundle_item.g.dart';

@JsonSerializable()
class ProductBundleItem {
  int? id;
  int? productId;
  int? unitId;
  double? unitQty;
  int? status;
  int? productunitlinkId;
  String? variantName;
  String? productNameLocal;
  String? printerIp;
  String? printer;
  String? productName;
  String? productImage;
  List<ProductBundleAlternative>? alternatives;
  ProductBundleItem(
      {this.id,
      this.productId,
      this.unitId,
      this.unitQty,
      this.status,
      this.variantName,
      this.productName,
      this.productNameLocal,
      this.printerIp,
      this.printer,
      this.productImage,
      this.productunitlinkId,
      this.alternatives});

  factory ProductBundleItem.fromJson(Map<String, dynamic> json) {
    return _$ProductBundleItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductBundleItemToJson(this);
}
