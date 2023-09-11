import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:myresto_customer/api_utils/ayka_ok_toast.dart';
import 'package:myresto_customer/api_utils/tables_value/payment_methord_value.dart';
import 'package:myresto_customer/api_utils/tables_value/sales_order_table_payment_status_value.dart';
import 'package:myresto_customer/api_utils/tables_value/user_table_role_value.dart';
import 'package:myresto_customer/api_utils/tables_value_get/sales_order_table_get.dart';
import 'package:myresto_customer/api_utils/tables_value_get/user_table_get.dart';
import 'package:myresto_customer/components/ayka_default_progressbar_widget.dart';
import 'package:myresto_customer/components/neomorphic_first_widget.dart';
import 'package:myresto_customer/constants/custom_colour.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/payment_methord_model.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_controller.dart';
import 'package:myresto_customer/main_global_controller.dart';
import 'package:myresto_customer/models/spinner_int_string.dart';
import 'package:myresto_customer/my_widgets/AykaAvatar/ayka_avatar.dart';
import 'package:myresto_customer/my_widgets/AykaCachedNetworkImage/ayka_cached_network_image.dart';
import 'package:myresto_customer/screen_utils/responsive.dart';

import 'package:myresto_customer/utils/amount_utils.dart';

class WidgetScreenMainOrderRightDrawer extends StatefulWidget {
  const WidgetScreenMainOrderRightDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetScreenMainOrderRightDrawer> createState() =>
      _WidgetScreenMainOrderRightDrawerState();
}

class _WidgetScreenMainOrderRightDrawerState
    extends State<WidgetScreenMainOrderRightDrawer> {
  final _statePageMaincontroller = Get.put(ScreenMainOrderController());
  var _stateMainGlobalcontroller = Get.put(MainGlobalController());
  // ScrollController _scrollController = new ScrollController(
  //   initialScrollOffset: 0.0,
  //   keepScrollOffset: true,
  // );

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Responsive.isDesktop(context)
        ? Expanded(flex: 1, child: mainWidget())
        : mainWidget());
  }

  LayoutBuilder mainWidget() {
    return LayoutBuilder(builder: (context, constrains) {
      return SingleChildScrollView(
        child: SizedBox(
          height: constrains.maxHeight,
          child: Container(
            color: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => ListTile(
                      title: Text(
                        _stateMainGlobalcontroller.userName.value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                      child: Obx(
                    () => ListView.builder(
                      itemBuilder: (context, index) => Obx(
                        () => NeomorphicFirstWidget(
                            childWidget: ListTile(
                          title: Row(
                            children: [
                              Text(
                                "${_statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].listCart![index].productName!} (${_statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].listCart![index].unitName!})",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                              Spacer(),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    _statePageMaincontroller
                                        .orders[_statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .isOrderUpdated = true;
                                    _statePageMaincontroller
                                        .orders[_statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .listCart!
                                        .removeAt(index);
                                  },
                                  icon: const Icon(
                                      Icons.delete_outline_outlined)),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_statePageMaincontroller
                                      .orders[_statePageMaincontroller
                                          .currentOrderIndex.value]
                                      .listCart![index]
                                      .kotNotes! !=
                                  "")
                                Text(_statePageMaincontroller
                                    .orders[_statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .listCart![index]
                                    .kotNotes!),
                              Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          width: 25,
                                          child: FloatingActionButton.small(
                                            onPressed: () {
                                              _statePageMaincontroller
                                                  .descreaseQuantity(index);
                                              //      widget
                                              //   ._statePageMaincontroller
                                              //   .orders
                                              //     .assignAll([
                                              //   ...  widget
                                              //   ._statePageMaincontroller
                                              //   .orders
                                              // ]);
                                            },
                                            child: const Text("-"),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          "${_statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].listCart![index].quantity!}",
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                          width: 25,
                                          child: FloatingActionButton.small(
                                            onPressed: () {
                                              _statePageMaincontroller
                                                  .addQuantity(index);

                                              //      widget
                                              //   ._statePageMaincontroller
                                              //   .orders
                                              //     .assignAll([
                                              //   ...  widget
                                              //   ._statePageMaincontroller
                                              //   .orders
                                              // ]);
                                            },
                                            child: const Text("+"),
                                          )),
                                    ],
                                  ),
                                  const Spacer(),
                                  // IconButton(
                                  //     onPressed: () {
                                  //       kotNotesUpdate(
                                  //           index, _statePageMaincontroller);
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.edit,
                                  //       size: 15,
                                  //     )),
                                  const Spacer(),
                                  Text(
                                    (_statePageMaincontroller
                                                .orders[_statePageMaincontroller
                                                    .currentOrderIndex.value]
                                                .listCart![index]
                                                .netTotal! ==
                                            -1)
                                        ? ""
                                        : "${AmountUtils().getRoundedAmountWithDenomination(amount: _statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].listCart![index].netTotal!)} ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                      ),
                      itemCount: _statePageMaincontroller
                          .orders[
                              _statePageMaincontroller.currentOrderIndex.value]
                          .listCart!
                          .length,
                    ),
                  )),
                  const Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("token".tr),
                            SizedBox(
                              height: 5,
                            ),
                            // if (_stateMainGlobalcontroller.userRole !=
                            //     UserTableRoleValue.waiter) ...{
                            //   Text("employee".tr),
                            //   SizedBox(
                            //     height: 5,
                            //   )
                            // },
                            Text("gross_amount".tr),
                            SizedBox(
                              height: 5,
                            ),
                            Text("tax".tr),
                            SizedBox(
                              height: 5,
                            ),
                            if (_statePageMaincontroller
                                        .currentOrderIndex.value !=
                                    -1 &&
                                _statePageMaincontroller
                                        .orders[_statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .discountAmt! !=
                                    0) ...{
                              Text("discount".tr),
                              SizedBox(
                                height: 5,
                              ),
                            },
                            if (_statePageMaincontroller
                                        .currentOrderIndex.value !=
                                    -1 &&
                                _statePageMaincontroller
                                        .orders[_statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .deliveryChargesAmt! !=
                                    0) ...{
                              Text("delivery_charge".tr),
                              SizedBox(
                                height: 5,
                              ),
                            },
                            Text("total".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                        Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "${(_statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].token == "-1") ? "new".tr : _statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].token!} ( ${_statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].listCart!.length} Items )"),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              // if (_stateMainGlobalcontroller.userRole !=
                              //     UserTableRoleValue.waiter) ...{
                              //   PopupMenuButton(
                              //     offset: const Offset(-0, 0),
                              //     onSelected: (value) {
                              //       _statePageMaincontroller
                              //           .orders[_statePageMaincontroller
                              //               .currentOrderIndex.value]
                              //           .isOrderUpdated = true;

                              //       int indexStaffList =
                              //           _statePageMaincontroller
                              //               .staffListDropDownItems
                              //               .indexWhere((elementStaff) =>
                              //                   elementStaff.id == value);
                              //       if (indexStaffList != -1) {
                              //         _statePageMaincontroller
                              //                 .orders[_statePageMaincontroller
                              //                     .currentOrderIndex.value]
                              //                 .createdStaffId =
                              //             int.parse(_statePageMaincontroller
                              //                 .staffListDropDownItems[
                              //                     indexStaffList]
                              //                 .id);

                              //         _statePageMaincontroller
                              //                 .orders[_statePageMaincontroller
                              //                     .currentOrderIndex.value]
                              //                 .createdStaffName =
                              //             _statePageMaincontroller
                              //                 .staffListDropDownItems[
                              //                     indexStaffList]
                              //                 .value;
                              //         _statePageMaincontroller.orders.refresh();
                              //       }
                              //       // List<CashierSalesOrderModel> mainList =
                              //       //     _statePageMaincontroller.getMainList();

                              //       // var indexOrder = mainList.indexWhere((element) =>
                              //       //     element.orderId ==
                              //       //     _statePageMaincontroller.selectedOrderId.value);
                              //       // switch (value) {
                              //       //   case "review_qr_code":
                              //       //     customerPrintOnClick(
                              //       //         mainListIndex: indexOrder,
                              //       //         isOpenDrawer: false,
                              //       //         showReviewQrcode: true,
                              //       //         showUPIQrcode: false);
                              //       //     break;
                              //       //   case "amount_qr_code":
                              //       //     customerPrintOnClick(
                              //       //         mainListIndex: indexOrder,
                              //       //         isOpenDrawer: false,
                              //       //         showReviewQrcode: false,
                              //       //         showUPIQrcode: true);
                              //       //     break;
                              //       //   case "amount_and_review_qr_code":
                              //       //     customerPrintOnClick(
                              //       //         mainListIndex: indexOrder,
                              //       //         isOpenDrawer: false,
                              //       //         showReviewQrcode: true,
                              //       //         showUPIQrcode: true);
                              //       //     break;
                              //       // }
                              //       // widget.statePageMaincontroller.selectCategoryOnClickEvent(
                              //       //     int.parse(value.toString()));
                              //     },
                              //     itemBuilder: (context) => [
                              //       ..._statePageMaincontroller
                              //           .staffListDropDownItems
                              //           .map((staffDetails) => PopupMenuItem(
                              //                 value: staffDetails.id,
                              //                 child: Text(staffDetails.value),
                              //               ))
                              //           .toList()
                              //     ],
                              //     child: Padding(
                              //       padding: const EdgeInsets.only(bottom: 5),
                              //       child: Obx(
                              //         () => Text(
                              //           _statePageMaincontroller
                              //               .orders[_statePageMaincontroller
                              //                   .currentOrderIndex.value]
                              //               .createdStaffName!,
                              //           style: TextStyle(color: Colors.blue),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // },
                              Text(
                                  "${AmountUtils().getRoundedAmountWithDenomination(amount: _statePageMaincontroller.orderGrossAmount(orderIndex: _statePageMaincontroller.currentOrderIndex.value))}"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "${AmountUtils().getRoundedAmountWithDenomination(amount: _statePageMaincontroller.orderTax(orderIndex: _statePageMaincontroller.currentOrderIndex.value))}"),
                              const SizedBox(
                                height: 5,
                              ),
                              if (_statePageMaincontroller
                                      .orderDiscountAmount() !=
                                  0) ...{
                                Text(
                                    "${AmountUtils().getRoundedAmountWithDenomination(amount: _statePageMaincontroller.orderDiscountAmount())}"),
                                SizedBox(
                                  height: 5,
                                ),
                              },
                              if (_statePageMaincontroller
                                      .orderDeliveryCharge() !=
                                  0) ...{
                                Text(
                                    "${AmountUtils().getRoundedAmountWithDenomination(amount: _statePageMaincontroller.orderDeliveryCharge())}"),
                                SizedBox(
                                  height: 5,
                                ),
                              },
                              Text(
                                "${AmountUtils().getRoundedAmountWithDenomination(amount: _statePageMaincontroller.orderNetAmount(orderIndex: _statePageMaincontroller.currentOrderIndex.value))}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                  /* 
                   if (UserRolePermissionUtils().isPermissionAllowed(
                            permissionMainCheckList: [
                              UserRolePermissionItems.cashier
                            ],
                            isShowToast: false) &&
                        _stateMainGlobalcontroller
                            .isShowCashierShift.value) ...{
                      const Divider(),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              "" "payment_method".tr,
                              maxLines: 1,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (_statePageMaincontroller
                                    .orders[_statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .paymentStatus !=
                                SalesOrderTablePaymentStatusValue.pending)
                              Text(
                                "( ${SalesOrderGet().paymentStatus(_statePageMaincontroller.orders[_statePageMaincontroller.currentOrderIndex.value].paymentStatus!)} )",
                                style: const TextStyle(color: Colors.grey),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      (_statePageMaincontroller.shiftData.value.shiftId == -1)
                          ? Center(
                              child: Text("shift_is_closed".tr),
                            )
                          : (_statePageMaincontroller
                                  .orders[_statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .listPaymentMethords!
                                  .isNotEmpty)
                              ? Obx(
                                  () => InkWell(
                                    onTap: () {
                                      showDialogSplitPayments(context);
                                    },
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_statePageMaincontroller
                                                  .orders[
                                                      _statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value]
                                                  .listPaymentMethords!
                                                  .indexWhere(
                                                      (elementPaymentMethod) =>
                                                          elementPaymentMethod
                                                              .type ==
                                                          PaymentMethordValue
                                                              .card) !=
                                              -1) ...{
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        "assets/images/order_create_right_drawer_icons/card_icon.png"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  _statePageMaincontroller
                                                      .orders[_statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value]
                                                      .listPaymentMethords![_statePageMaincontroller
                                                          .orders[_statePageMaincontroller
                                                              .currentOrderIndex
                                                              .value]
                                                          .listPaymentMethords!
                                                          .indexWhere((elementPaymentMethod) =>
                                                              elementPaymentMethod
                                                                  .type ==
                                                              PaymentMethordValue
                                                                  .card)]
                                                      .cash
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[500]),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          },
                                          if (_statePageMaincontroller
                                                  .orders[
                                                      _statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value]
                                                  .listPaymentMethords!
                                                  .indexWhere(
                                                      (elementPaymentMethod) =>
                                                          elementPaymentMethod
                                                              .type ==
                                                          PaymentMethordValue
                                                              .cash) !=
                                              -1) ...{
                                            Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Image.asset(
                                                          "assets/images/order_create_right_drawer_icons/cash_icon.png"),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    _statePageMaincontroller
                                                        .orders[_statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                        .listPaymentMethords![_statePageMaincontroller
                                                            .orders[_statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                            .listPaymentMethords!
                                                            .indexWhere((elementPaymentMethod) =>
                                                                elementPaymentMethod
                                                                    .type ==
                                                                PaymentMethordValue
                                                                    .cash)]
                                                        .cash
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[500]),
                                                  )
                                                ]),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          },
                                          if (_statePageMaincontroller
                                                  .orders[
                                                      _statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value]
                                                  .listPaymentMethords!
                                                  .indexWhere(
                                                      (elementPaymentMethod) =>
                                                          elementPaymentMethod
                                                              .type ==
                                                          PaymentMethordValue
                                                              .upi) !=
                                              -1) ...{
                                            Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Image.asset(
                                                          "assets/images/order_create_right_drawer_icons/ewallet_icon.png"),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    _statePageMaincontroller
                                                        .orders[_statePageMaincontroller
                                                            .currentOrderIndex
                                                            .value]
                                                        .listPaymentMethords![_statePageMaincontroller
                                                            .orders[_statePageMaincontroller
                                                                .currentOrderIndex
                                                                .value]
                                                            .listPaymentMethords!
                                                            .indexWhere((elementPaymentMethod) =>
                                                                elementPaymentMethod
                                                                    .type ==
                                                                PaymentMethordValue
                                                                    .upi)]
                                                        .cash
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[500]),
                                                  )
                                                ])
                                          },
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        showDialogSplitPayments(context);
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0))),
                                      ),
                                      child: Text("add_payment".tr),
                                    ),
                                  ),
                                )
                    },*/

                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 10),
                      child: TextFormField(
                        // textInputAction: TextInputAction.done,

                        controller: _statePageMaincontroller
                            .orders[_statePageMaincontroller
                                .currentOrderIndex.value]
                            .descriptionTextedittingController,
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                            labelText: "remarks".tr,
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: CustomColors().masterHintTextColor,
                                height: 1.75,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.02),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColors().masterBordersideColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
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
                                    Radius.circular(10.0)))),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (Responsive.isMobile(context))
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_statePageMaincontroller
                                        .orders[_statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .orderId! !=
                                    (-1).toString())
                                  SizedBox(
                                      width: double.infinity,
                                      child: dropdownButtonOrderStatus()),
                                SizedBox(
                                    width: double.infinity,
                                    child: orderCreateEditButton()),
                              ],
                            )
                          : Row(
                              children: [
                                if (_statePageMaincontroller
                                        .orders[_statePageMaincontroller
                                            .currentOrderIndex.value]
                                        .orderId! !=
                                    (-1).toString())
                                  Expanded(child: dropdownButtonOrderStatus()),
                                Expanded(child: orderCreateEditButton()),
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget orderCreateEditButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors().mainNavigationRailIndicatiorColor),
        onPressed: (_statePageMaincontroller
                    .orders[_statePageMaincontroller.currentOrderIndex.value]
                    .isOrderCreateProgressBarVisibile ==
                true)
            ? null
            : () {
                _statePageMaincontroller.createOrder(
                    _statePageMaincontroller.currentOrderIndex.value, context);

                // (_statePageMaincontroller
                //             .orders[_statePageMaincontroller
                //                 .currentOrderIndex.value]
                //             .orderId ==
                //         (-1).toString())
                //     ? _statePageMaincontroller.createOrder(
                //         _statePageMaincontroller.currentOrderIndex.value,
                //         context)
                //     : _statePageMaincontroller.editOrder(
                //         _statePageMaincontroller.currentOrderIndex.value,
                //         context);
              },
        child: (_statePageMaincontroller
                    .orders[_statePageMaincontroller.currentOrderIndex.value]
                    .isOrderCreateProgressBarVisibile ==
                false)
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  (_statePageMaincontroller
                              .orders[_statePageMaincontroller
                                  .currentOrderIndex.value]
                              .orderId ==
                          (-1).toString())
                      ? "create_order".tr
                      : "edit_order".tr,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                ),
              )
            : const AykaDefaultProgressbarWidget(
                size: 20,
                color: Colors.white,
              ));
  }

  Widget dropdownButtonOrderStatus() {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: DropdownButton<int>(
        value: _statePageMaincontroller
            .orders[_statePageMaincontroller.currentOrderIndex.value]
            .orderStatus,
        underline: const SizedBox(),
        isExpanded: true,
        hint: const Text("Select Status", style: TextStyle(color: Colors.grey)),
        items: _statePageMaincontroller
            .arrayReturnForOrderStatus()
            .map((SpinnerIntString value) {
          return DropdownMenuItem<int>(
            value: value.id,
            child: Text(value.value),
          );
        }).toList(),
        onChanged: (newValue) {
          final index1 = _statePageMaincontroller
              .arrayReturnForOrderStatus()
              .indexWhere((element) => element.id == newValue);

          _statePageMaincontroller
                  .orders[_statePageMaincontroller.currentOrderIndex.value]
                  .orderStatus =
              _statePageMaincontroller.arrayReturnForOrderStatus()[index1].id;
          _statePageMaincontroller.orders
              .assignAll([..._statePageMaincontroller.orders]);
        },
      ),
    );
  }

  void showDialogSplitPayments(BuildContext context) async {
    var cashTextController = TextEditingController().obs;
    var cashDescriptionTextController = TextEditingController();

    var cardTextController = TextEditingController().obs;
    var cardDescriptionTextController = TextEditingController();

    var upiTextController = TextEditingController().obs;
    var upiDescriptionTextController = TextEditingController();
    var tenderCashTextController = TextEditingController().obs;

    var cashIndex = _statePageMaincontroller
        .orders[_statePageMaincontroller.currentOrderIndex.value]
        .listPaymentMethords!
        .indexWhere((elementPaymentMethod) =>
            elementPaymentMethod.type == PaymentMethordValue.cash);
    if (cashIndex != -1) {
      cashTextController.value.text = _statePageMaincontroller
          .orders[_statePageMaincontroller.currentOrderIndex.value]
          .listPaymentMethords![cashIndex]
          .cash
          .toString();
      cashDescriptionTextController.text = _statePageMaincontroller
          .orders[_statePageMaincontroller.currentOrderIndex.value]
          .listPaymentMethords![cashIndex]
          .description
          .toString();
    }
    var cardIndex = _statePageMaincontroller
        .orders[_statePageMaincontroller.currentOrderIndex.value]
        .listPaymentMethords!
        .indexWhere((elementPaymentMethod) =>
            elementPaymentMethod.type == PaymentMethordValue.card);
    if (cardIndex != -1) {
      cardTextController.value.text = _statePageMaincontroller
          .orders[_statePageMaincontroller.currentOrderIndex.value]
          .listPaymentMethords![cardIndex]
          .cash
          .toString();
      cardDescriptionTextController.text = _statePageMaincontroller
          .orders[_statePageMaincontroller.currentOrderIndex.value]
          .listPaymentMethords![cardIndex]
          .description
          .toString();
    }
    var upiIndex = _statePageMaincontroller
        .orders[_statePageMaincontroller.currentOrderIndex.value]
        .listPaymentMethords!
        .indexWhere((elementPaymentMethod) =>
            elementPaymentMethod.type == PaymentMethordValue.upi);
    if (upiIndex != -1) {
      upiTextController.value.text = _statePageMaincontroller
          .orders[_statePageMaincontroller.currentOrderIndex.value]
          .listPaymentMethords![upiIndex]
          .cash
          .toString();
      upiDescriptionTextController.text = _statePageMaincontroller
          .orders[_statePageMaincontroller.currentOrderIndex.value]
          .listPaymentMethords![upiIndex]
          .description
          .toString();
    }

    RxInt statusOrderTemp = _statePageMaincontroller
        .orders[_statePageMaincontroller.currentOrderIndex.value]
        .paymentStatus!
        .obs;

    List<SpinnerIntString> statusDropDownItems = <SpinnerIntString>[];

    statusDropDownItems.add(SpinnerIntString(
        id: SalesOrderTablePaymentStatusValue.pending,
        value: SalesOrderGet()
            .paymentStatus(SalesOrderTablePaymentStatusValue.pending)!));
    statusDropDownItems.add(SpinnerIntString(
        id: SalesOrderTablePaymentStatusValue.billed,
        value: SalesOrderGet()
            .paymentStatus(SalesOrderTablePaymentStatusValue.billed)!));
    statusDropDownItems.add(SpinnerIntString(
        id: SalesOrderTablePaymentStatusValue.paid,
        value: SalesOrderGet()
            .paymentStatus(SalesOrderTablePaymentStatusValue.paid)!));
    statusDropDownItems.add(SpinnerIntString(
        id: SalesOrderTablePaymentStatusValue.processing,
        value: SalesOrderGet()
            .paymentStatus(SalesOrderTablePaymentStatusValue.processing)!));
    statusDropDownItems.add(SpinnerIntString(
        id: SalesOrderTablePaymentStatusValue.cancelled,
        value: SalesOrderGet()
            .paymentStatus(SalesOrderTablePaymentStatusValue.cancelled)!));

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
                        physics: const ScrollPhysics(),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text("payment_method".tr),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "${"total".tr}: ",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      children: [
                                        TextSpan(
                                          text: _statePageMaincontroller
                                              .orderGrossAmount(
                                                  orderIndex:
                                                      _statePageMaincontroller
                                                          .currentOrderIndex
                                                          .value)
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "${"remining".tr}: ",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      children: [
                                        TextSpan(
                                          text: getReminingAmount(
                                                  cashTextController.value,
                                                  cardTextController.value,
                                                  upiTextController.value,
                                                  _statePageMaincontroller
                                                      .orderGrossAmount(
                                                          orderIndex:
                                                              _statePageMaincontroller
                                                                  .currentOrderIndex
                                                                  .value))
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[50],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 40, child: Text("Cash")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        onChanged: (value) {
                                          cashTextController.refresh();
                                        },
                                        controller: cashTextController.value,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[150],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        textInputAction: TextInputAction.next,
                                        controller:
                                            cashDescriptionTextController,
                                        decoration: InputDecoration(
                                          hintText: "Description",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[150],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[50],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 40, child: Text("Card")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        onChanged: (value) {
                                          cardTextController.refresh();
                                        },
                                        controller: cardTextController.value,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[150],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        controller:
                                            cardDescriptionTextController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          hintText: "Description",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[150],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[50],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 40, child: Text("UPI")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        onChanged: (value) {
                                          upiTextController.refresh();
                                        },
                                        controller: upiTextController.value,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[150],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        controller:
                                            upiDescriptionTextController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          hintText: "Description",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[150],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("paymentStatus".tr),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => DropdownButton<int>(
                              value: statusOrderTemp.value,
                              underline: const SizedBox(),
                              hint: const Text("Select Status",
                                  style: TextStyle(color: Colors.grey)),
                              items: statusDropDownItems
                                  .map((SpinnerIntString value) {
                                return DropdownMenuItem<int>(
                                  value: value.id,
                                  child: Text(value.value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                final index1 = statusDropDownItems.indexWhere(
                                    (element) => element.id == newValue);
                                statusOrderTemp.value =
                                    statusDropDownItems[index1].id;

                                // widget
                                //         ._statePageMaincontroller
                                //         .orders[widget
                                //             ._statePageMaincontroller
                                //             .currentOrderIndex
                                //             .value]
                                //         .orderStatus =
                                //    _statePageMaincontroller
                                //         .statusDropDownItems[index1].id;
                                //_statePageMaincontroller.orders
                                //     .assignAll([
                                //   ...widget
                                //       ._statePageMaincontroller.orders
                                // ]);
                              },
                            ),
                          ),
                          Obx(
                            () => Row(
                              children: [
                                Text("tender_cash".tr),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    // width: double.infinity,
                                    height: 35,
                                    child: TextField(
                                      onChanged: (value) {
                                        tenderCashTextController.refresh();
                                      },
                                      keyboardType: TextInputType.number,
                                      controller:
                                          tenderCashTextController.value,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey[150],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                        child: (getTenderCash(
                                                    tenderCashTextController
                                                        .value,
                                                    getReminingAmount(
                                                        cashTextController
                                                            .value,
                                                        cardTextController
                                                            .value,
                                                        upiTextController.value,
                                                        _statePageMaincontroller
                                                            .orderGrossAmount(
                                                                orderIndex: _statePageMaincontroller
                                                                    .currentOrderIndex
                                                                    .value))) !=
                                                "")
                                            ? Text(
                                                "${"rem".tr} : ${getTenderCash(tenderCashTextController.value, getReminingAmount(cashTextController.value, cardTextController.value, upiTextController.value, _statePageMaincontroller.orderGrossAmount(orderIndex: _statePageMaincontroller.currentOrderIndex.value)))}")
                                            : const SizedBox()))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _statePageMaincontroller
                                  .orders[_statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .listPaymentMethords!
                                  .clear();

                              if (cashTextController.value.text.trim() != "" &&
                                  double.parse(cashTextController.value.text
                                          .trim()) !=
                                      0) {
                                _statePageMaincontroller
                                    .orders[_statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .listPaymentMethords!
                                    .add(PaymentMethordModel(
                                        type: PaymentMethordValue.cash,
                                        cash: double.parse(cashTextController
                                            .value.text
                                            .trim()),
                                        description:
                                            cashDescriptionTextController
                                                .text));
                              }

                              if (cardTextController.value.text.trim() != "" &&
                                  double.parse(cardTextController.value.text
                                          .trim()) !=
                                      0) {
                                _statePageMaincontroller
                                    .orders[_statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .listPaymentMethords!
                                    .add(PaymentMethordModel(
                                        type: PaymentMethordValue.card,
                                        cash: double.parse(cardTextController
                                            .value.text
                                            .trim()),
                                        description:
                                            cardDescriptionTextController
                                                .text));
                              }

                              if (upiTextController.value.text.trim() != "" &&
                                  double.parse(upiTextController.value.text
                                          .trim()) !=
                                      0) {
                                _statePageMaincontroller
                                    .orders[_statePageMaincontroller
                                        .currentOrderIndex.value]
                                    .listPaymentMethords!
                                    .add(PaymentMethordModel(
                                        type: PaymentMethordValue.upi,
                                        cash: double.parse(upiTextController
                                            .value.text
                                            .trim()),
                                        description:
                                            upiDescriptionTextController.text));
                              }

                              _statePageMaincontroller
                                  .orders[_statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .paymentStatus = statusOrderTemp.value;

                              _statePageMaincontroller.orders.assignAll(
                                  [..._statePageMaincontroller.orders]);
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text('Submit'),
                            ),
                          )
                        ]),
                      ))));
        });
  }

  double getReminingAmount(
      TextEditingController cashTextController,
      TextEditingController cardTextController,
      TextEditingController upiTextController,
      double totalAmount) {
    double cashAmount = 0.0;
    double cardAmount = 0.0;
    double upiAmount = 0.0;

    if (cashTextController.value.text.trim() != "") {
      cashAmount = double.parse(cashTextController.value.text.trim());
    }
    if (cardTextController.value.text.trim() != "") {
      cardAmount = double.parse(cardTextController.value.text.trim());
    }
    if (upiTextController.value.text.trim() != "") {
      upiAmount = double.parse(upiTextController.value.text.trim());
    }

    double reminingAmount = totalAmount - (cashAmount + cardAmount + upiAmount);

    return reminingAmount;
  }

  String getTenderCash(
      TextEditingController tenderCashController, double totalBalance) {
    if (tenderCashController.text.trim() == "") {
      return "";
    } else {
      double tenderCash = double.parse(tenderCashController.text.trim());

      return (totalBalance - tenderCash).toString();
    }
  }

  void showAlertDialogOrderCreate(int value, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("printer_not_configured".tr),
          content: Text("do_you_want_to_continue".tr),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("close".tr)),
            TextButton(
                onPressed: () {
                  Get.back();
                  _statePageMaincontroller.createOrder(
                      _statePageMaincontroller.currentOrderIndex.value,
                      context);
                },
                child: Text("ok".tr)),
          ],
        );
      },
    );
  }

  void kotNotesUpdate(
      int index, ScreenMainOrderController statePageMaincontroller) async {
    var textController = TextEditingController(
        text: statePageMaincontroller
            .orders[statePageMaincontroller.currentOrderIndex.value]
            .listCart![index]
            .kotNotes!);
    var textControllerRate = TextEditingController(
        text: statePageMaincontroller
            .orders[statePageMaincontroller.currentOrderIndex.value]
            .listCart![index]
            .rate!
            .toString());

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "kot_notes".tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: textController,
                          decoration: InputDecoration(
                              labelText: "notes".tr,
                              labelStyle: TextStyle(color: Colors.grey[500]!),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                        if (_stateMainGlobalcontroller
                            .isSaleRateEditable.value) ...{
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                            ],
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            controller: textControllerRate,
                            decoration: InputDecoration(
                                labelText: "rate".tr,
                                labelStyle: TextStyle(color: Colors.grey[500]!),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300]!),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.0),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                          )
                        },
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_stateMainGlobalcontroller
                                  .isSaleRateEditable.value) {
                                if (textControllerRate.text.trim() != "") {
                                  statePageMaincontroller
                                          .orders[statePageMaincontroller
                                              .currentOrderIndex.value]
                                          .listCart![index]
                                          .rate =
                                      double.parse(
                                          textControllerRate.text.trim());
                                  statePageMaincontroller
                                      .doCalculationForSelectedOrderFullItems();
                                } else {
                                  aykaOkToast("rate_is_empty".tr);
                                  return;
                                }
                              }

                              _statePageMaincontroller
                                  .orders[_statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .isOrderUpdated = true;

                              statePageMaincontroller
                                  .orders[statePageMaincontroller
                                      .currentOrderIndex.value]
                                  .listCart![index]
                                  .kotNotes = textController.text.trim();

                              statePageMaincontroller.orders.refresh();
                              Get.back();
                            },
                            child: Text('submit'.tr),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
