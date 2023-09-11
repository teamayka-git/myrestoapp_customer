import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myresto_customer/constants/get_storage_box.dart';
import 'package:myresto_customer/constants/get_storage_events.dart';
import 'package:myresto_customer/customer_portel/order_create_view/responsive/screen_main_order_tab.dart';
import 'package:myresto_customer/customer_portel/order_create_view/responsive/screen_main_order_windows.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_controller.dart';
import 'package:myresto_customer/screen_utils/responsive.dart';


class ScreenMainOrderCreate extends StatefulWidget {
  const ScreenMainOrderCreate({super.key});

  @override
  State<ScreenMainOrderCreate> createState() => _ScreenMainOrderCreateState();
}

class _ScreenMainOrderCreateState extends State<ScreenMainOrderCreate> {
  final _statePageMaincontroller = Get.put(ScreenMainOrderController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: const Responsive(
          mobile: ScreenMainOrderCreateTab(),
          tablet: ScreenMainOrderCreateTab(),
          desktop: ScreenMainOrderCreateWindows()),
    );
  }
}
