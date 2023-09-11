import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/address_list.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/payment_methord_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/product_cart_model/product_cart_model.dart';

class OrdersModel {
  String? orderId;
  String? orderNumber;
  String? token;
  String? kotNo;
  String? createdStaffName;
  int? createdStaffId;
  int? createdAt;
  int? editCount;
  int? orderStatus;
  int? paymentStatus;
  int? selectedCategoryId;
  int? selectedOrderType;
  String? deliveryStaffDropDownItemsValue;
  String? deliveryProviderDropDownItemsValue;
  RxList<ProductCartModel>? listCart;
  RxList<PaymentMethordModel>? listPaymentMethords;
  RxList<String>? chairIds;
  RxList<AddressList>? customerAddress;
  TextEditingController? descriptionTextedittingController;
  TextEditingController? onlineReferenceNumbersTextedittingController;
  TextEditingController? takeAwayCustomerNameTextedittingController;
  TextEditingController? takeAwayCustomerMobileTextedittingController;
  TextEditingController? takeAwayCustomerAddressTextedittingController;
  bool? isOrderCreateProgressBarVisibile;
  bool? isShowPageLinearProgressBar;
  bool? isChairUpdated;
  int? intTakeAwayCustomerNameTextedittingController;

  double? gossAmt;
  bool? isDiscountOfferSplittedToItems;
  double? walletPoints;
  double? discountAmt;
  double? discountPercentage;
  double? offerAmt;
  double? offerPercentage;
  double? rewardAmount;
  double? rewardPoint;
  double? taxAmt;
  double? creditLimit; //-1 infinity, other until that payment
  double? creditAmount;
  double? cashAmount;
  double? deliveryChargesAmt;
  double? netAmt;
  double? roundOff;
  bool? isOrderUpdated; //print before edit prevent

  OrdersModel({
    this.orderId,
    this.isOrderUpdated,
    this.createdAt,
    this.token,
    this.createdStaffId,
    this.orderNumber,
    this.orderStatus,
    this.paymentStatus,
    this.kotNo,
    this.listCart,
    this.editCount,
    this.selectedCategoryId,
    this.listPaymentMethords,
    this.deliveryStaffDropDownItemsValue,
    this.selectedOrderType,
    this.deliveryProviderDropDownItemsValue,
    this.onlineReferenceNumbersTextedittingController,
    this.takeAwayCustomerNameTextedittingController,
    this.takeAwayCustomerMobileTextedittingController,
    this.takeAwayCustomerAddressTextedittingController,
    this.intTakeAwayCustomerNameTextedittingController,
    this.chairIds,
    this.isOrderCreateProgressBarVisibile,
    this.isShowPageLinearProgressBar,
    this.gossAmt,
    this.isDiscountOfferSplittedToItems,
    this.walletPoints,
    this.discountAmt,
    this.discountPercentage,
    this.offerAmt,
    this.offerPercentage,
    this.createdStaffName,
    this.rewardAmount,
    this.rewardPoint,
    this.taxAmt,
    this.creditLimit,
    this.creditAmount,
    this.cashAmount,
    this.deliveryChargesAmt,
    this.netAmt,
    this.roundOff,
    this.descriptionTextedittingController,
    this.customerAddress,
    this.isChairUpdated,
  });
  OrdersModel.create(
      {required this.orderId,
      required this.orderStatus,
      required this.isOrderUpdated,
      required this.token,
      required this.orderNumber,
      required this.selectedOrderType,
      required this.paymentStatus,
      required this.createdAt,
      required this.listCart,
      required this.kotNo,
      required this.selectedCategoryId,
      required this.deliveryProviderDropDownItemsValue,
      required this.listPaymentMethords,
      required this.deliveryStaffDropDownItemsValue,
      required this.onlineReferenceNumbersTextedittingController,
      required this.takeAwayCustomerNameTextedittingController,
      required this.takeAwayCustomerMobileTextedittingController,
      required this.takeAwayCustomerAddressTextedittingController,
      required this.createdStaffName,
      required this.createdStaffId,
      required this.intTakeAwayCustomerNameTextedittingController,
      required this.chairIds,
      required this.isOrderCreateProgressBarVisibile,
      required this.isShowPageLinearProgressBar,
      required this.gossAmt,
      required this.editCount,
      required this.isDiscountOfferSplittedToItems,
      required this.walletPoints,
      required this.discountAmt,
      required this.discountPercentage,
      required this.offerAmt,
      required this.offerPercentage,
      required this.rewardAmount,
      required this.rewardPoint,
      required this.taxAmt,
      required this.creditLimit,
      required this.creditAmount,
      required this.cashAmount,
      required this.deliveryChargesAmt,
      required this.netAmt,
      required this.roundOff,
      required this.descriptionTextedittingController,
      required this.isChairUpdated,
      required this.customerAddress});
}
