import 'package:get/get.dart';

class SalesTypeTableGet {
  String? salesType(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "table_selection".tr;
        break;

      case 2:
        returnData = "customer_data".tr;
        break;

      case 3:
        returnData = "delivery_boy".tr;
        break;

      case 4:
        returnData = "online_order".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
//TableSelection 2: Customer Data 3:Delivery Boy   4: Online Order
