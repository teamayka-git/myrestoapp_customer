import 'package:get/get.dart';

class TablesStatusGet {
  String? statusMethod(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 0:
        returnData = "inactive".tr;
        break;

      case 1:
        returnData = "active".tr;
        break;

      case 2:
        returnData = "deleted".tr;
        break;
      default:
        returnData = "inactive".tr;
    }
    return returnData;
  }
}
