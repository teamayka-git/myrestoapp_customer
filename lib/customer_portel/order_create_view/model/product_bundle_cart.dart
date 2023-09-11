class ProductBundleCartModel {
  int? bundleId;
  int? productId;
  String? productName;
  String? printerIp;
  String? productNameLocal;
  String? printer;
  int? variantId;
  String? variantName;
  String? productImage;
  double? qty;

  ProductBundleCartModel({
    required this.bundleId,
    required this.productId,
    required this.variantId,
    required this.productName,
    required this.printerIp,
    required this.productNameLocal,
    required this.printer,
    required this.variantName,
    required this.productImage,
    required this.qty,
  });

  Map toJson() => {
        'bundleId': bundleId,
        'productId': productId,
        'variantId': variantId,
        'productName': productName,
        'variantName': variantName,
        'productImage': productImage,
        'qty': qty,
      };
}
