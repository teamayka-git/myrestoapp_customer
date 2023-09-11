import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/components/widget_screen_main_order_view.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_controller.dart';
import 'package:myresto_customer/main_global_controller.dart';

class ScreenMainOrderCreateTab extends StatefulWidget {
  const ScreenMainOrderCreateTab({super.key});

  @override
  State<ScreenMainOrderCreateTab> createState() =>
      _ScreenMainOrderCreateTabState();
}

class _ScreenMainOrderCreateTabState extends State<ScreenMainOrderCreateTab> {
  final _statePageMaincontroller = Get.put(ScreenMainOrderController());
  var _stateMainGlobalcontroller = Get.put(MainGlobalController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetScreenMainOrderView(
        _statePageMaincontroller, _stateMainGlobalcontroller);
    // return Row(
    //   children: [
    //     Expanded(
    //       flex: 3,
    //       child: WidgetScreenMainOrderView(_statePageMaincontroller),
    //     ),
    //     WidgetScreenMainOrderRightDrawer(
    //         statePageMaincontroller: _statePageMaincontroller),
    //   ],
    // );
  }
}
