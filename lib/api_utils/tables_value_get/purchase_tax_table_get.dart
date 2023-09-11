import 'package:get/get.dart';

class PurchaseTaxTable {
  String? taxMedthod(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "inc".tr;
        break;

      case 2:
        returnData = "exc".tr;
        break;

      case 3:
        returnData = "no_tax".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
