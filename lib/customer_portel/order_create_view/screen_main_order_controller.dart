import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myresto_customer/api_utils/ayka_ok_toast.dart';
import 'package:myresto_customer/api_utils/tables_value/global_settings_table_value.dart';
import 'package:myresto_customer/api_utils/tables_value/payment_methord_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_order_table_order_status_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_order_table_order_type_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_order_table_payment_status_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_type_table_value.dart';
import 'package:myresto_customer/api_utils/tables_value_get/sales_order_table_get.dart';
import 'package:myresto_customer/constants/get_storage_box.dart';
import 'package:myresto_customer/constants/get_storage_events.dart';
import 'package:myresto_customer/api_utils/tables_value/kot_print_action_status.dart';
import 'package:myresto_customer/constants/nextdines_constants.dart';
import 'package:myresto_customer/main_global_controller.dart';
import 'package:myresto_customer/models/ayka_autocomplete_textview_api_string.dart';
import 'package:myresto_customer/models/print_kot_items.dart';
import 'package:myresto_customer/models/spinner_int_string.dart';
import 'package:myresto_customer/models/spinner_string_string.dart';
import 'package:myresto_customer/repository/box_repository.dart';
import 'package:myresto_customer/screen_utils/responsive.dart';

import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_edit_order/api_request_edit_order.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_edit_order/bundle_alternatives.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_edit_order/paymnentdetail.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_order_create/api_request_order_create.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_order_create/bundle_alternative.dart' as createAlternative;
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_order_create/payment_detail.dart' as create_ayment_etails;
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_order_create/sales_order_detail.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_edit_order/sales_order_detail.dart'  as edit;
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_order_create/tax_scheme.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_user_favorites_change/api_request_user_favorites_change.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/api_response_category_products.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/product.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/product_detail.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/shift_data.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/address_list.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/api_response_customer_get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/customer_detail.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_get_tables/api_response_get_tables.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_order_create/api_response_order_create.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/chair_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/orders/orders.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/payment_methord_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/product_cart_model/product_cart_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/sale_type_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/table_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_create_repository.dart';
import 'package:myresto_customer/utils/accounts_amount_calculation/accounts_amount_calculation_bill_item_ratetotal_tax_net_model.dart';
import 'package:myresto_customer/utils/accounts_amount_calculation/accounts_amount_calculation_utils.dart';


class ScreenMainOrderController extends GetxController {
  final ScreenMainOrderCreateRepository screenMyWorkNewWork =
      ScreenMainOrderCreateRepository();

  RxBool isMainApiLoading = false.obs;
  RxBool mainApiErrorOccured = false.obs;
  var mainApiErrorString = "Something went wrong".obs;
  var mainApiList = <ProductDetail>[].obs;
  RxBool isButtonOnKotOn = true.obs;
  Timer? _searchTextDebounce;

  var tempObxIssueSolving = 0.0.obs;
  var totalOrders = 0.obs;

  var isShowRightWidget = true.obs;
  var isCustomerAddressEnabled = true.obs;
  var istableDialogRefreshProgressbar = false.obs;
  var productSearchTextController = TextEditingController().obs;

  RxBool isWaiterScreenUnderWorkingForDisableButtons = false.obs;
  // var selectedOrderType = 0.obs; //0-Dine in, 1-takeaway, 2-Delivery, 3-Online

  var tempObxValue = 4.obs;
  var isShowNameSearchProgressbar = false.obs;
  int indexForAutoCompleteTextViewKey = 0;

  var printDetailsCompanyName = "".obs;
  var printDetailsCompanyCaption = "".obs;
  var printDetailsCompanyAddress = "".obs;
  var printDetailsCompanyCity = "".obs;
  var printDetailsCompanyPhone = "".obs;
  var printDetailsCompanyVat = "".obs;
  var printDetailsFooterSmall = "".obs;
  var printDetailsFooterBig = "".obs;

  var currentOrderIndex = 0.obs;
  var orders = <OrdersModel>[].obs;
  List<SpinnerStringString> staffListDropDownItems =
      <SpinnerStringString>[].obs;
  var userFavoritesList = <int>[].obs;
  // List<SpinnerIntString> statusDropDownItems = <SpinnerIntString>[].obs;

  RxList<TableModel> tableChair = <TableModel>[].obs;
  RxList<SpinnerStringString> deliveryStaffs = <SpinnerStringString>[].obs;
  RxList<SpinnerStringString> deliveryProviders = <SpinnerStringString>[].obs;
  RxList<SaleTypeModel> salesTypes = <SaleTypeModel>[].obs;

// List<TableModel> getTableListForTableListDialog(){
// List<TableModel> sortedList=tableChair;

//    sortedList.sort((a, b) => b.seatCount!.compareTo(a.seatCount!));
//    return sortedList;
// }

  void addAndRemoveUserFavorites(int productId) async {
    int indexUserFavorites = (userFavoritesList
        .indexWhere((elementFavorites) => elementFavorites == productId));

    if (indexUserFavorites == -1) {
      userFavoritesList.add(productId);
      addProductToUserFavorite(productId);
      mainApiList.refresh();
    } else {
      userFavoritesList.removeAt(indexUserFavorites);
      removeProductToUserFavorite(productId);
      mainApiList.refresh();
    }

    final ScreenMainOrderCreateRepository screenMyWorkNewWork =
        ScreenMainOrderCreateRepository();
    var data = ApiRequestUserFavoritesChange(
        productId: productId, isAdd: (indexUserFavorites == -1) ? true : false);

    final Either<String, String> resultOrException =
        await screenMyWorkNewWork.userFavoritesChange(data);

    resultOrException.fold((left) {
      aykaOkToast(left);
      if (indexUserFavorites != -1) {
        addProductToUserFavorite(productId);
        userFavoritesList.add(productId);
        mainApiList.refresh();
      } else {
        removeProductToUserFavorite(productId);

        userFavoritesList.removeAt(indexUserFavorites);
        mainApiList.refresh();
      }
    }, (data) {});
  }

  checkFavoriteCategoryExistOrAdd() {
    int favoriteCategoryIndex = mainApiList.indexWhere(
        (elementFavoriteCategory) => elementFavoriteCategory.categoryId == -2);

    if (favoriteCategoryIndex == -1) {
      mainApiList.insert(
          1,
          ProductDetail.create(
              categoryId:
                  -2, //if favorite item exist then only favorite category show
              categoryName: "favorites".tr,
              categoryImage: "favorites",
              status: 1,
              products: []));
    }
  }

  addProductToUserFavorite(int productId) {
    checkFavoriteCategoryExistOrAdd();

    int indexAllProductProduct = mainApiList[0].products!.indexWhere(
        (elementFavorite) => elementFavorite.productId == productId);

    int favoriteCategoryIndex = mainApiList.indexWhere(
        (elementFavoriteCategory) => elementFavoriteCategory.categoryId == -2);

    if (favoriteCategoryIndex != -1) {
      mainApiList[favoriteCategoryIndex]
          .products!
          .add(mainApiList[0].products![indexAllProductProduct]);
    }
  }

  removeProductToUserFavorite(int productId) {
    checkFavoriteCategoryExistOrAdd();

    int favoriteCategoryIndex = mainApiList.indexWhere(
        (elementFavoriteCategory) => elementFavoriteCategory.categoryId == -2);
    if (favoriteCategoryIndex != -1) {
      int indexFavoriteProductProduct = mainApiList[favoriteCategoryIndex]
          .products!
          .indexWhere(
              (elementFavorite) => elementFavorite.productId == productId);

      mainApiList[favoriteCategoryIndex]
          .products!
          .removeAt(indexFavoriteProductProduct);

      if (mainApiList[favoriteCategoryIndex].products!.isEmpty) {
        mainApiList.removeAt(favoriteCategoryIndex);
      }
    }
  }

  String getTableSelectDialogSubTitleString(TableModel tableElement) {
//here we are t=returning free and total seat number
// tableChair
    var returnString = "";

    var listFreeChairs = tableElement.chairs!.where((element) =>
        element.isFree == true &&
        orders[currentOrderIndex.value].chairIds!.indexWhere(
                (elementChild) => elementChild == element.chairId) ==
            -1);

    returnString =
        "Free: ${listFreeChairs.length}/${tableElement.chairs!.length}";
    return returnString;
  }

  String getTableSelectDialogTotalFreeChairString() {
    var returnString = "";

    var totalFree = 0;
    tableChair.forEach((elementMain) {
      var listFreeChairs = elementMain.chairs!.where((element) =>
          element.isFree == true &&
          orders[currentOrderIndex.value].chairIds!.indexWhere(
                  (elementChild) => elementChild == element.chairId) ==
              -1);
      totalFree += listFreeChairs.length;
    });

    returnString = " - " + totalFree.toString();
    return returnString;
  }

  logOrders() {
    print("___________ order print start_______________");

    var orderIndex = 0;
    orders.forEach((elementOrder) {
      print("__order index $orderIndex");
      print("__orderId ${elementOrder.orderId}");
      print("__cartLength ${elementOrder.listCart!.length}");

      var orderCartIndex = 0;
      elementOrder.listCart!.forEach((elementCart) {
        print("__order cart index $orderCartIndex");
        print("__order cart product namer ${elementCart.productName}");
        print("__order cart variant namer ${elementCart.unitName}");

        print("__order cart bundles length ${elementCart.listBundles!.length}");

        var orderCartBundlesIndex = 0;
        elementCart.listBundles!.forEach((elementCartBundles) {
          print("__order cart bundle index $orderCartBundlesIndex");

          print(
              "__order cart bundle product name ${elementCartBundles.productName}");
          print(
              "__order cart bundle variant name ${elementCartBundles.variantName}");
          print("__order cart bundle id ${elementCartBundles.bundleId}");
          print("__order cart product id ${elementCartBundles.productId}");

          orderCartBundlesIndex++;
        });

        orderCartIndex++;
      });

      orderIndex++;
    });

    print("___________ order print end_______________");
  }

//
  List<PrintKotItems> getprintKotItems(
      {required bool isShowBundleProductItems}) {
    List<PrintKotItems> listPrintItems = [];
    print("_______    dd1");
    orders[currentOrderIndex.value].listCart!.forEach((elementPrint) {
      int indexProductAllProduct = mainApiList[0].products!.indexWhere(
          (element) => element.productId.toString() == elementPrint.productId);

      if (isShowBundleProductItems == false) {
        listPrintItems.add(PrintKotItems(
            name: elementPrint.productName!,
            variantName: elementPrint.unitName!,
            qty: elementPrint.quantity!,
            status: KotPrintActionStatus.nilItem,
            isStrike: false,
            kotNote: elementPrint.kotNotes!,
            kitchenName: elementPrint.kitchenName!,
            unitPrice: elementPrint.rate!,
            printIp: elementPrint.printerIp!,
            totalPrice: elementPrint.netTotal!,
            localName: elementPrint.localName!));
      } else {
        if (mainApiList[0]
                .products![indexProductAllProduct]
                .productBundles!
                .length ==
            0) {
          print("_______    dd3");
          print("_______    dd3001   ${elementPrint.printerIp!}");
          listPrintItems.add(PrintKotItems(
              name: elementPrint.productName!,
              variantName: elementPrint.unitName!,
              qty: elementPrint.quantity!,
              status: KotPrintActionStatus.nilItem,
              isStrike: false,
              kotNote: elementPrint.kotNotes!,
              kitchenName: elementPrint.kitchenName!,
              unitPrice: elementPrint.rate!,
              printIp: elementPrint.printerIp!,
              totalPrice: elementPrint.netTotal!,
              localName: elementPrint.localName!));
          print("_______    dd4");
        } else {
          print("_______    dd5");
          mainApiList[0]
              .products![indexProductAllProduct]
              .productBundles!
              .forEach((elementBundleItem) {
            print("_______    dd6");

            int indexAlternative = elementPrint.listBundles!.indexWhere(
                (elementBundle) =>
                    elementBundle.bundleId == elementBundleItem.id);
            print("_______    dd7");
            if (indexAlternative == -1) {
              print("_______    dd8");
              listPrintItems.add(PrintKotItems(
                  name: elementBundleItem.productName!,
                  variantName: elementBundleItem.variantName!,
                  qty: elementBundleItem.unitQty! * elementPrint.quantity!,
                  isStrike: false,
                  kotNote: elementPrint.kotNotes!,
                  status: KotPrintActionStatus.nilItem,
                  kitchenName: elementBundleItem.printer!,
                  unitPrice: elementPrint.rate!,
                  printIp: elementBundleItem.printerIp!,
                  totalPrice: elementPrint.netTotal!,
                  localName: elementBundleItem.productNameLocal!));
              print("_______    dd3002   ${elementBundleItem.printerIp!}");
              print("_______    dd9");
            } else {
              print("_______    dd10");

              listPrintItems.add(PrintKotItems(
                  name:
                      elementPrint.listBundles![indexAlternative].productName!,
                  variantName:
                      elementPrint.listBundles![indexAlternative].variantName!,
                  qty: elementPrint.listBundles![indexAlternative].qty! *
                      elementPrint.quantity!,
                  isStrike: false,
                  status: KotPrintActionStatus.nilItem,
                  kotNote: elementPrint.kotNotes!,
                  kitchenName:
                      elementPrint.listBundles![indexAlternative].printer!,
                  unitPrice: elementPrint.rate!,
                  printIp:
                      elementPrint.listBundles![indexAlternative].printerIp!,
                  totalPrice: elementPrint.netTotal!,
                  localName: elementPrint
                      .listBundles![indexAlternative].productNameLocal!));
            }
            print("_______    dd11");
          });
          print("_______    dd12");
        }
      }
      print("_______    dd13");
    });
    print("_______    dd14 ${listPrintItems.length}");
    return listPrintItems;
  }

  List<AykaAutocompleteTextviewApiString> getKitchenFiltered() {
    List<AykaAutocompleteTextviewApiString> listFilteredKitchen = [];
    getprintKotItems(isShowBundleProductItems: true).forEach((element) {
      if (listFilteredKitchen.indexWhere((elementIndexWhere) =>
              elementIndexWhere.name == element.kitchenName) ==
          -1) {
        listFilteredKitchen.add(AykaAutocompleteTextviewApiString(
            name: element.kitchenName, returnValue: element.printIp));
      }
    });
    return listFilteredKitchen;
  }

  Future<void> getMainApiList() async {
    mainApiErrorOccured(false);
    final Either<String, ApiResponseCategoryProducts> resultOrException =
        await screenMyWorkNewWork.getCountry();

    isMainApiLoading(false);
    resultOrException.fold((left) {
      mainApiErrorOccured(true);
      mainApiErrorString.value = left;
    }, (datareturn) async {
      mainApiErrorOccured(false);
      mainApiList.clear();



      if (datareturn.data!.productDetails!.isNotEmpty) {
        List<Product> tempProducts = <Product>[];
        for (var element in datareturn.data!.productDetails!) {
          tempProducts.addAll(element.products!);
        }
        datareturn.data!.productDetails!.insert(
            0,
            ProductDetail.create(
                categoryId: -1,
                categoryName: "all".tr,
                categoryImage: "all",
                status: 1,
                products: tempProducts));

        userFavoritesList.addAll(datareturn.data!.userFavorites!);

        if (datareturn.data!.userFavorites!.isNotEmpty) {
          List<Product> favoriteProducts = [];

          datareturn.data!.userFavorites!.forEach((elementFavoriteApi) {
            int indexTempProduct = tempProducts.indexWhere(
                (elementTempProduct) =>
                    elementTempProduct.productId == elementFavoriteApi);
            if (indexTempProduct != -1) {
              favoriteProducts.add(tempProducts[indexTempProduct]);
            }
          });

          datareturn.data!.productDetails!.insert(
              1,
              ProductDetail.create(
                  categoryId:
                      -2, //if favorite item exist then only favorite category show
                  categoryName: "favorites".tr,
                  categoryImage: "favorites",
                  status: 1,
                  products: favoriteProducts));
        }

        orders[currentOrderIndex.value].selectedCategoryId =
            datareturn.data!.productDetails![0].categoryId!;
        mainApiList.addAll(datareturn.data!.productDetails!);
      }

      tableChair.clear();
      for (var elementTable in datareturn.data!.tableDetails!) {
        List<ChairModel> tableChairsFromApi = [];
        for (var elementTableChair in elementTable.chairs!) {
          tableChairsFromApi.add(ChairModel(
              chairId: elementTableChair.chairId!.toString(),
              name: elementTableChair.chairName!.toString(),
              isFree: elementTableChair.isFree!));
        }
        tableChair.add(TableModel(
            tableId: elementTable.tableId!.toString(),
            name: elementTable.tableName!.toString(),
            seatCount: tableChairsFromApi.length,
            chairs: tableChairsFromApi));
      }
      deliveryStaffs.clear();
      for (var elementDeliveryStaff in datareturn.data!.deliveryStaffs!) {
        deliveryStaffs.add(SpinnerStringString(
            id: elementDeliveryStaff.userId!.toString(),
            value: elementDeliveryStaff.fullname!.toString()));
      }
      deliveryProviders.clear();

      for (var elementDeliveryStaff
          in datareturn.data!.onlinedeliveryProviders!) {
        deliveryProviders.add(SpinnerStringString(
            id: elementDeliveryStaff.id!.toString(),
            value: elementDeliveryStaff.name!.toString()));
      }

      staffListDropDownItems.clear();
      for (var elementWaiter in datareturn.data!.staffList!) {
        staffListDropDownItems.add(SpinnerStringString(
            id: elementWaiter.userId.toString(),
            value: elementWaiter.fullname!));
      }

      salesTypes.clear();
      for (var elementWaiter in datareturn.data!.salesType!) {
        salesTypes.add(SaleTypeModel(
            id: elementWaiter.id!,
            name: elementWaiter.type!,
            selections: elementWaiter.selections!));
      }

      if (salesTypes.isNotEmpty &&
          orders[currentOrderIndex.value].selectedOrderType == -1 &&
          orders[currentOrderIndex.value].listCart!.isEmpty) {
        orders[currentOrderIndex.value].selectedOrderType = salesTypes[0].id;
      }

      totalOrders.value = datareturn.data!.totalOrders!;
      // totalDineIn.value = datareturn.data!.totalDineIn!;
      // totalDelivery.value = datareturn.data!.totalDelivery!;
      // totalTakeAway.value = datareturn.data!.totalTakeAway!;
      // totalOnline.value = datareturn.data!.totalOnline!;

      orders.assignAll([...orders]);

      var companyName = "";
      var companyCaption = "";
      var companyAddress = "";
      var companyCity = "";
      var companyPhone = "";
      var companyVat = "";
      var footerSmall = "";
      var footerBig = "";

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.companyName.toString()) !=
          -1) {
        companyName = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.companyName.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.companyCaption.toString()) !=
          -1) {
        companyCaption = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.companyCaption.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.companyAddress.toString()) !=
          -1) {
        companyAddress = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.companyAddress.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.companyCity.toString()) !=
          -1) {
        companyCity = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.companyCity.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.companyPhone.toString()) !=
          -1) {
        companyPhone = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.companyPhone.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.companyVat.toString()) !=
          -1) {
        companyVat = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.companyVat.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.printFooterSmall.toString()) !=
          -1) {
        footerSmall = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.printFooterSmall.toString())]
            .string!;
      }

      if (datareturn.data!.printDetails!.indexWhere((elementPrinter) =>
              elementPrinter.code ==
              GlobalSettingsTableValue.printFooterBig.toString()) !=
          -1) {
        footerBig = datareturn
            .data!
            .printDetails![datareturn.data!.printDetails!.indexWhere(
                (elementPrinter) =>
                    elementPrinter.code ==
                    GlobalSettingsTableValue.printFooterBig.toString())]
            .string!;
      }

      printDetailsCompanyName.value = companyName;
      printDetailsCompanyCaption.value = companyCaption;
      printDetailsCompanyAddress.value = companyAddress;
      printDetailsCompanyCity.value = companyCity;
      printDetailsCompanyPhone.value = companyPhone;
      printDetailsCompanyVat.value = companyVat;
      printDetailsFooterSmall.value = footerSmall;
      printDetailsFooterBig.value = footerBig;

      print("____footerSmall  $footerSmall");
      print("____footerBig  $footerBig");

      var stateUserMainPermissionController = Get.put(MainGlobalController());

      stateUserMainPermissionController.permissionCodes.clear();
      stateUserMainPermissionController.permissionCodes
          .addAll(datareturn.data!.userDetails!.permissions!);

      refreshRateDependOnSaleType();
    });
  }

  String getPaymentMethordName({required int orderIndex}) {
    if (orders[orderIndex].listPaymentMethords!.isEmpty) {
      return "";
    } else if (orders[orderIndex].listPaymentMethords!.length > 1) {
      return "Split";
    } else {
      var returnString = "";
      switch (orders[orderIndex].listPaymentMethords![0].type) {
        case PaymentMethordValue.card:
          returnString = "Card";
          break;

        case PaymentMethordValue.cash:
          returnString = "Cash";
          break;

        case PaymentMethordValue.upi:
          returnString = "UPI";
          break;
      }
      return returnString;
    }
  }

  String getDeliveryProviderName() {
    String providerId =
        orders[currentOrderIndex.value].deliveryProviderDropDownItemsValue!;

    if (providerId == "") {
      return "";
    }

    int indexProvider =
        deliveryProviders.indexWhere((element) => element.id == providerId);

    if (indexProvider == -1) {
      return "";
    }

    return deliveryProviders[indexProvider].value;
  }

  List<Product> getProductsSelectedCategory() {
    var indexOfCategory = mainApiList.indexWhere((element) =>
        element.categoryId ==
        orders[currentOrderIndex.value].selectedCategoryId);

    List<Product> returnList = mainApiList[indexOfCategory].products!;
    if (productSearchTextController.value.text.trim() != "") {
      returnList = returnList
          .where((p0) => ((p0.productName!.toLowerCase().contains(
                  productSearchTextController.value.text
                      .trim()
                      .toLowerCase())) ||
              (p0.productCode!.toLowerCase().toString() ==
                  productSearchTextController.value.text
                      .trim()
                      .toLowerCase()) ||
              (p0.productNameLocal!.toLowerCase().contains(
                  productSearchTextController.value.text
                      .trim()
                      .toLowerCase())) ||
              (p0.productRates!
                      .where((elementCheckPrice) =>
                          elementCheckPrice.rate!.toInt().toString() ==
                          productSearchTextController.value.text
                              .trim()
                              .toLowerCase())
                      .length !=
                  0)))
          .toList();
    }
    return returnList;
//  RxList<Product> returnListFinal = <Product>[].obs;
//     returnListFinal.addAll(returnList);
//     return returnListFinal;
  }

  String getProductsSelectedCategoryName() {
    var indexOfCategory = mainApiList.indexWhere((element) =>
        element.categoryId ==
        orders[currentOrderIndex.value].selectedCategoryId);
    return mainApiList[indexOfCategory].categoryName!;
  }

  removeOrder(int index) {
    if (orders.length == 1) {
      aykaOkToast("Only one order there");
      return;
    }
    orders.removeAt(index);

    currentOrderIndex.value = 0;
  }

  selectCategoryOnClickEvent(int categoryId) {
    orders[currentOrderIndex.value].selectedCategoryId = categoryId;
    orders.assignAll([...orders]);
  }

  String getCurrentCategoryName() {
    var selectedCategoryIndex = mainApiList.indexWhere(
        (elementMobileCategory) =>
            elementMobileCategory.categoryId ==
            orders[currentOrderIndex.value].selectedCategoryId);
    if (selectedCategoryIndex == -1) {
      return "error".tr;
    } else {
      return mainApiList[selectedCategoryIndex].categoryName!;
    }
  }

  int getCurrentToken(int index) {
    var token = 1000000000;
    // switch (orders[index].selectedOrderType) {
    //   case SalesOrderTableOrderType.dine:
    //     token = totalDineIn.value;
    //     break;
    //   case SalesOrderTableOrderType.takeaway:
    //     token = totalTakeAway.value;
    //     break;
    //   case SalesOrderTableOrderType.delivery:
    //     token = totalDelivery.value;
    //     break;
    //   case SalesOrderTableOrderType.online:
    //     token = totalOnline.value;
    //     break;
    // }

    return token;
  }

  bool validationCheckBeforeOrderCreateOrEdit() {
    if (orders[currentOrderIndex.value].listCart!.isEmpty) {
      aykaOkToast("cart_is_empty".tr);
      return false;
    }
    if (orders[currentOrderIndex.value].listCart!.indexWhere(
            (elementCheckRate) => elementCheckRate.netTotal == -1) !=
        -1) {
      aykaOkToast("price_not_linked_items_found_in_cart".tr);
      return false;
    }
    if (getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
            elementSelections == SalesTypeTableValue.tableSelection) !=
        -1) {
      if (orders[currentOrderIndex.value].chairIds!.isEmpty) {
        aykaOkToast("table_not_selected".tr);
        return false;
      }
    }
    // if (getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
    //         elementSelections == SalesTypeTableValue.deliveryBoy) !=
    //     -1) {
    //   if (orders[currentOrderIndex.value].deliveryStaffDropDownItemsValue ==
    //       "") {
    //     aykaOkToast("delivery_staff_not_selected".tr);
    //     return false;
    //   }
    // }
    if (getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
                elementSelections == SalesTypeTableValue.tableSelection) ==
            -1 &&
        getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
                elementSelections == SalesTypeTableValue.customerData) !=
            -1) {
      if (orders[currentOrderIndex.value]
              .takeAwayCustomerNameTextedittingController!
              .text
              .trim() ==
          "") {
        aykaOkToast("customer_name_is_empty".tr);
        return false;
      } else if (orders[currentOrderIndex.value]
              .takeAwayCustomerMobileTextedittingController!
              .text
              .trim() ==
          "") {
        aykaOkToast("customer_phone_is_empty".tr);
        return false;
      } else if (orders[currentOrderIndex.value]
              .takeAwayCustomerAddressTextedittingController!
              .text
              .trim() ==
          "") {
        aykaOkToast("customer_address_is_empty".tr);
        return false;
      }
    }

    if (getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
            elementSelections == SalesTypeTableValue.onlineOrder) !=
        -1) {
      if (orders[currentOrderIndex.value].deliveryProviderDropDownItemsValue ==
          "") {
        aykaOkToast("delivery_provider_not_selected".tr);
        return false;
      }
    }
    return true;
  }


  Future<void> createOrder(int indexOrderCreate, BuildContext context) async {
    if (validationCheckBeforeOrderCreateOrEdit()) {
      orders[indexOrderCreate].isOrderCreateProgressBarVisibile = true;
      isWaiterScreenUnderWorkingForDisableButtons.value = true;

      orders.assignAll([...orders]);
      List<SalesOrderDetail> listItems = <SalesOrderDetail>[];

      for (var elementCartItem in orders[indexOrderCreate].listCart!) {
        List<createAlternative.BundleAlternative> listAlternativesOfBundle =
            <createAlternative.BundleAlternative>[];

        elementCartItem.listBundles!.forEach((elementAlternative) {
          listAlternativesOfBundle.add(
              createAlternative.BundleAlternative.create(
                  id: elementAlternative.bundleId,
                  productId: elementAlternative.productId,
                  unitId: elementAlternative.variantId,
                  unitQty: elementAlternative.qty));
        });

        List<TaxScheme> taxScheme = [];
        var _stateMainGlobalcontroller = Get.put(MainGlobalController());
        if (_stateMainGlobalcontroller.isEnableTaxCalculation.value) {
          var totalTax = 0.0;

          elementCartItem.taxScheme!.forEach((elementTaxSum) {
            totalTax += elementTaxSum.percentage!;
          });

          elementCartItem.taxScheme!.forEach((elementTax) {
            taxScheme.add(TaxScheme.create(
                taxId: elementTax.taxId,
                taxRate: AccountsAmountCalculationUtils()
                    .getBillItem_saleTotal_taxAmt_netAmt(
                        isEnableTaxCalculation: _stateMainGlobalcontroller
                            .isEnableTaxCalculation.value,
                        isInclusive: elementCartItem.isTaxInclusive!,
                        isEnableBillSplit: orders[indexOrderCreate]
                            .isDiscountOfferSplittedToItems!,
                        rate: elementCartItem.rate!,
                        qty: elementCartItem.quantity!,
                        discAmountItem: elementCartItem.discountAmountItem!,
                        discAmountBillWise:
                            elementCartItem.discountAmountBillwise!,
                        offerAmountItem: elementCartItem.offerAmountItem!,
                        offerAmountBillWise:
                            elementCartItem.offerAmountBillwise!,
                        taxPercentage: elementTax.percentage!,
                        totalTaxPercentage: totalTax)
                    .taxAmt));
          });
        }

        listItems.add(SalesOrderDetail.create(
            productId: int.parse(elementCartItem.productId!),
            productName: elementCartItem.productName,
            unitId: int.parse(elementCartItem.unitId!),
            qty: elementCartItem.quantity,
            rate: elementCartItem.rate!,
            bundleAlternatives: listAlternativesOfBundle,
            discountAmount: elementCartItem.discountAmountItem,
            discountPercent: elementCartItem.discountPercentageItem,
            billWisediscountAmount: elementCartItem.discountAmountBillwise,
            billWisediscountPercent: elementCartItem.discountPercentageBillwise,
            taxAmount: elementCartItem.taxAmt,
            netAmount: elementCartItem.netTotal,
            offerAmountBill: elementCartItem.offerAmountBillwise,
            offerAmountItem: elementCartItem.offerAmountItem,
            offerPercentBill: elementCartItem.offerPercentageBillwise,
            offerPercentItem: elementCartItem.offerPercentageItem,
            orderListId: int.parse(elementCartItem.orderListIdApi!),
            saleTotal: elementCartItem.saleTotal!,
            status: 1,
            taxScheme: taxScheme,
            properties: [],
            kitchenId: 0,
            kotNotes: elementCartItem.kotNotes!,
            kotStatus: 1));
      }

      List<create_ayment_etails.PaymentDetail> paymentDetails =
          <create_ayment_etails.PaymentDetail>[];
      for (var elementPaymentItem
          in orders[indexOrderCreate].listPaymentMethords!) {
        paymentDetails.add(create_ayment_etails.PaymentDetail.create(
            typeId: elementPaymentItem.type, amount: elementPaymentItem.cash!));
      }

      List<int> chairIds = [];
      orders[indexOrderCreate].chairIds!.forEach((element) {
        chairIds.add(int.parse(element));
      });

      print("____delStaff " +
          orders[indexOrderCreate].deliveryStaffDropDownItemsValue!.toString());
      print("____netAmount    ${orderNetAmount(orderIndex: indexOrderCreate)}");

      var payload = ApiRequestOrderCreate.create(
          editCount: orders[indexOrderCreate].editCount!,
          customerId: -1,
          deliveryProviderId:
              (orders[indexOrderCreate].deliveryProviderDropDownItemsValue == "")
                  ? -1
                  : int.parse(orders[indexOrderCreate]
                      .deliveryProviderDropDownItemsValue!),
          orderDate: 0,
          isTableChanged: orders[indexOrderCreate].isChairUpdated,
          paymentStatus: orders[indexOrderCreate].paymentStatus,
          customerName: orders[indexOrderCreate]
              .takeAwayCustomerNameTextedittingController!
              .text,
          customerAddress: orders[indexOrderCreate]
              .takeAwayCustomerAddressTextedittingController!
              .text,
          deliveryStaffId:
              (orders[indexOrderCreate].deliveryStaffDropDownItemsValue! == "")
                  ? -1
                  : int.parse(orders[indexOrderCreate]
                      .deliveryStaffDropDownItemsValue!),
          // -1,
          createdBy: orders[indexOrderCreate].createdStaffId,
          customerPhone: orders[indexOrderCreate]
              .takeAwayCustomerMobileTextedittingController!
              .text,
          onlineReferenceNumber: orders[indexOrderCreate]
              .onlineReferenceNumbersTextedittingController!
              .text,
          grossAmount: orderGrossAmount(orderIndex: indexOrderCreate),
          discountAmount: orderDiscountAmount(),
          cashAmount: orders[currentOrderIndex.value].cashAmount,
          customerCredit: orders[currentOrderIndex.value].creditAmount,
          deliveryCharge: orders[currentOrderIndex.value].deliveryChargesAmt,
          description: orders[
                  currentOrderIndex.value]
              .descriptionTextedittingController!
              .text,
          discountPercent: orders[currentOrderIndex.value].discountPercentage,
          isApplyToProduct:
              orders[currentOrderIndex.value].isDiscountOfferSplittedToItems,
          offerAmount: orders[currentOrderIndex.value].offerAmt,
          offerPercent: orders[currentOrderIndex.value].offerPercentage,
          orderId: int.parse(orders[currentOrderIndex.value].orderId!),
          paymentDetails: paymentDetails,
          rewardAmount: orders[currentOrderIndex.value].rewardAmount,
          rewardPoint: orders[currentOrderIndex.value].rewardPoint,
          roundOff: orders[currentOrderIndex.value].roundOff,
          taxAmount: orderTax(orderIndex: indexOrderCreate),
          netAmount: orderNetAmount(orderIndex: indexOrderCreate),
          orderStatus: orders[indexOrderCreate].orderStatus,
          saleType: orders[indexOrderCreate].selectedOrderType,
          chairsId: chairIds,
          salesOrderDetails: listItems);

      payload.salesOrderDetails!.forEach((elementProduct) {
        print("product item   " + elementProduct.toJson().toString());

        elementProduct.bundleAlternatives!
            .forEach((elementProductAlternatives) {
          print("product item bundle alternatives   " +
              elementProductAlternatives.toJson().toString());
        });
      });

      // orders[indexOrderCreate].isOrderCreateProgressBarVisibile = false;
      // return;

      int orderIndexBeforeApiCall = currentOrderIndex.value;

      final Either<String, ApiResponseOrderCreate> resultOrException =
          await screenMyWorkNewWork.orderCreate(payload: payload);

      resultOrException.fold((left) {
        aykaOkToast(left);
        isWaiterScreenUnderWorkingForDisableButtons.value = true;
        orders[indexOrderCreate].isOrderCreateProgressBarVisibile = false;
        orders.assignAll([...orders]);
      }, (datareturn) async {
        print("____s1");
        if (datareturn.data!.orderDetails!.length != 0) {
          List<String> listCustomerDetailsString = [];

         

          orders[orderIndexBeforeApiCall].orderNumber =
              datareturn.data!.orderDetails![0].orderNumber!.toString();


        }
print("____s2");
        totalOrders.value = totalOrders.value + 1;
        // if (orders[indexOrderCreate].selectedOrderType ==
        //     SalesOrderTableOrderType.dine) {
        // totalDineIn.value = totalDineIn.value + 1;
        // } else if (orders[indexOrderCreate].selectedOrderType ==
        //     SalesOrderTableOrderType.takeaway) {
        //   totalTakeAway.value = totalTakeAway.value + 1;
        // } else if (orders[indexOrderCreate].selectedOrderType ==
        //     SalesOrderTableOrderType.delivery) {
        //   totalDelivery.value = totalDelivery.value + 1;
        // } else if (orders[indexOrderCreate].selectedOrderType ==
        //     SalesOrderTableOrderType.online) {
        //   totalOnline.value = totalOnline.value + 1;
        // }
print("____s3");
        // orders[orderIndexBeforeApiCall]
        //     .takeAwayCustomerNameTextedittingController!
        //     .clear();
print("____s4");
        orders[indexOrderCreate].isOrderCreateProgressBarVisibile = false;
        isWaiterScreenUnderWorkingForDisableButtons.value = false;
        orders.refresh();
print("____s5");
        orders.removeAt(indexOrderCreate);
        if (orders.isEmpty) {
          print("____order length old   ${orders.length}");
          addNewOrder();
        }
print("____s6");
        currentOrderIndex.value = 0;
        orders.assignAll([...orders]);
print("____s7");
        aykaOkToast("Order successfully created");
print("____s8");
        if (!Responsive.isDesktop(context)) {
          Get.back();
        }
      });
    }
  }

  @override
  void dispose() {
    _searchTextDebounce?.cancel();

    super.dispose();
  }

  onSearchTextChanged(String text) async {
    int currentIndex = currentOrderIndex.value;

    if (_searchTextDebounce?.isActive ?? false) _searchTextDebounce?.cancel();
    _searchTextDebounce = Timer(const Duration(milliseconds: 500), () async {
      orders[currentIndex].isShowPageLinearProgressBar = true;
      orders.assignAll([...orders]);

      final Either<String, ApiResponseCustomerGet> resultOrException =
          await screenMyWorkNewWork.getCustomerData(text);
      orders[currentIndex].isShowPageLinearProgressBar = false;
      resultOrException.fold((left) {
        aykaOkToast(left);
      }, (datareturn) {
        if (datareturn.data!.customerDetails!.isNotEmpty) {
          if (datareturn.data!.customerDetails![0].addressList!.length != 0) {
            isCustomerAddressEnabled.value = false;
            orders[currentIndex]
                    .takeAwayCustomerAddressTextedittingController!
                    .text =
                datareturn.data!.customerDetails![0].addressList![0].address!;
            // orders[currentIndex]
            //     .takeAwayCustomerAddressTextedittingController!
            //     .text = "";
            orders[currentIndex].customerAddress =
                RxList(datareturn.data!.customerDetails![0].addressList!);
          } else {
            isCustomerAddressEnabled.value = true;
            orders[currentIndex]
                .takeAwayCustomerAddressTextedittingController!
                .text = "";
            orders[currentIndex].customerAddress = RxList();
          }
          orders[currentIndex]
              .takeAwayCustomerNameTextedittingController!
              .text = datareturn.data!.customerDetails![0].name!;
          // orders[currentIndex]
          //     .takeAwayCustomerMobileTextedittingController!
          //     .text = datareturn.data!.customerDetails![0].mobile!;
        } else {
          isCustomerAddressEnabled.value = true;
          // orders[currentIndex]
          //     .takeAwayCustomerAddressTextedittingController!
          //     .text = "";
          // orders[currentIndex]
          //     .takeAwayCustomerNameTextedittingController!
          //     .text = "";
        }
      });

      orders.assignAll([...orders]);
    });
  }

  Future<List<CustomerDetail>> autocompleteTextviewCustomerName(
    String textSearched,
  ) async {
    // autoCompleteTextCategoryId.value = "";

    if (textSearched == "") {
      return [];
    }
    isShowNameSearchProgressbar.value = true;

    final Either<String, List<CustomerDetail>> resultFilter =
        await screenMyWorkNewWork.getCustomerDataName(textSearched);

// final Either<String, ApiResponseCustomerGet> resultOrException =
//           await screenMyWorkNewWork.getCustomerData(text);

    List<CustomerDetail> returnList = <CustomerDetail>[];

    isShowNameSearchProgressbar.value = false;

    resultFilter.fold((left) {
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 3),
          message: left,
          isDismissible: true,
        ),
      );
    }, (data) {
      returnList = data;
      // data.forEach((element) {
      //   supplierItems.add(PurchaseSupplierAutoComplete(
      //       creditLimit: element.creditLimit,
      //       name: element.name,
      //       id: element.id,
      //       returnValue: element.returnValue,
      //       mobile: element.mobile,
      //       address: element.address));
      // });
      return data;
    });

    return returnList;
  }

  Future<List<CustomerDetail>> onSearchTextChangedCustomerName(
      String text) async {
    print("_________ddd $text");

    if (text == "") {
      return [];
    }

    Completer<List<CustomerDetail>> completer =
        Completer<List<CustomerDetail>>();

    if (_searchTextDebounce?.isActive ?? false) _searchTextDebounce?.cancel();

    _searchTextDebounce = Timer(const Duration(milliseconds: 600), () async {
      List<CustomerDetail> returnList = await autocompleteTextviewCustomerName(
        text,
      );

      completer.complete(returnList);
    });

    return completer.future;

    /*
    int currentIndex = currentOrderIndex.value;
        Completer<List<CustomerDetail>> completer =
        Completer<List<CustomerDetail>>();

    if (_searchTextDebounce?.isActive ?? false) _searchTextDebounce?.cancel();
    _searchTextDebounce = Timer(const Duration(milliseconds: 500), () async {
      orders[currentIndex].isShowPageLinearProgressBar = true;
      orders.assignAll([...orders]);

      final Either<String, ApiResponseCustomerGet> resultOrException =
          await screenMyWorkNewWork.getCustomerData(text);
      orders[currentIndex].isShowPageLinearProgressBar = false;
      resultOrException.fold((left) {
        aykaOkToast(left);
      return <CustomerDetail>[];
      }, (datareturn) {

return datareturn.data!.customerDetails! as ;

      //   if (datareturn.data!.customerDetails!.isNotEmpty) {
      //     if (datareturn.data!.customerDetails![0].addressList!.length != 0) {
      //       isCustomerAddressEnabled.value = false;
      //       orders[currentIndex]
      //               .takeAwayCustomerAddressTextedittingController!
      //               .text =
      //           datareturn.data!.customerDetails![0].addressList![0].address!;
      //       // orders[currentIndex]
      //       //     .takeAwayCustomerAddressTextedittingController!
      //       //     .text = "";
      //       orders[currentIndex].customerAddress =
      //           RxList(datareturn.data!.customerDetails![0].addressList!);
      //     } else {
      //       isCustomerAddressEnabled.value = true;
      //       orders[currentIndex]
      //           .takeAwayCustomerAddressTextedittingController!
      //           .text = "";
      //       orders[currentIndex].customerAddress = RxList();
      //     }
      //     orders[currentIndex]
      //         .takeAwayCustomerNameTextedittingController!
      //         .text = datareturn.data!.customerDetails![0].name!;
      //     orders[currentIndex]
      //         .takeAwayCustomerMobileTextedittingController!
      //         .text = datareturn.data!.customerDetails![0].mobile!;
      //   } else {
      //     isCustomerAddressEnabled.value = true;
      //     // orders[currentIndex]
      //     //     .takeAwayCustomerAddressTextedittingController!
      //     //     .text = "";
      //     // orders[currentIndex]
      //     //     .takeAwayCustomerNameTextedittingController!
      //     //     .text = "";
      //   }
      });

      orders.assignAll([...orders]);
      
    });*/
  }

  Future<void> editOrder(int indexOrderCreate, BuildContext context) async {
    /*
    if (validationCheckBeforeOrderCreateOrEdit()) {
      orders[indexOrderCreate].isOrderCreateProgressBarVisibile = true;

      orders.assignAll([...orders]);

      List<edit.SalesOrderDetail> listItems = <edit.SalesOrderDetail>[];

      for (var elementCartItem in orders[indexOrderCreate].listCart!) {
        List<BundleAlternatives> listAlternativesOfBundle =
            <BundleAlternatives>[];

        elementCartItem.listBundles!.forEach((elementAlternative) {
          listAlternativesOfBundle.add(BundleAlternatives.create(
              id: elementAlternative.bundleId,
              productId: elementAlternative.productId,
              unitId: elementAlternative.variantId,
              unitQty: elementAlternative.qty));
        });

        listItems.add(edit.SalesOrderDetail.create(
            orderListId: int.parse(elementCartItem.orderListIdApi!),
            productId: int.parse(elementCartItem.productId!),
            productName: elementCartItem.productName,
            unitId: int.parse(elementCartItem.unitId!),
            barcode: elementCartItem.rateBarcode,
            qty: elementCartItem.quantity,
            rate: elementCartItem.rate!,
            bundleAlternatives: listAlternativesOfBundle,
            total: productItemTotal(
                quantity: elementCartItem.quantity!,
                rate: elementCartItem.rate!),
            discountAmount: productItemDiscount(),
            taxAmount: productItemTax(),
            netAmount: productItemNetAmount(
                quantity: elementCartItem.quantity!,
                rate: elementCartItem.rate!),
            properties: [],
            kitchenId: 0,
            kotNotes: "",
            kotStatus: 1));
      }
      List<Paymnentdetail> paymentDetails = <Paymnentdetail>[];
      for (var elementPaymentItem
          in orders[indexOrderCreate].listPaymentMethords!) {
        paymentDetails.add(Paymnentdetail.create(
            typeId: elementPaymentItem.type,
            amount: elementPaymentItem.cash!,
            description: elementPaymentItem.description));
      }
      var payload = ApiRequestEditOrder.create(
          invoiceDate: -1,
          paymentStatus: orders[indexOrderCreate].paymentStatus,
          onlineReferenceNumber: orders[indexOrderCreate]
              .onlineReferenceNumbersTextedittingController!
              .text,
          orderId: orders[indexOrderCreate].orderId!.toString(),
          customerId: (orders[indexOrderCreate]
                      .deliveryProviderDropDownItemsValue ==
                  "")
              ? 1
              : int.parse(
                  orders[indexOrderCreate].deliveryProviderDropDownItemsValue!),
          customerName: orders[indexOrderCreate]
              .takeAwayCustomerNameTextedittingController!
              .text,
          customerAddress: orders[indexOrderCreate]
              .takeAwayCustomerAddressTextedittingController!
              .text,
          customerPhone: orders[indexOrderCreate]
              .takeAwayCustomerMobileTextedittingController!
              .text,
          deliveryStaffId:
              orders[indexOrderCreate].deliveryStaffDropDownItemsValue,
          grossAmount: orderGrossAmount(orderIndex: indexOrderCreate),
          discountAmount: orderDiscount(orderIndex: indexOrderCreate),
          taxAmount: orderTax(orderIndex: indexOrderCreate),
          netAmount: orderNetAmount(orderIndex: indexOrderCreate),
          paymnentdetails: paymentDetails,
          balanceAmount: orderBalance(orderIndex: indexOrderCreate),
          orderStatus: orders[indexOrderCreate].orderStatus,
          saleType: orders[indexOrderCreate].selectedOrderType,
          chairsId: orders[indexOrderCreate].chairIds!,
          salesOrderDetails: listItems);

      final Either<String, String> resultOrException =
          await screenMyWorkNewWork.editCreate(payload: payload);
      orders[indexOrderCreate].isOrderCreateProgressBarVisibile = true;

      orders.assignAll([...orders]);

      resultOrException.fold((left) {
        aykaOkToast(left);
      }, (datareturn) {
        orders.removeAt(indexOrderCreate);
        if (orders.isEmpty) {
          addNewOrder();
        }
        currentOrderIndex.value = 0;
        orders.assignAll([...orders]);

        aykaOkToast("Success");
        if (!Responsive.isDesktop(context)) {
          Get.back();
        }
      });
    }
 */
  }

  orderDiscountAmount() {
    if (currentOrderIndex.value == -1) {
      return 0.0;
    } else {
      return orders[currentOrderIndex.value].discountAmt!;
    }
  }

  orderDeliveryCharge() {
    if (currentOrderIndex.value == -1) {
      return 0.0;
    } else {
      return orders[currentOrderIndex.value].deliveryChargesAmt!;
    }
  }

  double orderNetAmount({required int orderIndex}) {
    if (orderIndex == -1) {
      return 0.0;
    }
    List<ProductCartModel> mainList = orders[orderIndex].listCart!;
    var discountAmount = 0.0;
    var offerAmount = 0.0;
    var deliveryCharge = 0.0;
    if (orders[orderIndex].discountAmt! != 0) {
      discountAmount = orders[orderIndex].discountAmt!;
    }
    if (orders[orderIndex].deliveryChargesAmt! != 0) {
      deliveryCharge = orders[orderIndex].deliveryChargesAmt!;
    }
    if (orders[orderIndex].offerAmt! != 0) {
      offerAmount = orders[orderIndex].offerAmt!;
    }

    var totalGrossAmount = AccountsAmountCalculationUtils().grtBillNetTotal(
        grossAmount: orderGrosstotal(),
        isSplitBillItems: orders[orderIndex].isDiscountOfferSplittedToItems!,
        discountAmount: discountAmount,
        offerAmount: offerAmount,
        deliveryChargeOrFright: deliveryCharge);

    return totalGrossAmount;
  }

  orderGrossAmount({required int orderIndex}) {
    // var totalGrossAmount = 0.0;
    // for (var element in orders[orderIndex].listCart!) {
    //   totalGrossAmount =
    //       totalGrossAmount + (element.netTotal!); //todo waiter nettotal
    // }

    // return totalGrossAmount;
    if (orderIndex == -1) {
      return 0.0;
    }
    List<ProductCartModel> mainList = orders[orderIndex].listCart!;

    var discountAmount = 0.0;
    var offerAmount = 0.0;
    var deliveryCharge = 0.0;
    if (orders[orderIndex].discountAmt! != 0) {
      discountAmount = orders[orderIndex].discountAmt!;
    }
    if (orders[orderIndex].deliveryChargesAmt! != 0) {
      deliveryCharge = orders[orderIndex].deliveryChargesAmt!;
    }

    if (orders[orderIndex].offerAmt! != 0) {
      offerAmount = orders[orderIndex].offerAmt!;
    }

    var totalGrossAmount = AccountsAmountCalculationUtils().grtBillNetTotal(
        grossAmount: orderGrosstotal(),
        isSplitBillItems: orders[orderIndex].isDiscountOfferSplittedToItems!,
        discountAmount: discountAmount,
        offerAmount: offerAmount,
        deliveryChargeOrFright: deliveryCharge);

    return totalGrossAmount;
  }

  double orderGrosstotal() {
    var totalGrossAmount = 0.0;

    for (var element in getMainListSelectedItemsList()) {
      if (element.netTotal! != -1) {
        totalGrossAmount = totalGrossAmount + (element.netTotal!);
      }
    }

    return totalGrossAmount;
  }

  orderTax({required int orderIndex}) {
    var totalTaxAmount = 0.0;
    for (var element in getMainListSelectedItemsList()) {
      if (element.taxAmt! != -1) {
        totalTaxAmount = totalTaxAmount + (element.taxAmt!);
      }
    }
    return totalTaxAmount;
  }

  String getSelectedTablesNames({required int orderIndex}) {
    var tableNamesTemp = [];
    for (var element in tableChair) {
      if (element.chairs!
          .map((e) => e.chairId)
          .toSet()
          .intersection(orders[orderIndex]
              .chairIds!
              .map((elementChairs) => elementChairs)
              .toSet())
          .isNotEmpty) {
        tableNamesTemp.add(element.name!);
      }
    }
    return tableNamesTemp.join(", ");
  }

  void initApi() {
    isMainApiLoading(true);
    mainApiList.clear();

    getMainApiList();
  }

  addQuantity(int cartIndex) {
    orders[currentOrderIndex.value].isOrderUpdated = true;

    orders[currentOrderIndex.value].listCart![cartIndex].quantity =
        orders[currentOrderIndex.value].listCart![cartIndex].quantity! + 1;

    orders[currentOrderIndex.value]
            .listCart![cartIndex]
            .netTotal = //todo waiter calculate all values here with new equation
        orders[currentOrderIndex.value].listCart![cartIndex].quantity! *
            orders[currentOrderIndex.value].listCart![cartIndex].rate!;
    doCalculationForSelectedOrderFullItems();
    // orders.assignAll([...orders]);
  }

  descreaseQuantity(int cartIndex) {
    orders[currentOrderIndex.value].isOrderUpdated = true;

    orders[currentOrderIndex.value].listCart![cartIndex].quantity =
        orders[currentOrderIndex.value].listCart![cartIndex].quantity! - 1;
    if (orders[currentOrderIndex.value].listCart![cartIndex].quantity == 0) {
      orders[currentOrderIndex.value].listCart!.removeAt(cartIndex);
    } else {
      orders[currentOrderIndex.value]
              .listCart![cartIndex]
              .netTotal = //todo waiter calculate all values here with new equation
          orders[currentOrderIndex.value].listCart![cartIndex].quantity! *
              orders[currentOrderIndex.value].listCart![cartIndex].rate!;
    }
    doCalculationForSelectedOrderFullItems();
    // orders.assignAll([...orders]);
  }

  addNewOrder() {
    // if(salesTypes.isEmpty){
    //   aykaOkToast("sale_type_not_found".tr);
    //   return;
    // }

    print("____orders length   ${orders.length}  ");
    print("____orders length10   ${orders.length}  ");

    if (orders.isNotEmpty &&
        orders[currentOrderIndex.value].listCart!.isEmpty) {
      aykaOkToast("cart_is_empty".tr);
      return;
    }
    if (orders.indexWhere((element) => element.listCart!.length == 0) != -1) {
      int emptyOrderIndex =
          orders.indexWhere((element) => element.listCart!.length == 0);
      currentOrderIndex.value = emptyOrderIndex;
      return;
    }

    isButtonOnKotOn.value = true;

    print("____orders length1   ${orders.length}  ");
    var globalController = Get.put(MainGlobalController());
    orders.add(OrdersModel.create(
        orderId: (-1).toString(),
        token: (-1).toString(),
        kotNo: "",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        listCart: RxList(),
        listPaymentMethords: RxList(),
        isOrderUpdated: true,
        selectedCategoryId:
            (mainApiList.isEmpty) ? 0 : mainApiList[0].categoryId,
        chairIds: RxList(),
        deliveryProviderDropDownItemsValue: "",
        orderNumber: "",
        editCount: 1,
        paymentStatus: SalesOrderTablePaymentStatusValue.pending,
        selectedOrderType: (salesTypes.isEmpty) ? -1 : salesTypes[0].id,
        deliveryStaffDropDownItemsValue: "",
        isOrderCreateProgressBarVisibile: false,
        orderStatus: SalesOrderTableOrderStatusValue.orderPlaced,
        isShowPageLinearProgressBar: false,
        onlineReferenceNumbersTextedittingController: TextEditingController(),
        takeAwayCustomerAddressTextedittingController: TextEditingController(),
        takeAwayCustomerMobileTextedittingController: TextEditingController(),
        takeAwayCustomerNameTextedittingController: TextEditingController(),
        createdStaffName: globalController.userName.value,
        createdStaffId: globalController.userId.value,
        cashAmount: 0,
        creditAmount: 0,
        creditLimit: 0,
        customerAddress: RxList(),
        descriptionTextedittingController: TextEditingController(),
        deliveryChargesAmt: 0,
        discountAmt: 0,
        discountPercentage: 0,
        gossAmt: 0,
        isDiscountOfferSplittedToItems: false,
        netAmt: 0,
        offerAmt: 0,
        offerPercentage: 0,
        rewardAmount: 0,
        rewardPoint: 0,
        roundOff: 0,
        taxAmt: 0,
        walletPoints: 0,
        intTakeAwayCustomerNameTextedittingController:
            indexForAutoCompleteTextViewKey,
        isChairUpdated: false));
    indexForAutoCompleteTextViewKey++;

    print("____orders length2   ${orders.length}  ");
    if (globalController.waiterMultipleOrderHold == false) {
      if (orders.length > 1) {
        for (int h = 0; h < (orders.length - 1); h++) {
          orders.removeAt(h);
        }
      }
    }

    currentOrderIndex.value = orders.length - 1;
  }

  addExistingOrder({
    required String orderId,
    required String token,
    required String kotNo,
    required String orderNumber,
    required int createdAt,
    required int editCount,
    required int orderStatus,
    required int paymentStatus,
    required RxList<ProductCartModel> listCart,
    required RxList<PaymentMethordModel> listPaymentMethords,
    required RxList<String> listChairIds,
    required RxList<AddressList> customerAddressArray,
    required int orderType,
    required String onlineRefNumber,
    required String customerAddress,
    required String customerMobile,
    required String customerName,
    required String deliveryStaffId,
    required String deliveryProviderId,
    required double cashAmount,
    required double creditAmount,
    required double creditLimit,
    required double deliveryChargesAmt,
    required String createdStaffName,
    required int createdStaffId,
    required double discountAmt,
    required double discountPercentage,
    required double gossAmt,
    required bool isDiscountOfferSplittedToItems,
    required double netAmt,
    required double offerAmt,
    required double offerPercentage,
    required double rewardAmount,
    required double rewardPoint,
    required double roundOff,
    required double taxAmt,
    required double walletPoints,
    required String description,
  }) {
    // if (orders.indexWhere((elementOrder) => elementOrder.orderId == orderId) !=
    //     -1) {
    //   currentOrderIndex.value =
    //       orders.indexWhere((elementOrder) => elementOrder.orderId == orderId);
    //   aykaOkToast("Already existing");
    //   return;
    // }
    // print("_________token   $token");

    isButtonOnKotOn.value = true;

    orders.add(OrdersModel.create(
        orderId: orderId,
        token: token,
        createdAt: createdAt,
        kotNo: kotNo,
        editCount: editCount,
        isOrderUpdated: false,
        createdStaffName: createdStaffName,
        listCart: listCart,
        listPaymentMethords: listPaymentMethords,
        selectedCategoryId:
            (mainApiList.isEmpty) ? 0 : mainApiList[0].categoryId,
        chairIds: listChairIds,
        selectedOrderType: orderType,
        isOrderCreateProgressBarVisibile: false,
        orderNumber: orderNumber,
        orderStatus: orderStatus,
        paymentStatus: paymentStatus,
        createdStaffId: createdStaffId,
        deliveryProviderDropDownItemsValue: deliveryProviderId,
        deliveryStaffDropDownItemsValue: deliveryStaffId,
        isShowPageLinearProgressBar: false,
        customerAddress: customerAddressArray,
        onlineReferenceNumbersTextedittingController:
            TextEditingController(text: onlineRefNumber),
        takeAwayCustomerAddressTextedittingController:
            TextEditingController(text: customerAddress),
        takeAwayCustomerMobileTextedittingController:
            TextEditingController(text: customerMobile),
        takeAwayCustomerNameTextedittingController:
            TextEditingController(text: customerName),
        intTakeAwayCustomerNameTextedittingController:
            indexForAutoCompleteTextViewKey,
        cashAmount: cashAmount,
        creditAmount: creditAmount,
        creditLimit: creditLimit,
        deliveryChargesAmt: deliveryChargesAmt,
        discountAmt: discountAmt,
        discountPercentage: discountPercentage,
        gossAmt: gossAmt,
        isDiscountOfferSplittedToItems: isDiscountOfferSplittedToItems,
        netAmt: netAmt,
        offerAmt: offerAmt,
        descriptionTextedittingController:
            TextEditingController(text: description),
        offerPercentage: offerPercentage,
        rewardAmount: rewardAmount,
        rewardPoint: rewardPoint,
        roundOff: roundOff,
        taxAmt: taxAmt,
        walletPoints: walletPoints,
        isChairUpdated: false));
    indexForAutoCompleteTextViewKey++;

    var stateGlobalController = Get.put(MainGlobalController());
    if (stateGlobalController.waiterMultipleOrderHold == false) {
      if (orders.length > 1) {
        for (int h = 0; h < (orders.length - 1); h++) {
          orders.removeAt(h);
        }
      }
    }

    currentOrderIndex.value = orders.length - 1;
    print("_____ currentOrderIndex   $currentOrderIndex");

    // int currentIndex = currentOrderIndex.value;

    // print(
    //     "___   takeaway name     ${orders[currentIndex].takeAwayCustomerNameTextedittingController!.text}");
    // orders[currentIndex].takeAwayCustomerNameTextedittingController!.text =
    //     "AAA";
    // print(
    //     "___   takeaway name --     ${orders[currentIndex].takeAwayCustomerNameTextedittingController!.text}");
    // orders.assignAll([...orders]);
  }

  @override
  void onInit() {
    orders.clear;
    initialize();
    addNewOrder();

    initApi();
    super.onInit();
  }

  void initialize() {}

  List<SpinnerIntString> arrayReturnForOrderStatus() {
    List<SpinnerIntString> arrayItem = [];

    arrayItem.add(SpinnerIntString(
        id: SalesOrderTableOrderStatusValue.holding,
        value: SalesOrderGet()
            .orderStatus(SalesOrderTableOrderStatusValue.holding)!));
    arrayItem.add(SpinnerIntString(
        id: SalesOrderTableOrderStatusValue.orderPlaced,
        value: SalesOrderGet()
            .orderStatus(SalesOrderTableOrderStatusValue.orderPlaced)!));

    if (getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
            elementSelections == SalesTypeTableValue.deliveryBoy) !=
        -1) {
      arrayItem.add(SpinnerIntString(
          id: SalesOrderTableOrderStatusValue.deliveryBoyAssigned,
          value: SalesOrderGet().orderStatus(
              SalesOrderTableOrderStatusValue.deliveryBoyAssigned)!));

      arrayItem.add(SpinnerIntString(
          id: SalesOrderTableOrderStatusValue.deliveryBoyPicked,
          value: SalesOrderGet().orderStatus(
              SalesOrderTableOrderStatusValue.deliveryBoyPicked)!));
    }
    if (getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
            elementSelections == SalesTypeTableValue.deliveryBoy) !=
        -1) {
      arrayItem.add(SpinnerIntString(
          id: SalesOrderTableOrderStatusValue.delivered,
          value: SalesOrderGet()
              .orderStatus(SalesOrderTableOrderStatusValue.delivered)!));
    }

    // arrayItem.add(SpinnerIntString(
    //     id: SalesOrderTableOrderStatusValue.orderCompleted,
    //     value: SalesOrderGet()
    //         .orderStatus(SalesOrderTableOrderStatusValue.orderCompleted)!));

    arrayItem.add(SpinnerIntString(
        id: SalesOrderTableOrderStatusValue.kitchenPreparing,
        value: SalesOrderGet()
            .orderStatus(SalesOrderTableOrderStatusValue.kitchenPreparing)!));
    arrayItem.add(SpinnerIntString(
        id: SalesOrderTableOrderStatusValue.kitchenCompleted,
        value: SalesOrderGet()
            .orderStatus(SalesOrderTableOrderStatusValue.kitchenCompleted)!));
    arrayItem.add(SpinnerIntString(
        id: SalesOrderTableOrderStatusValue.kitchenPacked,
        value: SalesOrderGet()
            .orderStatus(SalesOrderTableOrderStatusValue.kitchenPacked)!));
    arrayItem.add(SpinnerIntString(
        id: SalesOrderTableOrderStatusValue.kitchenServed,
        value: SalesOrderGet()
            .orderStatus(SalesOrderTableOrderStatusValue.kitchenServed)!));

    // arrayItem.add(SpinnerIntString(
    //     id: SalesOrderTableOrderStatusValue.orderCancelled,
    //     value: SalesOrderGet()
    //         .orderStatus(SalesOrderTableOrderStatusValue.orderCancelled)!));

    // arrayItem.add(SpinnerIntString(
    //     id: SalesOrderTableOrderStatusValue.orderRejected,
    //     value: SalesOrderGet()
    //         .orderStatus(SalesOrderTableOrderStatusValue.orderRejected)!));
    print(
        "_____ arrayItem  ${orders[currentOrderIndex.value].selectedOrderType}  count is    " +
            arrayItem.length.toString());
// orderTypeFilter
    return arrayItem;
  }

  List<ProductCartModel> getMainListSelectedItemsList() {
    return orders[currentOrderIndex.value].listCart!;
  }

  doCalculationForSelectedOrderFullItems() {
    var globalController = Get.put(MainGlobalController());
    for (var element in getMainListSelectedItemsList()) {
      AccountsAmountCalculationBillItemRatetotalTaxNetModel returnData =
          AccountsAmountCalculationUtils().getBillItem_saleTotal_taxAmt_netAmt(
        isEnableTaxCalculation: globalController.isEnableTaxCalculation.value,
        isInclusive: element.isTaxInclusive!,
        isEnableBillSplit:
            orders[currentOrderIndex.value].isDiscountOfferSplittedToItems!,
        rate: element.rate!,
        qty: element.quantity!,
        discAmountItem: element.discountAmountItem!,
        discAmountBillWise: element.discountAmountBillwise!,
        offerAmountItem: element.offerAmountItem!,
        offerAmountBillWise: element.offerAmountBillwise!,
        taxPercentage: element.taxPercentage!,
        totalTaxPercentage: element.taxPercentage!,
      );

      element.netTotal = returnData.netTotal;
      element.taxAmt = returnData.taxAmt;
      element.saleTotal = returnData.saleTotal;
    }

    orders.refresh();
  }

  List<int> getCurrentOrderSalesSelections() {
    List<int> returnList = [];
    int indexSalesType = salesTypes.indexWhere((elementSaleType) =>
        elementSaleType.id ==
        orders[currentOrderIndex.value].selectedOrderType);
    if (indexSalesType != -1) {
      returnList.addAll(salesTypes[indexSalesType].selections!);
    }

    return returnList;
  }

  String getCurrentOrderSalesName() {
    String retrnString = "";
    int indexSalesType = salesTypes.indexWhere((elementSaleType) =>
        elementSaleType.id ==
        orders[currentOrderIndex.value].selectedOrderType);
    if (indexSalesType != -1) {
      retrnString = salesTypes[indexSalesType].name!;
    }

    return retrnString;
  }

  refreshRateDependOnSaleType() {
    mainApiList.forEach((elementCategory) {
      elementCategory.products!.forEach((elementProducts) {
        elementProducts.productRates!.forEach((elementRates) {
          int indexRates = elementRates.salesTypeRates!.indexWhere(
              (elementRateIndex) =>
                  elementRateIndex.salesTypeId ==
                  orders[currentOrderIndex.value].selectedOrderType);

          if (indexRates != -1) {
            elementRates.rate = elementRates.salesTypeRates![indexRates].rate!;
          } else {
            elementRates.rate = -1;
          }
        });
      });
    });

    orders[currentOrderIndex.value].listCart!.forEach((elementCart) {
      print("____y1");
      int productIndex = mainApiList[0].products!.indexWhere(
          (elementProducts) =>
              elementProducts.productId == int.parse(elementCart.productId!));
      print("____y1 productIndex $productIndex");
      if (productIndex != -1) {
        int productVariantId = mainApiList[0]
            .products![productIndex]
            .productRates!
            .indexWhere((elementRate) =>
                elementRate.unitId == int.parse(elementCart.unitId!));
        print("____y1 productVariantId $productVariantId");
        if (productVariantId != -1) {
          elementCart.rate = mainApiList[0]
              .products![productIndex]
              .productRates![productVariantId]
              .rate!;
          print(
              "____y1 rate ${mainApiList[0].products![productIndex].productRates![productVariantId].rate!}");
        }
      }
    });

    doCalculationForSelectedOrderFullItems();

    orders.refresh();
    mainApiList.refresh();
  }

  Future<bool?> refreshTables() async {
    istableDialogRefreshProgressbar.value = true;
    final Either<String, ApiResponseGetTables> resultOrException =
        await screenMyWorkNewWork.getTables();
    istableDialogRefreshProgressbar(false);
    resultOrException.fold((left) {
      aykaOkToast(left);
      Future.value(false);
    }, (result) {
      tableChair.clear();
      result.data!.tableDetails!.forEach((elementTables) {
        var chairsTemp = <ChairModel>[];
        elementTables.chairs!.forEach((elementChair) {
          chairsTemp.add(ChairModel(
              chairId: elementChair.chairId!.toString(),
              name: elementChair.chairName!.toString(),
              isFree: elementChair.isFree!));
        });

        tableChair.add(TableModel(
            seatCount: chairsTemp.length,
            tableId: elementTables.tableId!.toString(),
            name: elementTables.tableName!,
            chairs: chairsTemp));
      });

      // tableChair[0].chairs![0].isFree = true;

      tableChair.refresh();

      Future.value(true);
    });
    Future.value(false);
  }
}
