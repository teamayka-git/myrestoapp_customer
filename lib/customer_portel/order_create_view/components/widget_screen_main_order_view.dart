// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:developer';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:myresto_customer/api_utils/ayka_ok_toast.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_order_table_order_type_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_order_table_payment_status_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_type_table_value.dart';
import 'package:myresto_customer/api_utils/tables_value_get/sales_order_table_get.dart';
import 'package:myresto_customer/components/ayka_snackbar.dart';
import 'package:myresto_customer/components/neomorphic_first_widget.dart';
import 'package:myresto_customer/components/neomorphic_second_widget.dart';
import 'package:myresto_customer/constants/custom_colour.dart';
import 'package:myresto_customer/constants/get_storage_box.dart';
import 'package:myresto_customer/constants/get_storage_events.dart';
import 'package:myresto_customer/constants/local_settings_hive.dart';
import 'package:myresto_customer/constants/nextdines_constants.dart';
import 'package:myresto_customer/customer_portel/order_create_view/components/ayka_group_avatars.dart';
import 'package:myresto_customer/customer_portel/order_create_view/components/widget_screen_main_order_right_drawer.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_table_free/api_request_table_free.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/product.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/address_list.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/customer_detail.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/product_bundle_cart.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/product_cart_model/product_cart_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/product_cart_tax_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/table_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_controller.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_create_repository.dart';
import 'package:myresto_customer/main_global_controller.dart';
import 'package:myresto_customer/models/print_kot_items.dart';
import 'package:myresto_customer/models/spinner_string_string.dart';
import 'package:myresto_customer/my_widgets/AykaCachedNetworkImage/ayka_cached_network_image.dart';
import 'package:myresto_customer/repository/box_repository.dart';
import 'package:myresto_customer/screen_utils/responsive.dart';
import 'package:intl/intl.dart';

import 'package:myresto_customer/utils/amount_utils.dart';
import 'package:myresto_customer/utils/time_utils.dart';

import 'package:dartz/dartz.dart' as dartz;
import 'package:myresto_customer/utils/virtual_keyboard.dart';

class WidgetScreenMainOrderView extends StatefulWidget {
  const WidgetScreenMainOrderView(
      this.statePageMaincontroller, this.stateMainGlobalcontroller,
      {super.key});
  final ScreenMainOrderController statePageMaincontroller;
  final MainGlobalController stateMainGlobalcontroller;

  @override
  State<WidgetScreenMainOrderView> createState() =>
      _WidgetScreenMainOrderViewState();
}

class _WidgetScreenMainOrderViewState extends State<WidgetScreenMainOrderView> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: CustomColors().mainOrderTakingColor,
            child: Column(
              children: [
                headerWidget(context),
                // if (Responsive.isMobile(context))
                //   Obx(() => footerRightWidget()),
                // if (Responsive.isMobile(context)) footerLeftWidget(),
                mainContent(widget.statePageMaincontroller),
                // if (!Responsive.isMobile(context)) footerWidget()
              ],
            ),
          ),
          Obx(
            () => Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!Responsive.isDesktop(context)
                        // &&
                        //     widget
                        //         .statePageMaincontroller
                        //         .orders[widget.statePageMaincontroller
                        //             .currentOrderIndex.value]
                        //         .listCart!
                        //         .isNotEmpty
                        ) ...{
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Dialog(
                                  child: WidgetScreenMainOrderRightDrawer(),
                                );
                              });

                          // showGlobalDrawer(
                          //     context: context,
                          //     builder: (BuildContext context) => Material(
                          //           color: Colors.transparent,
                          //           child: SizedBox(
                          //             width: 340,
                          //             child: Row(
                          //               children: [
                          //                 Align(
                          //                   alignment: Alignment.topCenter,
                          //                   child: Padding(
                          //                     padding: const EdgeInsets.only(
                          //                         top: 10),
                          //                     child: ClipRRect(
                          //                       borderRadius:
                          //                           const BorderRadius.only(
                          //                         topLeft: Radius.circular(45),
                          //                         bottomLeft:
                          //                             Radius.circular(45),
                          //                       ),
                          //                       child: Container(
                          //                           color: Colors.green,
                          //                           width: 40,
                          //                           height: 30,
                          //                           child: const Icon(
                          //                             Icons.close,
                          //                             color: Colors.white,
                          //                           )),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 ClipRRect(
                          //                   borderRadius:
                          //                       const BorderRadius.only(
                          //                           topLeft:
                          //                               Radius.circular(10),
                          //                           bottomLeft:
                          //                               Radius.circular(10)),
                          //                   child: Container(
                          //                       color: Colors.white,
                          //                       width: 300,
                          //                       child:
                          //                           WidgetScreenMainOrderRightDrawer()),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //     direction: AxisDirection.right);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                                  CustomColors().orderCreateBottomButtonNgColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .listCart!
                                    .length
                                    .toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    },
                    if (widget.stateMainGlobalcontroller.waiterMultipleOrderHold
                            .value ==
                        true)
                      InkWell(
                        onTap: () {
                          if ((widget
                                      .statePageMaincontroller
                                      .orders[widget.statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .isOrderCreateProgressBarVisibile ==
                                  true) ||
                              widget.statePageMaincontroller
                                      .isWaiterScreenUnderWorkingForDisableButtons ==
                                  true) {
                            aykaOkToast(
                                "order_under_processing_please_do_again".tr);
                            return;
                          }

                          showDialogToSwitchOrders(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: CustomColors()
                                  .mainNavigationRailIndicatiorColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.statePageMaincontroller.orders.length
                                .toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          linearProgressbarMainDeliveryComplete(),

          if (Responsive.isMobile(
                  context) && //todo check this take too much rendering time
              widget.statePageMaincontroller.mainApiList.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PopupMenuButton(
                    offset: const Offset(-110, 0),
                    onSelected: (value) {
                      widget.statePageMaincontroller.selectCategoryOnClickEvent(
                          int.parse(value.toString()));
                    },
                    itemBuilder: (context) => widget
                            .statePageMaincontroller.mainApiList
                            .map((mapCategory) {
                          return PopupMenuItem(
                            value: mapCategory.categoryId,
                            child: SizedBox(
                                child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      mapCategory.categoryName!,
                                      maxLines: 1,
                                    ))),
                          );
                        }).toList(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Text(widget.statePageMaincontroller
                          .getCurrentCategoryName()),
                    )),
              ),
            )

          // Obx(() => ),
          // if(Responsive.isMobile(context))
          //         GetBuilder<ScreenMainOrderController>(builder: (contexta) {

          //           if (
          //                   contexta.mainApiList.isNotEmpty)
          //               return  Align(
          //                   alignment: Alignment.bottomCenter,
          //                   child: Padding(
          //                     padding: const EdgeInsets.only(bottom: 20),
          //                     child: PopupMenuButton(
          //                         child: Container(
          //                           padding:
          //                               EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          //                           decoration: BoxDecoration(
          //                               color: Colors.grey[200],
          //                               borderRadius:
          //                                   BorderRadius.all(Radius.circular(20))),
          //                           child: Text(contexta
          //                               .getCurrentCategoryName()),
          //                         ),
          //                         offset: Offset(-110, 0),
          //                         onSelected: (value) {
          //                          contexta
          //                               .selectCategoryOnClickEvent(
          //                                   int.parse(value.toString()));
          //                         },
          //                         itemBuilder: (context) => widget
          //                                 .statePageMaincontroller.mainApiList
          //                                 .map((mapCategory) {
          //                               return PopupMenuItem(
          //                                 child: SizedBox(
          //                                     child: SizedBox(
          //                                         width: 200,
          //                                         child: Text(
          //                                           mapCategory.categoryName!,
          //                                           maxLines: 1,
          //                                         ))),
          //                                 value: mapCategory.categoryId,
          //                               );
          //                             }).toList()),
          //                   ),
          //                 );
          //               else return Text("BBB");
          //         }),
          // Obx(()=>
          // (Responsive.isMobile(context)
          // &&
          //                  widget.statePageMaincontroller.mainApiList.isNotEmpty
          //                   )?Text("AAA"):Text("BBB")
          //                   )

          // Obx(
          //   () => (Responsive.isMobile(context) &&
          //           widget.statePageMaincontroller.mainApiList.isNotEmpty)
          //       ? Align(
          //           alignment: Alignment.bottomCenter,
          //           child: Padding(
          //             padding: const EdgeInsets.only(bottom: 20),
          //             child: PopupMenuButton(
          //                 child: Container(
          //                   padding:
          //                       EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          //                   decoration: BoxDecoration(
          //                       color: Colors.grey[200],
          //                       borderRadius:
          //                           BorderRadius.all(Radius.circular(20))),
          //                   child: Text(widget.statePageMaincontroller
          //                       .getCurrentCategoryName()),
          //                 ),
          //                 offset: Offset(-110, 0),
          //                 onSelected: (value) {
          //                   widget.statePageMaincontroller
          //                       .selectCategoryOnClickEvent(
          //                           int.parse(value.toString()));
          //                 },
          //                 itemBuilder: (context) => widget
          //                         .statePageMaincontroller.mainApiList
          //                         .map((mapCategory) {
          //                       return PopupMenuItem(
          //                         child: SizedBox(
          //                             child: SizedBox(
          //                                 width: 200,
          //                                 child: Text(
          //                                   mapCategory.categoryName!,
          //                                   maxLines: 1,
          //                                 ))),
          //                         value: mapCategory.categoryId,
          //                       );
          //                     }).toList()),
          //           ),
          //         )
          //       : SizedBox(),
          // ),
        ],
      ),
    );
  }

  linearProgressbarMainDeliveryComplete() {
    return (widget
                .statePageMaincontroller
                .orders[widget.statePageMaincontroller.currentOrderIndex.value]
                .isShowPageLinearProgressBar ==
            true)
        ? const Align(
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(
              color: CustomColors.screenTopLinearProgressBar,
              backgroundColor: Colors.white,
            ),
          )
        : const SizedBox();
  }

  Widget mainContent(ScreenMainOrderController statePageMaincontroller) {
    return Expanded(
      child: Obx(() {
        if (statePageMaincontroller.isMainApiLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (statePageMaincontroller.mainApiErrorOccured.value == true) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: (kIsWeb)
                      ? Image.asset("assets/gif/api_error.gif")
                      : LottieBuilder.asset(
                          "assets/lottie_files/api/lottie_api_error.json"),
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Text(
                    statePageMaincontroller.mainApiErrorString.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      statePageMaincontroller.isMainApiLoading(true);
                      statePageMaincontroller.getMainApiList();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 20,
                    ),
                    label: const Text(
                      "TRY AGAIN",
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          );
        } else if (statePageMaincontroller.mainApiList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: (kIsWeb)
                      ? Image.asset("assets/gif/empty.gif")
                      : LottieBuilder.asset(
                          "assets/lottie_files/api/lottie_empty_list.json"),
                ),
                const Text(
                  "Empty List",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton.icon(
                    onPressed: () {
                      statePageMaincontroller.isMainApiLoading(true);
                      statePageMaincontroller.getMainApiList();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 20,
                    ),
                    label: const Text(
                      "TRY AGAIN",
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                if (!Responsive.isMobile(context)) categoryItems(),
                if (Responsive.isMobile(context))
                  const SizedBox(
                    height: 10,
                  ),
                productyItems(),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget productyItems() {
    return NeomorphicFirstWidget(
      childWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: widget.statePageMaincontroller
                            .getProductsSelectedCategoryName(),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                '   (${widget.statePageMaincontroller.getProductsSelectedCategory().length} Results)',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: Center(
                    child: Container(
                      constraints:
                          const BoxConstraints(minWidth: 100, maxWidth: 250),
                      child: TextField(
                        controller: widget.statePageMaincontroller
                            .productSearchTextController.value,
                        onChanged: (value) {
                          widget.statePageMaincontroller.mainApiList.refresh();
                        },
                        decoration: InputDecoration(
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                (widget
                                            .statePageMaincontroller
                                            .productSearchTextController
                                            .value
                                            .text ==
                                        "")
                                    ? SizedBox()
                                    : IconButton(
                                        onPressed: () {
                                          widget.statePageMaincontroller
                                              .productSearchTextController.value
                                              .clear();
                                          widget.statePageMaincontroller
                                              .mainApiList
                                              .refresh();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          size: 20,
                                          color: Colors.grey[500]!,
                                        ),
                                      ),
                                if (widget.stateMainGlobalcontroller
                                    .isShowOnScreenKeyboard.value)
                                  IconButton(
                                      onPressed: () {
                                        VirtualKeyboardUtils().showKeyBoard(
                                            widget.statePageMaincontroller
                                                .productSearchTextController,
                                            () {});
                                      },
                                      icon: Icon(Icons.keyboard))
                              ],
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            // contentPadding: EdgeInsets.all(10.0),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 20,
                            ),
                            hintText: "Search here",
                            hintMaxLines: 1),
                      ),
                    ),
                  )),
                  const SizedBox()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                return (widget.statePageMaincontroller
                        .getProductsSelectedCategory()
                        .isEmpty)
                    ? const SizedBox(
                        height: 200,
                        child: Center(
                          child: Text("No items found"),
                        ),
                      )
                    : GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.statePageMaincontroller
                            .getProductsSelectedCategory()
                            .length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                (Responsive.isMobile(context)) ? 250 : 170),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            showdialogProductDetails(
                                context,
                                widget.statePageMaincontroller
                                    .getProductsSelectedCategory()[index],
                                widget.statePageMaincontroller);

                            List<int> listSalesTypeSelections = [];
                            int indexSalesType = widget
                                .statePageMaincontroller.salesTypes
                                .indexWhere((elementSalesType) =>
                                    elementSalesType.id ==
                                    widget
                                        .statePageMaincontroller
                                        .orders[widget.statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .selectedOrderType);
                            if (indexSalesType != -1) {
                              listSalesTypeSelections.addAll(widget
                                  .statePageMaincontroller
                                  .salesTypes[indexSalesType]
                                  .selections!);
                            }

                            if (widget.statePageMaincontroller
                                        .getSelectedTablesNames(
                                            orderIndex: widget
                                                .statePageMaincontroller
                                                .currentOrderIndex
                                                .value) ==
                                    "" &&
                                (listSalesTypeSelections.indexWhere(
                                        (elementSaleTypeInt) =>
                                            elementSaleTypeInt ==
                                            SalesTypeTableValue
                                                .tableSelection) !=
                                    -1)) {
                              await showDialogTableSelect();
                            }
                          },
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: NeomorphicSecondWidget(
                                  shadowColor: Colors.grey[200]!,
                                  childWidget: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40)),
                                          color: Colors.white),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (widget.statePageMaincontroller
                                                      .getProductsSelectedCategory()[
                                                          index]
                                                      .productImage! !=
                                                  "") ...{
                                                SizedBox(
                                                  height: 60,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: AykaCachedNetworkImage(
                                                          imageUrl: widget
                                                              .statePageMaincontroller
                                                              .getProductsSelectedCategory()[
                                                                  index]
                                                              .productImage!),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  widget.statePageMaincontroller
                                                      .getProductsSelectedCategory()[
                                                          index]
                                                      .productName!,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              },
                                              if (widget.statePageMaincontroller
                                                      .getProductsSelectedCategory()[
                                                          index]
                                                      .productImage! ==
                                                  "") ...{
                                                Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: SizedBox(
                                                    height: 70,
                                                    child: Center(
                                                      child: Text(
                                                        widget
                                                            .statePageMaincontroller
                                                            .getProductsSelectedCategory()[
                                                                index]
                                                            .productName!,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              },
                                              // const SizedBox(
                                              //   height: 15,
                                              // ),
                                              // Spacer(),
                                              if (widget.statePageMaincontroller
                                                      .getProductsSelectedCategory()[
                                                          index]
                                                      .productRates!
                                                      .length !=
                                                  0)
                                                Obx(
                                                  () => Expanded(
                                                    child: Container(
                                                      color: (widget
                                                                  .statePageMaincontroller
                                                                  .orders[widget
                                                                      .statePageMaincontroller
                                                                      .currentOrderIndex
                                                                      .value]
                                                                  .listCart!
                                                                  .indexWhere((elementCheck1) =>
                                                                      elementCheck1
                                                                          .unitPriceLinkingId ==
                                                                      widget
                                                                          .statePageMaincontroller
                                                                          .getProductsSelectedCategory()[
                                                                              index]
                                                                          .productRates![
                                                                              0]
                                                                          .id!)) !=
                                                              -1
                                                          ? Colors.grey[200]
                                                          : Colors.white,
                                                      child: InkWell(
                                                          onTap: () {
                                                            if (widget
                                                                    .statePageMaincontroller
                                                                    .getProductsSelectedCategory()[
                                                                        index]
                                                                    .productRates![
                                                                        0]
                                                                    .rate! ==
                                                                -1) {
                                                              aykaOkToast(
                                                                  "price_not_linked"
                                                                      .tr);
                                                              return;
                                                            }

                                                            widget
                                                                .statePageMaincontroller
                                                                .orders[widget
                                                                    .statePageMaincontroller
                                                                    .currentOrderIndex
                                                                    .value]
                                                                .isOrderUpdated = true;

                                                            var checkItemExistInCart = (widget
                                                                .statePageMaincontroller
                                                                .orders[widget
                                                                    .statePageMaincontroller
                                                                    .currentOrderIndex
                                                                    .value]
                                                                .listCart!
                                                                .indexWhere((elementCheck1) =>
                                                                    elementCheck1
                                                                        .unitPriceLinkingId ==
                                                                    widget
                                                                        .statePageMaincontroller
                                                                        .getProductsSelectedCategory()[
                                                                            index]
                                                                        .productRates![
                                                                            0]
                                                                        .id!));
                                                            if (checkItemExistInCart !=
                                                                -1) {
                                                              widget
                                                                  .statePageMaincontroller
                                                                  .addQuantity(
                                                                      checkItemExistInCart);

                                                              // widget
                                                              //     .statePageMaincontroller
                                                              //     .orders[widget
                                                              //         .statePageMaincontroller
                                                              //         .currentOrderIndex
                                                              //         .value]
                                                              //     .listCart![
                                                              //         checkItemExistInCart]
                                                              //     .quantity = widget
                                                              //         .statePageMaincontroller
                                                              //         .orders[widget
                                                              //             .statePageMaincontroller
                                                              //             .currentOrderIndex
                                                              //             .value]
                                                              //         .listCart![
                                                              //             checkItemExistInCart]
                                                              //         .quantity! +
                                                              //     1;
                                                              // widget
                                                              //     .statePageMaincontroller
                                                              //     .orders
                                                              //     .assignAll([
                                                              //   ...widget
                                                              //       .statePageMaincontroller
                                                              //       .orders
                                                              // ]);
                                                              // aykaOkToast(
                                                              //     "Already existing in cart");
                                                              return;
                                                            }

                                                            var taxPercentage =
                                                                0.0;
                                                            widget
                                                                .statePageMaincontroller
                                                                .getProductsSelectedCategory()[
                                                                    index]
                                                                .taxDetails!
                                                                .forEach(
                                                                    (elementTax) {
                                                              taxPercentage +=
                                                                  elementTax
                                                                      .taxRate!;
                                                            });

                                                            List<ProductCartTaxModel>
                                                                taxArray = [];

                                                            widget
                                                                .statePageMaincontroller
                                                                .getProductsSelectedCategory()[
                                                                    index]
                                                                .taxDetails!
                                                                .forEach(
                                                                    (elementTax) {
                                                              taxArray.add(ProductCartTaxModel(
                                                                  taxId: elementTax
                                                                      .schemeId!,
                                                                  percentage:
                                                                      elementTax
                                                                          .taxRate!));
                                                            });

                                                            widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].listCart!.add(ProductCartModel
                                                                .create(
                                                                    orderListIdApi:
                                                                        (-1)
                                                                            .toString(),
                                                                    kitchenName: widget
                                                                        .statePageMaincontroller
                                                                        .getProductsSelectedCategory()[
                                                                            index]
                                                                        .kitchen!,
                                                                    productName: widget
                                                                        .statePageMaincontroller
                                                                        .getProductsSelectedCategory()[
                                                                            index]
                                                                        .productName,
                                                                    printerIp: widget
                                                                        .statePageMaincontroller
                                                                        .getProductsSelectedCategory()[
                                                                            index]
                                                                        .printer,
                                                                    productImage: widget
                                                                        .statePageMaincontroller
                                                                        .getProductsSelectedCategory()[
                                                                            index]
                                                                        .productImage,
                                                                    quantity: 1,
                                                                    localName: widget
                                                                        .statePageMaincontroller
                                                                        .getProductsSelectedCategory()[index]
                                                                        .productNameLocal,

                                                                    //todo waiter check and assign netvalue and discount amounts here
                                                                    kotNotes: "",
                                                                    discountAmountBillwise: 0,
                                                                    discountAmountItem: 0,
                                                                    discountPercentageBillwise: 0,
                                                                    discountPercentageItem: 0,
                                                                    netTotal: 0,
                                                                    offerAmountBillwise: 0,
                                                                    offerAmountItem: 0,
                                                                    offerPercentageBillwise: 0,
                                                                    offerPercentageItem: 0,
                                                                    saleTotal: 0,
                                                                    taxAmt: 0,
                                                                    taxPercentage: taxPercentage,
                                                                    isTaxInclusive: widget.statePageMaincontroller.getProductsSelectedCategory()[index].isTaxInclusive,

                                                                    //

                                                                    taxScheme: taxArray,
                                                                    rate: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![0].rate!,
                                                                    unitName: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![0].unit!,
                                                                    unitId: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![0].unitId!.toString(),
                                                                    productId: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productId!.toString(),
                                                                    unitPriceLinkingId: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![0].id!,
                                                                    listBundles: []));
                                                            widget
                                                                .statePageMaincontroller
                                                                .doCalculationForSelectedOrderFullItems();
                                                            if (widget.statePageMaincontroller.getSelectedTablesNames(
                                                                        orderIndex: widget
                                                                            .statePageMaincontroller
                                                                            .currentOrderIndex
                                                                            .value) ==
                                                                    "" &&
                                                                widget.statePageMaincontroller
                                                                        .getCurrentOrderSalesSelections()
                                                                        .indexWhere((elementSelections) =>
                                                                            elementSelections ==
                                                                            SalesTypeTableValue.tableSelection) !=
                                                                    -1) {
                                                              showDialogTableSelect();
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        4),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(widget
                                                                    .statePageMaincontroller
                                                                    .getProductsSelectedCategory()[
                                                                        index]
                                                                    .productRates![
                                                                        0]
                                                                    .unit!),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text((widget.statePageMaincontroller
                                                                            .getProductsSelectedCategory()[
                                                                                index]
                                                                            .productRates![
                                                                                0]
                                                                            .rate! ==
                                                                        -1)
                                                                    ? ""
                                                                    : AmountUtils()
                                                                        .getRoundedAmount(
                                                                            amount:
                                                                                widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![0].rate!)
                                                                        .toString()),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )

                                              /*
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const ScrollPhysics(),
                                                  itemBuilder:
                                                      (context, indexRates) =>
                                                          Obx(
                                                            () => Container(
                                                              color: (widget
                                                                          .statePageMaincontroller
                                                                          .orders[widget
                                                                              .statePageMaincontroller
                                                                              .currentOrderIndex
                                                                              .value]
                                                                          .listCart!
                                                                          .indexWhere((elementCheck1) =>
                                                                              elementCheck1.unitPriceLinkingId ==
                                                                              widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].id!)) !=
                                                                      -1
                                                                  ? Colors.grey[200]
                                                                  : Colors.white,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  if (widget
                                                                          .statePageMaincontroller
                                                                          .getProductsSelectedCategory()[
                                                                              index]
                                                                          .productRates![
                                                                              indexRates]
                                                                          .rate! ==
                                                                      -1) {
                                                                    aykaOkToast(
                                                                        "price_not_linked"
                                                                            .tr);
                                                                    return;
                                                                  }

                                                                  var checkItemExistInCart = (widget
                                                                      .statePageMaincontroller
                                                                      .orders[widget
                                                                          .statePageMaincontroller
                                                                          .currentOrderIndex
                                                                          .value]
                                                                      .listCart!
                                                                      .indexWhere((elementCheck1) =>
                                                                          elementCheck1
                                                                              .unitPriceLinkingId ==
                                                                          widget
                                                                              .statePageMaincontroller
                                                                              .getProductsSelectedCategory()[index]
                                                                              .productRates![indexRates]
                                                                              .id!));
                                                                  if (checkItemExistInCart !=
                                                                      -1) {
                                                                    widget
                                                                        .statePageMaincontroller
                                                                        .addQuantity(
                                                                            checkItemExistInCart);

                                                                    // widget
                                                                    //     .statePageMaincontroller
                                                                    //     .orders[widget
                                                                    //         .statePageMaincontroller
                                                                    //         .currentOrderIndex
                                                                    //         .value]
                                                                    //     .listCart![
                                                                    //         checkItemExistInCart]
                                                                    //     .quantity = widget
                                                                    //         .statePageMaincontroller
                                                                    //         .orders[widget
                                                                    //             .statePageMaincontroller
                                                                    //             .currentOrderIndex
                                                                    //             .value]
                                                                    //         .listCart![
                                                                    //             checkItemExistInCart]
                                                                    //         .quantity! +
                                                                    //     1;
                                                                    // widget
                                                                    //     .statePageMaincontroller
                                                                    //     .orders
                                                                    //     .assignAll([
                                                                    //   ...widget
                                                                    //       .statePageMaincontroller
                                                                    //       .orders
                                                                    // ]);
                                                                    // aykaOkToast(
                                                                    //     "Already existing in cart");
                                                                    return;
                                                                  }

                                                                  var taxPercentage =
                                                                      0.0;
                                                                  widget
                                                                      .statePageMaincontroller
                                                                      .getProductsSelectedCategory()[
                                                                          index]
                                                                      .taxDetails!
                                                                      .forEach(
                                                                          (elementTax) {
                                                                    taxPercentage +=
                                                                        elementTax
                                                                            .taxRate!;
                                                                  });

                                                                  List<ProductCartTaxModel>
                                                                      taxArray =
                                                                      [];

                                                                  widget
                                                                      .statePageMaincontroller
                                                                      .getProductsSelectedCategory()[
                                                                          index]
                                                                      .taxDetails!
                                                                      .forEach(
                                                                          (elementTax) {
                                                                    taxArray.add(ProductCartTaxModel(
                                                                        taxId: elementTax
                                                                            .schemeId!,
                                                                        percentage:
                                                                            elementTax
                                                                                .taxRate!));
                                                                  });

                                                                  widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].listCart!.add(ProductCartModel.create(
                                                                      orderListIdApi: (-1).toString(),
                                                                      kitchenName: widget.statePageMaincontroller.getProductsSelectedCategory()[index].kitchen!,
                                                                      productName: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productName,
                                                                      printerIp: widget.statePageMaincontroller.getProductsSelectedCategory()[index].printer,
                                                                      productImage: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productImage,
                                                                      quantity: 1,
                                                                      localName: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productNameLocal,

//todo waiter check and assign netvalue and discount amounts here
                                                                      kotNotes: "",
                                                                      discountAmountBillwise: 0,
                                                                      discountAmountItem: 0,
                                                                      discountPercentageBillwise: 0,
                                                                      discountPercentageItem: 0,
                                                                      netTotal: 0,
                                                                      offerAmountBillwise: 0,
                                                                      offerAmountItem: 0,
                                                                      offerPercentageBillwise: 0,
                                                                      offerPercentageItem: 0,
                                                                      saleTotal: 0,
                                                                      taxAmt: 0,
                                                                      taxPercentage: taxPercentage,
                                                                      isTaxInclusive: widget.statePageMaincontroller.getProductsSelectedCategory()[index].isTaxInclusive,

//

                                                                      taxScheme: taxArray,
                                                                      rate: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].rate!,
                                                                      unitName: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].unit!,
                                                                      unitId: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].unitId!.toString(),
                                                                      productId: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productId!.toString(),
                                                                      unitPriceLinkingId: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].id!,
                                                                      listBundles: []));
                                                                  widget
                                                                      .statePageMaincontroller
                                                                      .doCalculationForSelectedOrderFullItems();
                                                                  if (widget.statePageMaincontroller.getSelectedTablesNames(
                                                                              orderIndex: widget
                                                                                  .statePageMaincontroller.currentOrderIndex.value) ==
                                                                          "" &&
                                                                      widget.statePageMaincontroller.getCurrentOrderSalesSelections().indexWhere((elementSelections) =>
                                                                              elementSelections ==
                                                                              SalesTypeTableValue.tableSelection) !=
                                                                          -1) {
                                                                    showDialogTableSelect();
                                                                  }
                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          4,
                                                                      vertical:
                                                                          4),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                          flex: 3,
                                                                          child: Text(widget
                                                                              .statePageMaincontroller
                                                                              .getProductsSelectedCategory()[index]
                                                                              .productRates![indexRates]
                                                                              .unit!)),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Expanded(
                                                                          flex: 2,
                                                                          child: Text((widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].rate! ==
                                                                                  -1)
                                                                              ? ""
                                                                              : AmountUtils().getRoundedAmount(amount: widget.statePageMaincontroller.getProductsSelectedCategory()[index].productRates![indexRates].rate!).toString())),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  itemCount: widget
                                                      .statePageMaincontroller
                                                      .getProductsSelectedCategory()[
                                                          index]
                                                      .productRates!
                                                      .length)
                                                      */
                                            ],
                                          ),
                                          if (widget.statePageMaincontroller
                                                  .getProductsSelectedCategory()[
                                                      index]
                                                  .productRates!
                                                  .length >
                                              1)
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                  width: 5,
                                                  child: Divider(
                                                    thickness: 5,
                                                    color: Colors.red,
                                                  ),
                                                )),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              }),
            ],
          );
        }),
      ),
    );
  }

  Column categoryItems() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Choose Category",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            // InkWell(
            //     onTap: () {
            //       showDialogCashCustomerRegistration(context);
            //     },
            //     child: const Icon(
            //       Icons.group_add_outlined,
            //       size: 18,
            //     )),
            const SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  widget.statePageMaincontroller.initApi();
                },
                child: const Icon(
                  Icons.refresh,
                  size: 18,
                )),
            const Spacer(),
            (Responsive.isDesktop(context))
                ? Obx(
                    () => TextButton(
                        onPressed: () {
                          widget.statePageMaincontroller.isShowRightWidget
                                  .value =
                              !widget.statePageMaincontroller.isShowRightWidget
                                  .value;
                        },
                        child: Text(
                          (widget.statePageMaincontroller.isShowRightWidget
                                  .value)
                              ? "Hide cart"
                              : "Show Cart" +
                                  ((widget
                                              .statePageMaincontroller
                                              .orders[widget
                                                  .statePageMaincontroller
                                                  .currentOrderIndex
                                                  .value]
                                              .listCart!
                                              .length ==
                                          0)
                                      ? ""
                                      : " (${widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].listCart!.length})"),
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                : SizedBox()
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  widget.statePageMaincontroller.selectCategoryOnClickEvent(
                      widget.statePageMaincontroller.mainApiList[index]
                          .categoryId!);
                },
                child: Obx(
                  () => AspectRatio(
                    aspectRatio: 1,
                    child: NeomorphicFirstWidget(
                      widgetColor: (widget
                                  .statePageMaincontroller
                                  .orders[widget.statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .selectedCategoryId ==
                              widget.statePageMaincontroller.mainApiList[index]
                                  .categoryId)
                          ? CustomColors().categorySelectedColor
                          : Colors.white,
                      shadowColor: Colors.grey[200]!,
                      childWidget: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: (widget
                                              .statePageMaincontroller
                                              .mainApiList[index]
                                              .categoryImage! ==
                                          "all")
                                      ? const Icon(Icons.shopping_bag)
                                      : (widget
                                                  .statePageMaincontroller
                                                  .mainApiList[index]
                                                  .categoryImage! ==
                                              "favorites")
                                          ? const Icon(Icons.favorite)
                                          : (widget
                                                      .statePageMaincontroller
                                                      .mainApiList[index]
                                                      .categoryImage! !=
                                                  "")
                                              ? AykaCachedNetworkImage(
                                                  imageUrl: widget
                                                      .statePageMaincontroller
                                                      .mainApiList[index]
                                                      .categoryImage!)
                                              : SizedBox(),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                widget.statePageMaincontroller
                                    .mainApiList[index].categoryName!,
                                style: TextStyle(
                                    color: (widget
                                                .statePageMaincontroller
                                                .orders[widget
                                                    .statePageMaincontroller
                                                    .currentOrderIndex
                                                    .value]
                                                .selectedCategoryId ==
                                            widget.statePageMaincontroller
                                                .mainApiList[index].categoryId)
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              itemCount: widget.statePageMaincontroller.mainApiList.length,
            ),
          );
        }),
      ],
    );
  }

  Row footerWidget() {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: NeomorphicFirstWidget(
              childWidget: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: footerLeftWidget(),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        Obx(
          () => Expanded(
              flex: widget.statePageMaincontroller.tempObxValue.value,
              child: NeomorphicFirstWidget(
                childWidget: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: footerRightWidget(),
                ),
              )),
        ),
      ],
    );
  }

  Widget footerRightWidget() {
    return Container(
      // color: Colors.red,
      height: 40,
      // width: 300,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...widget.statePageMaincontroller.salesTypes
                    .map((itemSaleType) => NeomorphicSecondWidget(
                          childWidget: TextButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: (widget
                                            .statePageMaincontroller
                                            .orders[widget
                                                .statePageMaincontroller
                                                .currentOrderIndex
                                                .value]
                                            .selectedOrderType ==
                                        itemSaleType.id)
                                    ? CustomColors()
                                        .mainNavigationRailIndicatiorColor
                                    : Colors.white,
                              ),
                              onPressed: () {
                                widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .isOrderUpdated = true;

                                widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .selectedOrderType = itemSaleType.id;
                                widget.statePageMaincontroller.orders.assignAll(
                                    [...widget.statePageMaincontroller.orders]);

                                widget.statePageMaincontroller
                                    .refreshRateDependOnSaleType();
                              },
                              child: Text(
                                itemSaleType.name!,
                                style: TextStyle(
                                    color: (widget
                                                .statePageMaincontroller
                                                .orders[widget
                                                    .statePageMaincontroller
                                                    .currentOrderIndex
                                                    .value]
                                                .selectedOrderType ==
                                            itemSaleType.id)
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget footerLeftWidget() {
    return Container(
      // color: Colors.red,
      height: 40,
      // width: 300,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NeomorphicSecondWidget(
                  childWidget: TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if ((widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .isOrderCreateProgressBarVisibile ==
                                true) ||
                            widget.statePageMaincontroller
                                    .isWaiterScreenUnderWorkingForDisableButtons ==
                                true) {
                          aykaOkToast(
                              "order_under_processing_please_do_again".tr);
                          return;
                        }

                        widget.statePageMaincontroller.addNewOrder();

                        // Get.to(()=>GuiTable());
                      },
                      child: const Text(
                        "  New  ",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column headerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Obx(() => topEdittexts()),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => (Responsive.isMobile(context))
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                        IconButton(
                            onPressed: () {
                              widget.statePageMaincontroller.initApi();
                            },
                            icon: const Icon(Icons.refresh)),
                       
                        RichText(
                          text: TextSpan(
                            text: '${"no".tr}: ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text:
                                    "${(widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].token == "-1") ? "new".tr : widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].token!}",
                                // text: "${statePageMaincontroller.isButtonOnKotOn.value}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(children: [
                  ...headerWidgetCounts(),
                  ...headerWidgetButtons(),
                ]),
        )
      ],
    );
  }

  List headerWidgetButtons() {
    return [
      if (!Responsive.isMobile(context))
        const SizedBox(
          width: 10,
        ),
      if (!Responsive.isDesktop(context)) ...{
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.layers_outlined,
            )),
        // InkWell(
        //     onTap: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //     child: const Icon(
        //       Icons.layers_outlined,
        //       size: 18,
        //     )),
        const SizedBox(
          width: 10,
        ),
      },

    ];
  }

  List headerWidgetCounts() {
    return [
      RichText(
        text: TextSpan(
          text: '${"no".tr}: ',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text:
                  "${(widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].token == "-1") ? "new".tr : widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].token!}",

              // text: "${statePageMaincontroller.isButtonOnKotOn.value}",
            ),
          ],
        ),
      ),
      const Spacer(),
      RichText(
        text: TextSpan(
          text: '${"order".tr}: ',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: "${widget.statePageMaincontroller.totalOrders}",
              // text: "${statePageMaincontroller.isButtonOnKotOn.value}",
            ),
          ],
        ),
      ),
      // const Spacer(),
      // RichText(
      //   text: TextSpan(
      //     text:
      //         '${"token".tr}: ',
      //     style:
      //         const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      //     children: [
      //       TextSpan(
      //           text:
      //               "${widget.statePageMaincontroller.getCurrentToken(widget.statePageMaincontroller.currentOrderIndex.value)}"),
      //     ],
      //   ),
      // ),
      if (!Responsive.isMobile(context)) const Spacer(),
    ];
  }

  Widget topEdittexts() {
    List<int> listSalesTypeSelections = [];
    int indexSalesType = widget.statePageMaincontroller.salesTypes.indexWhere(
        (elementSalesType) =>
            elementSalesType.id ==
            widget
                .statePageMaincontroller
                .orders[widget.statePageMaincontroller.currentOrderIndex.value]
                .selectedOrderType);
    if (indexSalesType != -1) {
      listSalesTypeSelections.addAll(widget
          .statePageMaincontroller.salesTypes[indexSalesType].selections!);
    }
    print("______topEdittexts()  $listSalesTypeSelections ");
    print("______topEdittexts()  indexSalesType  $indexSalesType ");
    print(
        "______topEdittexts()  selectedOrderType   ${widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].selectedOrderType} ");

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if ((listSalesTypeSelections.indexWhere((elementSaleTypeInt) =>
                    elementSaleTypeInt == SalesTypeTableValue.customerData) !=
                -1) ||
            (listSalesTypeSelections.indexWhere((elementSaleTypeInt) =>
                    elementSaleTypeInt == SalesTypeTableValue.deliveryBoy) !=
                -1))
          topEdittextTypeTakeaway(listSalesTypeSelections),
        if ((listSalesTypeSelections.indexWhere((elementSaleTypeInt) =>
                elementSaleTypeInt == SalesTypeTableValue.tableSelection) !=
            -1)) ...{
          SizedBox(
            height: 10,
          ),
          topEdittextTypeDineIn(),
        },
        if (listSalesTypeSelections.indexWhere((elementSaleTypeInt) =>
                elementSaleTypeInt == SalesTypeTableValue.onlineOrder) !=
            -1) ...{
          SizedBox(
            height: 10,
          ),
          topEdittextTypeOnline(),
        }
      ],
    );
  }

  Widget topEdittextTypeDelivery() {
    if (!Responsive.isMobile(context)) {
      return Row(
        children: [
          topEdittextTypeDeliveryWidgetSelectDriver(),
          const SizedBox(
            width: 10,
          ),
          topEdittextTypeDeliveryWidgetDeliveryCustomerName(),
          const SizedBox(
            width: 10,
          ),
          topEdittextTypeDeliveryWidgetDeliveryCustomerPhone(),
          const SizedBox(
            width: 10,
          ),
          topEdittextTypeDeliveryWisgetDeliveryCustomerAddress(),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              topEdittextTypeDeliveryWidgetSelectDriver(),
              const SizedBox(
                width: 10,
              ),
              topEdittextTypeDeliveryWidgetDeliveryCustomerName(),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              topEdittextTypeDeliveryWidgetDeliveryCustomerPhone(),
              const SizedBox(
                width: 10,
              ),
              topEdittextTypeDeliveryWisgetDeliveryCustomerAddress(),
            ],
          )
        ],
      );
    }
  }

  Expanded topEdittextTypeDeliveryWisgetDeliveryCustomerAddress() {
    return Expanded(
        child: Obx(
      () => TextField(
        controller: widget
            .statePageMaincontroller
            .orders[widget.statePageMaincontroller.currentOrderIndex.value]
            .takeAwayCustomerAddressTextedittingController!,
        decoration: InputDecoration(
          suffixIcon: (widget
                      .statePageMaincontroller
                      .orders[widget
                          .statePageMaincontroller.currentOrderIndex.value]
                      .customerAddress!
                      .length !=
                  0)
              ? takeAwayAddressListSelectIconButton(
                  widget
                      .statePageMaincontroller
                      .orders[widget
                          .statePageMaincontroller.currentOrderIndex.value]
                      .customerAddress!,
                  widget
                      .statePageMaincontroller
                      .orders[widget
                          .statePageMaincontroller.currentOrderIndex.value]
                      .takeAwayCustomerAddressTextedittingController!)
              : null,
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "address".tr,
        ),
      ),
    ));
  }

  Expanded topEdittextTypeDeliveryWidgetDeliveryCustomerPhone() {
    return Expanded(
        child: TextField(
      onChanged: widget.statePageMaincontroller.onSearchTextChanged,
      controller: widget
          .statePageMaincontroller
          .orders[widget.statePageMaincontroller.currentOrderIndex.value]
          .takeAwayCustomerMobileTextedittingController!,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: "phone".tr,
      ),
    ));
  }

  Expanded topEdittextTypeDeliveryWidgetDeliveryCustomerName() {
    return Expanded(
        child: Container(
      color: Colors.red,
    ));

// return   Expanded(
//   child:   Obx(

//                               () => Stack(

//                                 children: [
//   Autocomplete<CustomerDetail>(
//      initialValue: TextEditingValue(
//           text:widget
//           .statePageMaincontroller
//           .orders[widget.statePageMaincontroller.currentOrderIndex.value]
//           .takeAwayCustomerNameTextedittingController!.text),
//       optionsBuilder: (TextEditingValue textEditingValue) {
//         print("___textEditingValue   ${textEditingValue.text}");
//         return widget.statePageMaincontroller
//             .onSearchTextChangedCustomerName(textEditingValue.text);

//       },
//       fieldViewBuilder: (BuildContext context,
//           TextEditingController fieldTextEditingController,
//           FocusNode fieldFocusNode,
//           VoidCallback onFieldSubmitted) {
//             widget
//           .statePageMaincontroller
//           .orders[widget.statePageMaincontroller.currentOrderIndex.value]
//           .takeAwayCustomerNameTextedittingController =
//             fieldTextEditingController;
//         return TextFormField(
//           decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: CustomColors().masterBordersideColor),
//                   borderRadius: const BorderRadius.all(Radius.circular(10.0))),
//               border: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       color: CustomColors().masterBordersideColor, width: 0.0),
//                   borderRadius: const BorderRadius.all(Radius.circular(10.0))),
//               hintText: " ${"customer".tr}",
//               labelStyle: TextStyle(
//                   fontSize: 15.27,
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//                   color: CustomColors().masterHintTextColor,
//                   fontFamily: 'Poppins',
//                   letterSpacing: 0.02),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: CustomColors().masterBordersideColor,
//                   ),
//                   borderRadius: const BorderRadius.all(Radius.circular(10.0))),
//               suffixIcon: IconButton(
//                   onPressed: () {
//                     widget
//           .statePageMaincontroller
//           .orders[widget.statePageMaincontroller.currentOrderIndex.value]
//           .takeAwayCustomerNameTextedittingController!.text!="";
//           widget
//           .statePageMaincontroller
//           .orders.refresh();
//                   },
//                   icon: Icon(
//                     Icons.close,
//                     color: CustomColors().masterBordersideColor,
//                   ))),

//           controller: widget
//           .statePageMaincontroller
//           .orders[widget.statePageMaincontroller.currentOrderIndex.value]
//           .takeAwayCustomerNameTextedittingController!,

//           focusNode: fieldFocusNode,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'please_enter_supplier'.tr;
//             }
//             return null; // Return null if input is valid.
//           },
//           // style: const TextStyle(fontWeight: FontWeight.bold),
//           onFieldSubmitted: (value) => onFieldSubmitted(),
//         );
//       },
//       displayStringForOption: (CustomerDetail option) =>
//           option.name!,
//       onSelected: (CustomerDetail item) {

//         widget
//           .statePageMaincontroller
//           .orders[widget.statePageMaincontroller.currentOrderIndex.value]
//           .takeAwayCustomerNameTextedittingController!.text = item.name!;
//         // _statePageMaincontroller.supplierId.value = item.id!;
//         // _statePageMaincontroller.addressTextController.value.text =
//         //     item.address!;
//         // _statePageMaincontroller.mobileTextController.value.text = item.mobile!;
//         // _statePageMaincontroller.autoCompleteTextSupplierName.value =
//         //     item.name!;
//         // _statePageMaincontroller.supplierCreditLimit.value = item.creditLimit!;
//       },
//     ),

//                                   if (widget.statePageMaincontroller

//                                       .isShowNameSearchProgressbar.value)

//                                     const LinearProgressIndicator(

//                                       color:

//                                           CustomColors.screenTopLinearProgressBar,

//                                       backgroundColor: Colors.white,

//                                     ),

//   Text("data")
//                                 ],

//                               ),

//                             ),
// );

//     return Expanded(
//         child: TextField(
//       controller: widget
//           .statePageMaincontroller
//           .orders[widget.statePageMaincontroller.currentOrderIndex.value]
//           .takeAwayCustomerNameTextedittingController!,
//       textInputAction: TextInputAction.next,

//       decoration: InputDecoration(
//         border: InputBorder.none,
//         fillColor: Colors.white,
//         filled: true,
//         contentPadding: const EdgeInsets.all(10.0),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey[300]!,
//           ),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         hintText: "customer_name".tr,
//       ),
//       // enabled: false,
//     ));
  }

  Expanded topEdittextTypeDeliveryWidgetSelectDriver() {
    return Expanded(
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: Colors.grey[500]!)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: (widget
                      .statePageMaincontroller
                      .orders[widget
                          .statePageMaincontroller.currentOrderIndex.value]
                      .deliveryStaffDropDownItemsValue ==
                  "")
              ? null
              : widget
                  .statePageMaincontroller
                  .orders[
                      widget.statePageMaincontroller.currentOrderIndex.value]
                  .deliveryStaffDropDownItemsValue,
          isExpanded: true,
          hint: Text("select_driver".tr,
              style: const TextStyle(color: Colors.grey)),
          items: widget.statePageMaincontroller.deliveryStaffs
              .map((SpinnerStringString value) {
            return DropdownMenuItem<String>(
              value: value.id,
              child: Text(value.value),
            );
          }).toList(),
          onChanged: (newValue) {
            final index1 = widget.statePageMaincontroller.deliveryStaffs
                .indexWhere((element) => element.id == newValue);

            widget
                    .statePageMaincontroller
                    .orders[widget.statePageMaincontroller.currentOrderIndex.value]
                    .deliveryStaffDropDownItemsValue =
                widget.statePageMaincontroller.deliveryStaffs[index1].id;
            widget.statePageMaincontroller.orders
                .assignAll([...widget.statePageMaincontroller.orders]);
          },
        ),
      ),
    );
  }

  Widget topEdittextTypeOnline() {
    if (Responsive.isMobile(context)) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    topEdittextTypeOnlineWidgetSelectProviderText(),
                    const SizedBox(
                      width: 5,
                    ),
                    topEdittextTypeOnlineWidgetSelectProviderDropDown()
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              topEdittextTypeOnlineWidgetRefNo(),
            ],
          )
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Row(
              children: [
                topEdittextTypeOnlineWidgetSelectProviderText(),
                const SizedBox(
                  width: 5,
                ),
                topEdittextTypeOnlineWidgetSelectProviderDropDown()
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          topEdittextTypeOnlineWidgetRefNo(),
        ],
      );
    }
  }

  Expanded topEdittextTypeOnlineWidgetRefNo() {
    return Expanded(
        child: TextField(
      controller: widget
          .statePageMaincontroller
          .orders[widget.statePageMaincontroller.currentOrderIndex.value]
          .onlineReferenceNumbersTextedittingController!,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: "ref_no".tr,
      ),
    ));
  }

  Text topEdittextTypeOnlineWidgetSelectProviderText() {
    return Text(
      "select_provider".tr,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Expanded topEdittextTypeOnlineWidgetSelectProviderDropDown() {
    return Expanded(
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: Colors.grey[500]!)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: (widget
                      .statePageMaincontroller
                      .orders[widget
                          .statePageMaincontroller.currentOrderIndex.value]
                      .deliveryProviderDropDownItemsValue ==
                  "")
              ? null
              : widget
                  .statePageMaincontroller
                  .orders[
                      widget.statePageMaincontroller.currentOrderIndex.value]
                  .deliveryProviderDropDownItemsValue,
          isExpanded: true,
          hint: Text("delivery_provider".tr,
              style: const TextStyle(color: Colors.grey)),
          items: widget.statePageMaincontroller.deliveryProviders
              .map((SpinnerStringString value) {
            return DropdownMenuItem<String>(
              value: value.id,
              child: Text(value.value),
            );
          }).toList(),
          onChanged: (newValue) {
            final index1 = widget.statePageMaincontroller.deliveryProviders
                .indexWhere((element) => element.id == newValue);

            widget
                    .statePageMaincontroller
                    .orders[widget.statePageMaincontroller.currentOrderIndex.value]
                    .deliveryProviderDropDownItemsValue =
                widget.statePageMaincontroller.deliveryProviders[index1].id;
            widget.statePageMaincontroller.orders
                .assignAll([...widget.statePageMaincontroller.orders]);
          },
        ),
      ),
    );
  }

  Widget topEdittextTypeDineIn() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                "select_table".tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    showDialogTableSelect();
                  },
                  child: Obx(
                    () => Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(color: Colors.grey[500]!)),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: (widget
                                  .statePageMaincontroller
                                  .orders[widget.statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .chairIds!
                                  .isNotEmpty)
                              ? Text(
                                  widget.statePageMaincontroller
                                      .getSelectedTablesNames(
                                          orderIndex: widget
                                              .statePageMaincontroller
                                              .currentOrderIndex
                                              .value),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              : const Text(
                                  "Select Table",
                                  style: TextStyle(color: Colors.grey),
                                )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   width: 20,
        // ),
        // Expanded(
        //   child: Row(
        //     children: [
        //       const Text(
        //         "Select Waiter",
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(
        //         width: 5,
        //       ),
        //       Expanded(
        //         child: Container(
        //           height: 40.0,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(7.0),
        //               border: Border.all(color: Colors.grey[500]!)),
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           child: DropdownButton<String>(
        //                             underline:const SizedBox(),
        //             value: (widget
        //                         .statePageMaincontroller
        //                         .orders[widget.statePageMaincontroller
        //                             .currentOrderIndex.value]
        //                         .waiterDropDownItemsValue ==
        //                     "")
        //                 ? null
        //                 : widget
        //                     .statePageMaincontroller
        //                     .orders[widget.statePageMaincontroller
        //                         .currentOrderIndex.value]
        //                     .waiterDropDownItemsValue,
        //             isExpanded: true,
        //             hint: const Text("Select Waiter",
        //                 style: TextStyle(color: Colors.grey)),
        //             items: widget.statePageMaincontroller.waiterDropDownItems
        //                 .map((SpinnerStringString value) {
        //               return DropdownMenuItem<String>(
        //                 value: value.id,
        //                 child: Text(value.value),
        //               );
        //             }).toList(),
        //             onChanged: (_newValue) {
        //               final index1 = widget
        //                   .statePageMaincontroller.waiterDropDownItems
        //                   .indexWhere((element) => element.id == _newValue);

        //               widget
        //                       .statePageMaincontroller
        //                       .orders[
        //                           widget.statePageMaincontroller.currentOrderIndex
        //                               .value]
        //                       .waiterDropDownItemsValue =
        //                   widget.statePageMaincontroller
        //                       .waiterDropDownItems[index1].id;
        //               widget.statePageMaincontroller.orders.assignAll(
        //                   [...widget.statePageMaincontroller.orders]);
        //             },
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget topEdittextTypeTakeaway(List<int> listSalesTypeSelections) {
    return Row(
      children: [
        if ((listSalesTypeSelections.indexWhere((elementSaleTypeInt) =>
                elementSaleTypeInt == SalesTypeTableValue.deliveryBoy) !=
            -1)) ...{
          topEdittextTypeDeliveryWidgetSelectDriver(),
          const SizedBox(
            width: 10,
          )
        },
        if ((listSalesTypeSelections.indexWhere((elementSaleTypeInt) =>
                elementSaleTypeInt == SalesTypeTableValue.customerData) !=
            -1)) ...{
          Expanded(
            child: Obx(() {
              print(
                  "__________ customer name updated  ${widget.statePageMaincontroller.orders[widget.statePageMaincontroller.currentOrderIndex.value].takeAwayCustomerNameTextedittingController!.text}");

              return Stack(
                children: [
                  Autocomplete<CustomerDetail>(
                    key: Key(widget
                        .statePageMaincontroller
                        .orders[widget
                            .statePageMaincontroller.currentOrderIndex.value]
                        .intTakeAwayCustomerNameTextedittingController
                        .toString()),
                    initialValue: TextEditingValue(
                        text: widget
                            .statePageMaincontroller
                            .orders[widget.statePageMaincontroller
                                .currentOrderIndex.value]
                            .takeAwayCustomerNameTextedittingController!
                            .text),
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      print("___textEditingValue   ${textEditingValue.text}");
                      return widget.statePageMaincontroller
                          .onSearchTextChangedCustomerName(
                              textEditingValue.text);
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      widget
                              .statePageMaincontroller
                              .orders[
                                  widget.statePageMaincontroller.currentOrderIndex
                                      .value]
                              .takeAwayCustomerNameTextedittingController =
                          fieldTextEditingController;
                      return TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        CustomColors().masterBordersideColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomColors().masterBordersideColor,
                                    width: 0.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            hintText: " ${"customer".tr}",
                            labelStyle: TextStyle(
                                fontSize: 15.27,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: CustomColors().masterHintTextColor,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.02),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColors().masterBordersideColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  widget
                                      .statePageMaincontroller
                                      .orders[widget.statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .takeAwayCustomerNameTextedittingController!
                                      .clear();
                                  widget.statePageMaincontroller.orders
                                      .refresh();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: CustomColors().masterBordersideColor,
                                ))),

                        controller: widget
                            .statePageMaincontroller
                            .orders[widget.statePageMaincontroller
                                .currentOrderIndex.value]
                            .takeAwayCustomerNameTextedittingController!,

                        focusNode: fieldFocusNode,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'please_enter_supplier'.tr;
                        //   }
                        //   return null; // Return null if input is valid.
                        // },
                        // style: const TextStyle(fontWeight: FontWeight.bold),
                        onFieldSubmitted: (value) => onFieldSubmitted(),
                      );
                    },
                    displayStringForOption: (CustomerDetail option) =>
                        option.name!,
                    onSelected: (CustomerDetail item) {
                      // widget
                      //     .statePageMaincontroller
                      //     .orders[widget
                      //         .statePageMaincontroller.currentOrderIndex.value]
                      //     .takeAwayCustomerNameTextedittingController!
                      //     .text = item.name!;

                      widget
                          .statePageMaincontroller
                          .orders[widget
                              .statePageMaincontroller.currentOrderIndex.value]
                          .takeAwayCustomerMobileTextedittingController!
                          .text = item.mobile!;

                      if (item.addressList!.length != 0) {
                        widget.statePageMaincontroller.isCustomerAddressEnabled
                            .value = false;
                        widget
                            .statePageMaincontroller
                            .orders[widget.statePageMaincontroller
                                .currentOrderIndex.value]
                            .takeAwayCustomerAddressTextedittingController!
                            .text = item.addressList![0].address!;
                        // orders[currentIndex]
                        //     .takeAwayCustomerAddressTextedittingController!
                        //     .text = "";
                        widget
                            .statePageMaincontroller
                            .orders[widget.statePageMaincontroller
                                .currentOrderIndex.value]
                            .customerAddress = RxList(item.addressList!);
                      } else {
                        widget.statePageMaincontroller.isCustomerAddressEnabled
                            .value = true;
                        widget
                            .statePageMaincontroller
                            .orders[widget.statePageMaincontroller
                                .currentOrderIndex.value]
                            .takeAwayCustomerAddressTextedittingController!
                            .text = "";
                        widget
                            .statePageMaincontroller
                            .orders[widget.statePageMaincontroller
                                .currentOrderIndex.value]
                            .customerAddress = RxList();
                      }

                      // _statePageMaincontroller.supplierId.value = item.id!;
                      // _statePageMaincontroller.addressTextController.value.text =
                      //     item.address!;
                      // _statePageMaincontroller.mobileTextController.value.text = item.mobile!;
                      // _statePageMaincontroller.autoCompleteTextSupplierName.value =
                      //     item.name!;
                      // _statePageMaincontroller.supplierCreditLimit.value = item.creditLimit!;
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: Container(
                            width:
                                350, // Set the desired width for suggestion items
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(
                                    options.elementAt(index).name!,
                                  ),
                                  subtitle:
                                      Text(options.elementAt(index).mobile!),
                                  onTap: () {
                                    onSelected(options.elementAt(index));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (widget.statePageMaincontroller.isShowNameSearchProgressbar
                      .value)
                    const LinearProgressIndicator(
                      color: CustomColors.screenTopLinearProgressBar,
                      backgroundColor: Colors.white,
                    ),
                ],
              );
            }),
          ),
          // Expanded(
          //     child: TextField(
          //   maxLines: 1,
          //   controller: widget
          //       .statePageMaincontroller
          //       .orders[widget.statePageMaincontroller.currentOrderIndex.value]
          //       .takeAwayCustomerNameTextedittingController!,
          //   textInputAction: TextInputAction.next,
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     fillColor: Colors.white,
          //     filled: true,
          //     contentPadding: const EdgeInsets.all(10.0),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Colors.grey[300]!,
          //       ),
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     hintText: "customer_name".tr,
          //   ),
          //   // enabled: false,
          // )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            onChanged: widget.statePageMaincontroller.onSearchTextChanged,
            controller: widget
                .statePageMaincontroller
                .orders[widget.statePageMaincontroller.currentOrderIndex.value]
                .takeAwayCustomerMobileTextedittingController!,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.all(10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "phone",
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Obx(
            () => Expanded(
              child: Stack(
                children: [
                  TextField(
                    enabled: widget
                        .statePageMaincontroller.isCustomerAddressEnabled.value,
                    controller: widget
                        .statePageMaincontroller
                        .orders[widget
                            .statePageMaincontroller.currentOrderIndex.value]
                        .takeAwayCustomerAddressTextedittingController!,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "address".tr,
                    ),
                  ),
                  if (widget
                              .statePageMaincontroller
                              .orders[widget.statePageMaincontroller
                                  .currentOrderIndex.value]
                              .customerAddress!
                              .length !=
                          0 &&
                      widget.statePageMaincontroller.isCustomerAddressEnabled
                              .value ==
                          false)
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.centerRight,
                      // alignment: Alignment.bottomRight,
                      child: takeAwayAddressListSelectIconButton(
                          widget
                              .statePageMaincontroller
                              .orders[widget.statePageMaincontroller
                                  .currentOrderIndex.value]
                              .customerAddress!,
                          widget
                              .statePageMaincontroller
                              .orders[widget.statePageMaincontroller
                                  .currentOrderIndex.value]
                              .takeAwayCustomerAddressTextedittingController!),
                    )
                ],
              ),
            ),
          )
        }
      ],
    );
  }

  Widget takeAwayAddressListSelectIconButton(
      List<AddressList> address, TextEditingController textController) {
/*
 (widget
                        .statePageMaincontroller
                        .orders[widget
                            .statePageMaincontroller.currentOrderIndex.value]
                        .customerAddress!
                        .length !=
                    0)

 */

    return PopupMenuButton(
        offset: const Offset(-0, 0),
        onSelected: (value) {
        
            textController.text = value.toString();
          
        },
        itemBuilder: (context) => [
              ...address.map((addressItem) {
                return PopupMenuItem(
                  value: addressItem.address,
                  child: SizedBox(
                      child: SizedBox(
                          // width: 200,
                          child: Text(addressItem.address!))),
                );
              }).toList(),
              PopupMenuItem(
                value: "edit_customer_address",
                child: SizedBox(
                    child: SizedBox(
                        // width: 200,
                        child: Text(
                  "edit_address".tr,
                  style: TextStyle(color: Colors.green),
                ))),
              )
              // PopupMenuItem(
              //     child: ElevatedButton(onPressed: () {
              //       Get.back();
              //     }, child: Text("AAAA")))
            ],
        // itemBuilder: (context) => [
        //       PopupMenuItem(
        //         child: Text("data"),
        //       ),
        //       PopupMenuItem(
        //         value: 1,
        //         child: CheckboxListTile(
        //             title: Text("ASDF"), value: true, onChanged: (aaa) {}),
        //       ),
        //     ],
        child: Icon(Icons.format_list_bulleted_add));
  }

  void showdialogProductDetails(BuildContext context, Product productDetails,
      ScreenMainOrderController statePageMaincontroller) async {
    if (productDetails.productRates!.isEmpty) {
      aykaSnackbar(context: context, content: "Rate not linked");
    } else {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    14.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SizedBox(
                    width: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: AykaCachedNetworkImage(
                                      imageUrl: productDetails.productImage!),
                                ),
                              )),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Obx(
                                  () => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: statePageMaincontroller
                                            .tempObxIssueSolving.value,
                                      ),
                                      Text(
                                        productDetails.productName!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Obx(
                                        () => ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0.0),
                                          title: Text("favorites".tr),
                                          leading: Icon((statePageMaincontroller
                                                      .userFavoritesList
                                                      .indexWhere(
                                                          (elementFavorites) =>
                                                              elementFavorites ==
                                                              productDetails
                                                                  .productId) ==
                                                  -1)
                                              ? Icons.favorite_outline
                                              : Icons.favorite),
                                          onTap: () {
                                            statePageMaincontroller
                                                .addAndRemoveUserFavorites(
                                                    productDetails.productId!);
                                          },
                                        ),
                                      ),
                                      if (productDetails
                                              .productBundles!.isNotEmpty &&
                                          productDetails
                                                  .productRates![0].rate! !=
                                              -1)
                                        (statePageMaincontroller
                                                    .orders[
                                                        statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                    .listCart!
                                                    .indexWhere((elementCheck1) =>
                                                        elementCheck1
                                                            .unitPriceLinkingId ==
                                                        productDetails
                                                            .productRates![0]
                                                            .id!) ==
                                                -1)
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      print("____ d1");
                                                      widget
                                                          .statePageMaincontroller
                                                          .orders[widget
                                                              .statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .isOrderUpdated = true;

                                                      List<ProductCartTaxModel>
                                                          taxArray = [];
                                                      productDetails.taxDetails!
                                                          .forEach(
                                                              (elementTax) {
                                                        taxArray.add(
                                                            ProductCartTaxModel(
                                                                taxId: elementTax
                                                                    .schemeId!,
                                                                percentage:
                                                                    elementTax
                                                                        .taxRate!));
                                                      });

                                                      print("____ d2");
                                                      statePageMaincontroller.orders[statePageMaincontroller.currentOrderIndex.value].listCart!.add(ProductCartModel
                                                          .create(
                                                              productName:
                                                                  productDetails
                                                                      .productName!,
                                                              printerIp:
                                                                  productDetails
                                                                      .printer!,
                                                              productImage:
                                                                  productDetails
                                                                      .productImage,
                                                              kitchenName:
                                                                  productDetails
                                                                      .kitchen!,
                                                              localName: productDetails
                                                                  .productNameLocal,
                                                              quantity: 1,
                                                              orderListIdApi: (-1)
                                                                  .toString(),
                                                              rate: productDetails
                                                                  .productRates![
                                                                      0]
                                                                  .rate!,

                                                              //todo waiter check and assign netvalue and discount amounts here
                                                              discountAmountBillwise:
                                                                  0,
                                                              discountAmountItem:
                                                                  0,
                                                              taxAmt: 0,
                                                              discountPercentageBillwise:
                                                                  0,
                                                              discountPercentageItem:
                                                                  0,
                                                              netTotal: 0,
                                                              offerAmountBillwise:
                                                                  0,
                                                              offerAmountItem:
                                                                  0,
                                                              offerPercentageBillwise:
                                                                  0,
                                                              offerPercentageItem:
                                                                  0,
                                                              saleTotal: 0,
                                                              taxPercentage: 0,
                                                              isTaxInclusive:
                                                                  false,
                                                              //
                                                              kotNotes: "",
                                                              taxScheme: taxArray,
                                                              productId: productDetails.productId!.toString(),
                                                              unitName: productDetails.productRates![0].unit!,
                                                              unitId: productDetails.productRates![0].unitId!.toString(),
                                                              unitPriceLinkingId: productDetails.productRates![0].id!,
                                                              listBundles: []));

                                                      print("____ d3");
                                                      widget
                                                          .statePageMaincontroller
                                                          .doCalculationForSelectedOrderFullItems();

                                                      print("____ d4");
                                                      // widget
                                                      //     .statePageMaincontroller
                                                      //     .logOrders();
                                                    },
                                                    child:
                                                        Text("add_to_cart".tr),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shape:
                                                                StadiumBorder())),
                                              )
                                            :
                                            // Text("Exist")
                                            Obx(
                                                () => Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 25,
                                                      child:
                                                          FloatingActionButton
                                                              .small(
                                                        onPressed: () {
                                                          var indexCart = statePageMaincontroller
                                                              .orders[statePageMaincontroller
                                                                  .currentOrderIndex
                                                                  .value]
                                                              .listCart!
                                                              .indexWhere((elementCheck1) =>
                                                                  elementCheck1
                                                                      .unitPriceLinkingId ==
                                                                  productDetails
                                                                      .productRates![
                                                                          0]
                                                                      .id!);

                                                          statePageMaincontroller
                                                              .descreaseQuantity(
                                                                  indexCart);
                                                        },
                                                        child: const Text("-"),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      statePageMaincontroller
                                                          .orders[statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .listCart![statePageMaincontroller
                                                              .orders[statePageMaincontroller
                                                                  .currentOrderIndex
                                                                  .value]
                                                              .listCart!
                                                              .indexWhere((elementCheck1) =>
                                                                  elementCheck1
                                                                      .unitPriceLinkingId ==
                                                                  productDetails
                                                                      .productRates![
                                                                          0]
                                                                      .id!)]
                                                          .quantity
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 25,
                                                      child:
                                                          FloatingActionButton
                                                              .small(
                                                        onPressed: () {
                                                          var indexCart = statePageMaincontroller
                                                              .orders[statePageMaincontroller
                                                                  .currentOrderIndex
                                                                  .value]
                                                              .listCart!
                                                              .indexWhere((elementCheck1) =>
                                                                  elementCheck1
                                                                      .unitPriceLinkingId ==
                                                                  productDetails
                                                                      .productRates![
                                                                          0]
                                                                      .id!);

                                                          statePageMaincontroller
                                                              .addQuantity(
                                                                  indexCart);
                                                        },
                                                        child: const Text("+"),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          if (productDetails.productBundles!.isEmpty)
                            ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Obx(
                                () => ListTile(
                                  title: Text(productDetails
                                      .productRates![index].unit!),
                                  subtitle: Text((productDetails
                                              .productRates![index].rate! ==
                                          -1)
                                      ? ""
                                      : "Rate: ${AmountUtils().getRoundedAmount(amount: productDetails.productRates![index].rate!)}"),
                                  trailing:
                                      //  (productDetails
                                      //             .productRates![index].rate! ==
                                      //         -1)
                                      //     ? null
                                      //     :
                                      (statePageMaincontroller
                                                  .orders[
                                                      statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value]
                                                  .listCart!
                                                  .indexWhere((elementCheck1) =>
                                                      elementCheck1
                                                          .unitPriceLinkingId ==
                                                      productDetails
                                                          .productRates![index]
                                                          .id!) ==
                                              -1)
                                          ? (productDetails.productRates![index]
                                                      .rate! ==
                                                  -1)
                                              ? SizedBox()
                                              : IconButton(
                                                  onPressed: () {
                                                    print("____f1");

                                                    widget
                                                        .statePageMaincontroller
                                                        .orders[widget
                                                            .statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                        .isOrderUpdated = true;

                                                    var taxPercentage = 0.0;
                                                    productDetails.taxDetails!
                                                        .forEach((elementTax) {
                                                      taxPercentage +=
                                                          elementTax.taxRate!;
                                                    });
                                                    print("____f2");
                                                    List<ProductCartTaxModel>
                                                        taxArray = [];
                                                    productDetails.taxDetails!
                                                        .forEach((elementTax) {
                                                      taxArray.add(
                                                          ProductCartTaxModel(
                                                              taxId: elementTax
                                                                  .schemeId!,
                                                              percentage:
                                                                  elementTax
                                                                      .taxRate!));
                                                    });
                                                    print("____f3");
                                                    statePageMaincontroller.orders[statePageMaincontroller.currentOrderIndex.value].listCart!.add(
                                                        ProductCartModel.create(
                                                            productName: productDetails
                                                                .productName!,
                                                            printerIp:
                                                                productDetails
                                                                    .printer!,
                                                            productImage:
                                                                productDetails
                                                                    .productImage,
                                                            kitchenName:
                                                                productDetails
                                                                    .kitchen!,
                                                            localName: productDetails
                                                                .productNameLocal,
                                                            kotNotes: "",
                                                            quantity: 1,
                                                            orderListIdApi:
                                                                (-1).toString(),
                                                            rate: productDetails
                                                                .productRates![
                                                                    index]
                                                                .rate!,
                                                            //todo waiter check and assign netvalue and discount amounts here
                                                            discountAmountBillwise:
                                                                0,
                                                            discountAmountItem:
                                                                0,
                                                            discountPercentageBillwise:
                                                                0,
                                                            discountPercentageItem:
                                                                0,
                                                            netTotal: 0,
                                                            offerAmountBillwise:
                                                                0,
                                                            offerAmountItem: 0,
                                                            offerPercentageBillwise:
                                                                0,
                                                            offerPercentageItem:
                                                                0,
                                                            saleTotal: 0,
                                                            taxAmt: 0,
                                                            taxPercentage:
                                                                taxPercentage,
                                                            isTaxInclusive:
                                                                productDetails.isTaxInclusive,
                                                            //
                                                            taxScheme: taxArray,
                                                            productId: productDetails.productId!.toString(),
                                                            unitName: productDetails.productRates![index].unit!,
                                                            unitId: productDetails.productRates![index].unitId!.toString(),
                                                            unitPriceLinkingId: productDetails.productRates![index].id!,
                                                            listBundles: []));
                                                    print("____f3");
                                                    widget
                                                        .statePageMaincontroller
                                                        .doCalculationForSelectedOrderFullItems();
                                                    print("____f5");
                                                  },
                                                  icon: const Icon(
                                                      Icons.add_shopping_cart),
                                                )
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                  child: FloatingActionButton
                                                      .small(
                                                    onPressed: () {
                                                      widget
                                                          .statePageMaincontroller
                                                          .orders[widget
                                                              .statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .isOrderUpdated = true;
                                                      var indexCart = statePageMaincontroller
                                                          .orders[statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .listCart!
                                                          .indexWhere((elementCheck1) =>
                                                              elementCheck1
                                                                  .unitPriceLinkingId ==
                                                              productDetails
                                                                  .productRates![
                                                                      index]
                                                                  .id!);

                                                      statePageMaincontroller
                                                          .descreaseQuantity(
                                                              indexCart);
                                                    },
                                                    child: const Text("-"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  statePageMaincontroller
                                                      .orders[
                                                          statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                      .listCart![statePageMaincontroller
                                                          .orders[statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .listCart!
                                                          .indexWhere(
                                                              (elementCheck1) =>
                                                                  elementCheck1
                                                                      .unitPriceLinkingId ==
                                                                  productDetails
                                                                      .productRates![
                                                                          index]
                                                                      .id!)]
                                                      .quantity
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                  child: FloatingActionButton
                                                      .small(
                                                    onPressed: () {
                                                      widget
                                                          .statePageMaincontroller
                                                          .orders[widget
                                                              .statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .isOrderUpdated = true;
                                                      var indexCart = statePageMaincontroller
                                                          .orders[statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .listCart!
                                                          .indexWhere((elementCheck1) =>
                                                              elementCheck1
                                                                  .unitPriceLinkingId ==
                                                              productDetails
                                                                  .productRates![
                                                                      index]
                                                                  .id!);

                                                      statePageMaincontroller
                                                          .addQuantity(
                                                              indexCart);
                                                    },
                                                    child: const Text("+"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                ),
                              ),
                              itemCount: productDetails.productRates!.length,
                            ),

                          if (productDetails.productBundles!.isNotEmpty)
                            ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, indexBundle) => Obx(
                                () => ListTile(
                                  title: productBundleAlternativeListTileText(
                                      indexBundle,
                                      productDetails,
                                      statePageMaincontroller),
                                  subtitle: productBundleAlternativeListTileQty(
                                      indexBundle,
                                      productDetails,
                                      statePageMaincontroller),
                                  leading: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(45),
                                        child: AykaCachedNetworkImage(
                                            imageUrl:
                                                productBundleAlternativeListTileLeadImage(
                                                    indexBundle,
                                                    productDetails,
                                                    statePageMaincontroller)),
                                      ),
                                    ),
                                  ),
                                  trailing: (productDetails
                                          .productBundles![indexBundle]
                                          .alternatives!
                                          .isEmpty)
                                      ? null
                                      : PopupMenuButton(
                                          child: Icon(Icons.swap_horiz),
                                          onSelected: (valueUnitLinkingId) {
                                            widget
                                                .statePageMaincontroller
                                                .orders[widget
                                                    .statePageMaincontroller
                                                    .currentOrderIndex
                                                    .value]
                                                .isOrderUpdated = true;

                                            widget.statePageMaincontroller
                                                .logOrders();

                                            int cartIndex = statePageMaincontroller
                                                .orders[statePageMaincontroller
                                                    .currentOrderIndex.value]
                                                .listCart!
                                                .indexWhere((elementCheck1) =>
                                                    elementCheck1
                                                        .unitPriceLinkingId ==
                                                    productDetails
                                                        .productRates![0].id!);

                                            if (productDetails.productBundles!
                                                    .isNotEmpty &&
                                                cartIndex == -1) {
                                              aykaOkToast(
                                                  "product_not_added_to_cart"
                                                      .tr);
                                              return;
                                            }

                                            int indexCartBundle =
                                                statePageMaincontroller
                                                    .orders[
                                                        statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                    .listCart![cartIndex]
                                                    .listBundles!
                                                    .indexWhere(
                                                        (elementCheck2) =>
                                                            elementCheck2
                                                                .bundleId ==
                                                            productDetails
                                                                .productBundles![
                                                                    indexBundle]
                                                                .id);
                                            print(
                                                "____ FAYIZ   cartIndex $cartIndex");
                                            print(
                                                "____ FAYIZ   indexCartBundle $indexCartBundle");
                                            if (indexCartBundle != -1) {
                                              // statePageMaincontroller
                                              //         .orders[
                                              //             statePageMaincontroller
                                              //                 .currentOrderIndex
                                              //                 .value]
                                              //         .listCart![cartIndex]
                                              //         .listBundles![indexCartBundle]
                                              //         .variantId =
                                              //     int.parse(valueVariantId!
                                              //         .toString());

                                              bool
                                                  isAlternativeSelectedDefaultItem =
                                                  false;

                                              int alternativeIndex = productDetails
                                                  .productBundles![indexBundle]
                                                  .alternatives!
                                                  .indexWhere(
                                                      (elementProductAlternative) =>
                                                          elementProductAlternative
                                                              .productunitlinkId ==
                                                          valueUnitLinkingId);

                                              if (alternativeIndex == -1) {
                                                isAlternativeSelectedDefaultItem =
                                                    true;
                                              }

                                              print(
                                                  "____ FAYIZ   alternativeIndex $alternativeIndex");
                                              print(
                                                  "____ FAYIZ   isAlternativeSelectedDefaultItem $isAlternativeSelectedDefaultItem");
                                              if (isAlternativeSelectedDefaultItem ==
                                                  true) {
                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .productId =
                                                    int.parse(productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .productId
                                                        .toString());

                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .productName =
                                                    productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .productName
                                                        .toString();

                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .variantName =
                                                    productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .variantName
                                                        .toString();
                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .productImage =
                                                    productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .productImage
                                                        .toString();
                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .qty =
                                                    double.parse(productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .unitQty
                                                        .toString());
                                              } else {
                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .productId =
                                                    int.parse(productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .alternatives![
                                                            alternativeIndex]
                                                        .productId
                                                        .toString());

                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .productName =
                                                    productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .alternatives![
                                                            alternativeIndex]
                                                        .productName
                                                        .toString();

                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .variantName =
                                                    productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .alternatives![
                                                            alternativeIndex]
                                                        .variantName
                                                        .toString();
                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .productImage =
                                                    productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .alternatives![
                                                            alternativeIndex]
                                                        .productImage
                                                        .toString();
                                                statePageMaincontroller
                                                        .orders[
                                                            statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                        .listCart![cartIndex]
                                                        .listBundles![
                                                            indexCartBundle]
                                                        .qty =
                                                    double.parse(productDetails
                                                        .productBundles![
                                                            indexBundle]
                                                        .alternatives![
                                                            alternativeIndex]
                                                        .unitQty
                                                        .toString());
                                              }
                                            } else {
                                              int indexProductAlternative =
                                                  productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives!
                                                      .indexWhere((elementAlt) =>
                                                          elementAlt
                                                              .productunitlinkId ==
                                                          valueUnitLinkingId);

                                              print(
                                                  "____ FAYIZ   indexProductAlternative $indexProductAlternative");

                                              if (indexProductAlternative !=
                                                  -1) {
                                                statePageMaincontroller
                                                    .orders[
                                                        statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                    .listCart![cartIndex]
                                                    .listBundles!
                                                    .add(ProductBundleCartModel(
                                                  bundleId: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .id,
                                                  productImage: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .productImage!,
                                                  productName: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .productName!,
                                                  variantName: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .variantName!,
                                                  productId: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .productId!,
                                                  productNameLocal: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .productNameLocal!,
                                                  printerIp: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .printerIp!,
                                                  variantId: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .unitId!,
                                                  qty: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .unitQty!,
                                                  printer: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .alternatives![
                                                          indexProductAlternative]
                                                      .printer!,
                                                ));
                                              } else {
                                                statePageMaincontroller
                                                    .orders[
                                                        statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                    .listCart![cartIndex]
                                                    .listBundles!
                                                    .add(ProductBundleCartModel(
                                                  bundleId: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .id,
                                                  productImage: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .productImage!,
                                                  productName: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .productName!,
                                                  variantName: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .variantName!,
                                                  productId: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .productId!,
                                                  variantId: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .unitId!,
                                                  printerIp: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .printerIp!,
                                                  productNameLocal:
                                                      productDetails
                                                          .productBundles![
                                                              indexBundle]
                                                          .productNameLocal!,
                                                  qty: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .unitQty!,
                                                  printer: productDetails
                                                      .productBundles![
                                                          indexBundle]
                                                      .printer!,
                                                ));
                                              }
                                            }

                                            statePageMaincontroller.orders
                                                .refresh();

                                            widget.statePageMaincontroller
                                                .logOrders();
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                                value: productDetails
                                                    .productBundles![
                                                        indexBundle]
                                                    .productunitlinkId,
                                                child: ListTile(
                                                  title: Text(
                                                      "${productDetails.productBundles![indexBundle].productName!} - ${productDetails.productBundles![indexBundle].variantName!}"),
                                                  subtitle: Text("qty".tr +
                                                      productDetails
                                                          .productBundles![
                                                              indexBundle]
                                                          .unitQty
                                                          .toString()),
                                                  leading: SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(45),
                                                        child: AykaCachedNetworkImage(
                                                            imageUrl: productDetails
                                                                .productBundles![
                                                                    indexBundle]
                                                                .productImage!),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            ...productDetails
                                                .productBundles![indexBundle]
                                                .alternatives!
                                                .map(
                                                  (elementAlternative) =>
                                                      PopupMenuItem(
                                                          value: elementAlternative
                                                              .productunitlinkId,
                                                          child: ListTile(
                                                            title: Text(
                                                                "${elementAlternative.productName!} - ${elementAlternative.variantName!}"),
                                                            subtitle: Text("qty"
                                                                    .tr +
                                                                elementAlternative
                                                                    .unitQty
                                                                    .toString()),
                                                            leading: SizedBox(
                                                              height: 50,
                                                              width: 50,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              45),
                                                                  child: AykaCachedNetworkImage(
                                                                      imageUrl:
                                                                          elementAlternative
                                                                              .productImage!),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                )
                                                .toList()
                                          ],
                                        ),
                                ),
                              ),
                              itemCount: productDetails.productBundles!.length,
                            ),
                          const SizedBox(
                            height: 15,
                          ),

                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     statePageMaincontroller
                          //         .orders[statePageMaincontroller
                          //             .currentOrderIndex.value]
                          //         .listCart!
                          //         .add(ProductCartModel.create(
                          //       productName: productDetails.productName!,
                          //       productImage: productDetails.productImage,
                          //       quantity: statePageMaincontroller
                          //           .currentQuantity.value,
                          //       rate: productDetails.productRates![0].rate!,
                          //       totalRate: statePageMaincontroller
                          //               .currentQuantity.value *
                          //           productDetails.productRates![0].rate!,
                          //       productId: productDetails.productId!.toString(),
                          //       unitName: productDetails.productRates![0].unit!,
                          //       rateBarcode:
                          //           productDetails.productRates![0].barcode!,
                          //     ));

                          //     Get.back();
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //       shape: const StadiumBorder()),
                          //   child: const Padding(
                          //     padding: EdgeInsets.symmetric(horizontal: 20),
                          //     child: Text('ADD ITEM'),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ));
          });
    }
  }

  Text productBundleAlternativeListTileText(
      int indexBundle,
      Product productDetails,
      ScreenMainOrderController statePageMaincontroller) {
    print("____productBundleAlternativeListTileText()    1");

    int cartIndex = statePageMaincontroller
        .orders[statePageMaincontroller.currentOrderIndex.value].listCart!
        .indexWhere((elementCheck1) =>
            elementCheck1.unitPriceLinkingId ==
            productDetails.productRates![0].id!);

    int indexCartBundle = -1;
    if (cartIndex != -1) {
      indexCartBundle = statePageMaincontroller
          .orders[statePageMaincontroller.currentOrderIndex.value]
          .listCart![cartIndex]
          .listBundles!
          .indexWhere((elementCheck2) =>
              elementCheck2.bundleId ==
              productDetails.productBundles![indexBundle].id);
    }
    if (productDetails.productBundles!.isEmpty ||
        cartIndex == -1 ||
        indexCartBundle == -1) {
      print("____productBundleAlternativeListTileText()    2");

      return Text(
          "${indexBundle + 1}- ${productDetails.productBundles![indexBundle].productName!} - ${productDetails.productBundles![indexBundle].variantName!}");
    } else {
      print("____productBundleAlternativeListTileText()    3");

      return Text(
          "${indexBundle + 1}- ${statePageMaincontroller.orders[statePageMaincontroller.currentOrderIndex.value].listCart![cartIndex].listBundles![indexCartBundle].productName} - ${statePageMaincontroller.orders[statePageMaincontroller.currentOrderIndex.value].listCart![cartIndex].listBundles![indexCartBundle].variantName}");
    }
  }

  Text productBundleAlternativeListTileQty(
      int indexBundle,
      Product productDetails,
      ScreenMainOrderController statePageMaincontroller) {
    int cartIndex = statePageMaincontroller
        .orders[statePageMaincontroller.currentOrderIndex.value].listCart!
        .indexWhere((elementCheck1) =>
            elementCheck1.unitPriceLinkingId ==
            productDetails.productRates![0].id!);

    int indexCartBundle = -1;
    if (cartIndex != -1) {
      indexCartBundle = statePageMaincontroller
          .orders[statePageMaincontroller.currentOrderIndex.value]
          .listCart![cartIndex]
          .listBundles!
          .indexWhere((elementCheck2) =>
              elementCheck2.bundleId ==
              productDetails.productBundles![indexBundle].id);
    }
    if (productDetails.productBundles!.isEmpty ||
        cartIndex == -1 ||
        indexCartBundle == -1) {
      return Text("qty".tr +
          productDetails.productBundles![indexBundle].unitQty.toString());
    } else {
      return Text("qty".tr +
          statePageMaincontroller
              .orders[statePageMaincontroller.currentOrderIndex.value]
              .listCart![cartIndex]
              .listBundles![indexCartBundle]
              .qty
              .toString());
    }
  }

  String productBundleAlternativeListTileLeadImage(
      int indexBundle,
      Product productDetails,
      ScreenMainOrderController statePageMaincontroller) {
    int cartIndex = statePageMaincontroller
        .orders[statePageMaincontroller.currentOrderIndex.value].listCart!
        .indexWhere((elementCheck1) =>
            elementCheck1.unitPriceLinkingId ==
            productDetails.productRates![0].id!);

    int indexCartBundle = -1;
    if (cartIndex != -1) {
      indexCartBundle = statePageMaincontroller
          .orders[statePageMaincontroller.currentOrderIndex.value]
          .listCart![cartIndex]
          .listBundles!
          .indexWhere((elementCheck2) =>
              elementCheck2.bundleId ==
              productDetails.productBundles![indexBundle].id);
    }
    if (productDetails.productBundles!.isEmpty ||
        cartIndex == -1 ||
        indexCartBundle == -1) {
      return productDetails.productBundles![indexBundle].productImage!;
    } else {
      return statePageMaincontroller
          .orders[statePageMaincontroller.currentOrderIndex.value]
          .listCart![cartIndex]
          .listBundles![indexCartBundle]
          .productImage!;
    }
  }


  void showDialogToSwitchOrders(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  14.0,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SizedBox(
                      width: 400,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text("Orders"),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: Obx(
                          () => ListView.builder(
                            itemBuilder: (context, index) {
                              var totalProce = 0.0;
                              List<String> images = <String>[];
                              for (var element in widget.statePageMaincontroller
                                  .orders[index].listCart!) {
                                totalProce = totalProce +
                                    element
                                        .netTotal!; //todo waiter nettotal check value here

                                if (images.length < 4) {
                                  images.add(element.productImage!);
                                }
                              }

                              return NeomorphicFirstWidget(
                                  widgetColor: (widget.statePageMaincontroller
                                              .currentOrderIndex.value ==
                                          index)
                                      ? Colors.grey[200]!
                                      : Colors.white,
                                  childWidget: ListTile(
                                    onTap: () {
                                      widget.statePageMaincontroller
                                          .currentOrderIndex.value = index;
                                      Get.back();
                                    },
                                    title: Text(
                                      "#${widget.statePageMaincontroller.orders[index].orderId!}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          DateFormat(TimeUtils()
                                                  .dateForOrdersListRestaurant)
                                              .format(DateTime
                                                  .fromMillisecondsSinceEpoch(widget
                                                      .statePageMaincontroller
                                                      .orders[widget
                                                          .statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value]
                                                      .createdAt!)),
                                          maxLines: 1,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            AykaGroupAvatars(aaa: images),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${widget.statePageMaincontroller.orders[index].listCart!.length} Items",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    trailing: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${AmountUtils().getDenomination()} $totalProce",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                            child: IconButton(
                                                onPressed: () {
                                                  widget.statePageMaincontroller
                                                      .removeOrder(index);
                                                },
                                                icon: const Icon(
                                                    Icons.delete_outlined)))
                                      ],
                                    ),
                                  ));
                            },
                            itemCount:
                                widget.statePageMaincontroller.orders.length,
                          ),
                        ))
                      ]))));
        });
  }

  Future<bool> showDialogTableSelect() async {
    List<String> chairIdsExistingForCheck = widget
        .statePageMaincontroller
        .orders[widget.statePageMaincontroller.currentOrderIndex.value]
        .chairIds!
        .toList();

    print("_____ chairIdsExistingForCheck  $chairIdsExistingForCheck");
    await widget.statePageMaincontroller.refreshTables();
    setState(() {});
    await Get.dialog(Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            14.0,
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            clickButton() async {
              await widget.statePageMaincontroller.refreshTables();
              setState(() {});
            }
            // clickButton();

            Widget tabledDialogExpansionTile(TableModel tableElement) {
              return Obx(
                () => Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        onPressed: (_) async {
                          final ScreenMainOrderCreateRepository
                              screenMyWorkNewWork =
                              ScreenMainOrderCreateRepository();
                          var data = ApiRequestTableFree.create(
                              tableId: int.parse(tableElement.tableId!));

                          final dartz.Either<String, String> resultOrException =
                              await screenMyWorkNewWork.freeTable(data);

                          resultOrException.fold((left) {
                            aykaOkToast(left);
                          }, (data) {
                            // Get.back();

                            int indexTable = widget
                                .statePageMaincontroller.tableChair
                                .indexWhere((element) =>
                                    element.tableId ==
                                    tableElement.tableId.toString());
                            if (indexTable != -1) {
                              widget.statePageMaincontroller
                                  .tableChair[indexTable].chairs!
                                  .forEach((elementChair) {
                                elementChair.isFree = true;
                                print("___done is free true");
                              });
                              widget.statePageMaincontroller.tableChair
                                  .refresh();
                              clickButton();
                              // setState(() {});
                            }

                            aykaOkToast("table free done");
                          });
                        },
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'free'.tr,
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: (tableElement.chairs!
                            .map((e) => e.chairId!)
                            .toSet()
                            .intersection(widget
                                .statePageMaincontroller
                                .orders[widget.statePageMaincontroller
                                    .currentOrderIndex.value]
                                .chairIds!
                                .toSet())
                            .isNotEmpty)
                        ? true
                        : false,
                    leading: Checkbox(
                        activeColor: (tableElement.chairs!
                                .map((e) => e.chairId!)
                                .toSet()
                                .intersection(widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .chairIds!
                                    .toSet())
                                .isNotEmpty)
                            ? Colors.blue
                            : Colors.red,
                        value: ((tableElement.chairs!
                                    .map((e) => e.chairId!)
                                    .toSet()
                                    .intersection(widget
                                        .statePageMaincontroller
                                        .orders[widget.statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .chairIds!
                                        .toSet())
                                    .isNotEmpty) ||
                                (tableElement.chairs!
                                    .map((e) => e.isFree!)
                                    .where((element) => element == false)
                                    .toSet()
                                    .isNotEmpty))
                            ? true
                            : false,
                        onChanged: (value) {
                          if (value == true) {
                            for (var element in tableElement.chairs!) {
                              if (!widget
                                  .statePageMaincontroller
                                  .orders[widget.statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .chairIds!
                                  .contains(element.chairId)) {
                                widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .chairIds!
                                    .add(element.chairId!);
                              }
                            }
                          } else {
                            for (var element in tableElement.chairs!) {
                              int indexChairs = widget
                                  .statePageMaincontroller
                                  .orders[widget.statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .chairIds!
                                  .indexWhere((elementChair) =>
                                      elementChair == element.chairId!);
                              if (indexChairs != -1) {
                                widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .chairIds!
                                    .removeAt(indexChairs);
                              }
                            }
                          }
                          widget.statePageMaincontroller.orders.assignAll(
                              [...widget.statePageMaincontroller.orders]);
                        }),
                    title: Text(
                      tableElement.name!,
                      style: TextStyle(
                          color: ((tableElement.chairs!
                                      .map((e) => e.isFree!)
                                      .where((element) => element == false)
                                      .isNotEmpty) &&
                                  (tableElement.chairs!
                                      .map((e) => e.chairId!)
                                      .toSet()
                                      .intersection(widget
                                          .statePageMaincontroller
                                          .orders[widget.statePageMaincontroller
                                              .currentOrderIndex.value]
                                          .chairIds!
                                          .toSet())
                                      .isEmpty))
                              ? Colors.red
                              : Colors.black),
                    ),
                    subtitle: Text(
                      widget.statePageMaincontroller
                          .getTableSelectDialogSubTitleString(tableElement),
                      style: TextStyle(color: Colors.grey),
                    ),
                    children: (tableElement.chairs?.map((e) => CheckboxListTile(
                              contentPadding: const EdgeInsets.only(left: 35),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: ((widget
                                      .statePageMaincontroller
                                      .orders[widget.statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .chairIds!
                                      .contains(e.chairId)))
                                  ? Colors.blue
                                  : Colors.red,
                              value: (widget
                                      .statePageMaincontroller
                                      .orders[widget.statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .chairIds!
                                      .contains(e.chairId) ||
                                  e.isFree == false),
                              onChanged: (childValue) {
                                print("____q  $childValue");

                                if (childValue == true) {
                                  if (e.isFree == false) {
                                    return;
                                  }

                                  if (!widget
                                      .statePageMaincontroller
                                      .orders[widget.statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .chairIds!
                                      .contains(e.chairId)) {
                                    widget
                                        .statePageMaincontroller
                                        .orders[widget.statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .chairIds!
                                        .add(e.chairId!);
                                  }
                                } else {
                                  print("____q.1");

                                  int indexChairs = widget
                                      .statePageMaincontroller
                                      .orders[widget.statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .chairIds!
                                      .indexWhere((elementChair) =>
                                          elementChair == e.chairId!);
                                  if (indexChairs != -1) {
                                    widget
                                        .statePageMaincontroller
                                        .orders[widget.statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .chairIds!
                                        .removeAt(indexChairs);

                                    int indexCheckIsFree =
                                        chairIdsExistingForCheck.indexWhere(
                                            (elementCheckIsFree) =>
                                                elementCheckIsFree ==
                                                e.chairId!);
                                    print("____q.5  $chairIdsExistingForCheck");
                                    print("____q.6  ${e.chairId!}");
                                    print("____q.7  $indexCheckIsFree");
                                    if (indexCheckIsFree != -1) {
                                      widget.statePageMaincontroller.tableChair
                                          .forEach((elementMainTable) {
                                        elementMainTable.chairs!
                                            .forEach((elementChairs) {
                                          if (elementChairs.chairId ==
                                              e.chairId) {
                                            e.isFree = true;
                                          }
                                        });
                                      });
                                      widget.statePageMaincontroller.tableChair
                                          .refresh();
                                    }
                                  }
                                }
                                widget
                                    .statePageMaincontroller
                                    .orders[widget.statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .isChairUpdated = true;
                                widget.statePageMaincontroller.orders.assignAll(
                                    [...widget.statePageMaincontroller.orders]);
                              },
                              title: Text(
                                e.name!,
                                style: TextStyle(
                                    color: (e.isFree == true ||
                                            ((widget
                                                .statePageMaincontroller
                                                .orders[widget
                                                    .statePageMaincontroller
                                                    .currentOrderIndex
                                                    .value]
                                                .chairIds!
                                                .contains(e.chairId))))
                                        ? Colors.black
                                        : Colors.red),
                              ),
                            )))!
                        .toList(),
                  ),
                ),
              );
            }

            Padding aaaaa() {
              return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child:SizedBox()

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) => Obx(
                  //     () => tabledDialogExpansionTile(index),
                  //   ),
                  //   itemCount: widget
                  //       .statePageMaincontroller.tableChair.length,
                  // ),
                  );
            }

            // clickButton();

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////
            return Padding(
                padding: const EdgeInsets.all(25),
                child: SizedBox(
                  width: 400,
                  child: Stack(children: [
                    Obx(
                      () => Align(
                        alignment: Alignment.topRight,
                        child: (widget.statePageMaincontroller
                                    .istableDialogRefreshProgressbar.value ==
                                true)
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              )
                            : IconButton(
                                onPressed: () async {
                                  clickButton();
                                },
                                icon: Icon(Icons.refresh)),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Obx(
                          () => Text(
                            "tables".tr +
                                widget.statePageMaincontroller
                                    .getTableSelectDialogTotalFreeChairString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.close))),
                    (widget.statePageMaincontroller.tableChair.length == 0)
                        ? Center(
                            child: Text("table_is_empty".tr),
                          )
                        : aaaaa(),
                  ]),
                ));
          },
        )));

    return true; //for finish status
  }

 





}
