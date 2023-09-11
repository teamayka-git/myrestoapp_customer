import 'package:get/get.dart';

class UserTableGet {
  String? userRole(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "admin".tr;
        break;

      case 2:
        returnData = "waiter".tr;
        break;

      case 3:
        returnData = "cashier".tr;
        break;

      case 4:
        returnData = "driver".tr;
        break;

      case 5:
        returnData = "kitchen".tr;
        break;

      case 6:
        returnData = "delivery_counter".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
