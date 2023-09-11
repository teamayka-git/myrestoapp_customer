import 'package:get/get.dart';

class TableChairStatusGet {
  String? chairStatusMethod(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "inactive".tr;
        break;

      case 2:
        returnData = "active".tr;
        break;

      case 3:
        returnData = "deleted".tr;
        break;
      case 4:
        returnData = "booke".tr;
        break;
      case 5:
        returnData = "available".tr;
        break;
      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
