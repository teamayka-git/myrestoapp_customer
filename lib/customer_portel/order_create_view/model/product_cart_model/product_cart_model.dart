import 'package:myresto_customer/customer_portel/order_create_view/model/product_bundle_cart.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/product_cart_tax_model.dart';

class ProductCartModel {
  String? productName;
  String? localName;
  String? unitName;
  String? printerIp;
  String? kotNotes;
  String? kitchenName;
  String? unitId;
  String? productImage;
  int? unitPriceLinkingId;
  String? productId;
  String? orderListIdApi;
  double? quantity;
  double? rate;
  bool? isTaxInclusive;
  double? discountAmountItem;
  double? discountPercentageItem;
  double? discountAmountBillwise;
  double? discountPercentageBillwise;
  double? offerAmountItem;
  double? offerPercentageItem;
  double? offerAmountBillwise;
  double? offerPercentageBillwise;
  double? saleTotal;
  double? taxAmt;
  double? taxPercentage;
  double? netTotal;
  List<ProductCartTaxModel>? taxScheme;
  List<ProductBundleCartModel>? listBundles;

  ProductCartModel({
    this.productName,
    this.unitName,
    this.productImage,
    this.kitchenName,
    this.unitId,
    this.printerIp,
    this.unitPriceLinkingId,
    this.orderListIdApi,
    this.isTaxInclusive,
    this.productId,
    this.quantity,
    this.rate,
    this.discountAmountItem,
    this.discountPercentageItem,
    this.discountAmountBillwise,
    this.discountPercentageBillwise,
    this.offerAmountItem,
    this.offerPercentageItem,
    this.offerAmountBillwise,
    this.offerPercentageBillwise,
    this.saleTotal,
    this.taxAmt,
    this.taxPercentage,
    this.netTotal,
    this.localName,
    this.listBundles,
    this.taxScheme,
    this.kotNotes,
  });

  ProductCartModel.create({
    required this.productName,
    required this.unitName,
    required this.localName,
    required this.productImage,
    required this.kitchenName,
    required this.unitId,
    required this.printerIp,
    required this.unitPriceLinkingId,
    required this.orderListIdApi,
    required this.isTaxInclusive,
    required this.productId,
    required this.quantity,
    required this.rate,
    required this.discountAmountItem,
    required this.discountPercentageItem,
    required this.discountAmountBillwise,
    required this.discountPercentageBillwise,
    required this.offerAmountItem,
    required this.offerPercentageItem,
    required this.offerAmountBillwise,
    required this.offerPercentageBillwise,
    required this.saleTotal,
    required this.taxAmt,
    required this.taxPercentage,
    required this.netTotal,
    required this.listBundles,
    required this.taxScheme,
    required this.kotNotes,
  });
}
