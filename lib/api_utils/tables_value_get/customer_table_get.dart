import 'package:get/get.dart';

class CutomerTableGet {
  String? customerMedthod(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "cash".tr;
        break;

      case 2:
        returnData = "credit".tr;
        break;

      case 3:
        returnData = "online".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
