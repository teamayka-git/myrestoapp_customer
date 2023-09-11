import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/components/widget_screen_main_order_right_drawer.dart';
import 'package:myresto_customer/customer_portel/order_create_view/components/widget_screen_main_order_view.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_controller.dart';
import 'package:myresto_customer/main_global_controller.dart';

class ScreenMainOrderCreateWindows extends StatefulWidget {
  const ScreenMainOrderCreateWindows({super.key});

  @override
  State<ScreenMainOrderCreateWindows> createState() =>
      _ScreenMainOrderCreateWindowsState();
}

class _ScreenMainOrderCreateWindowsState
    extends State<ScreenMainOrderCreateWindows> {
  final _statePageMaincontroller = Get.put(ScreenMainOrderController());
  var _stateMainGlobalcontroller = Get.put(MainGlobalController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            flex: 3,
            child: WidgetScreenMainOrderView(
                _statePageMaincontroller, _stateMainGlobalcontroller),
          ),
          if (_statePageMaincontroller.isShowRightWidget.value)
            const WidgetScreenMainOrderRightDrawer(),
        ],
      ),
    );
  }
}
