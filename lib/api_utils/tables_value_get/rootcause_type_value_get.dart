import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RootCauseValueGet {
  String? rootCaseValue(int value) {
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = 'sales_return'.tr;
        break;

      case 2:
        returnData = 'sales_cancel'.tr;
        break;

      case 3:
        returnData = 'purchase_return'.tr;
        break;

      case 4:
        returnData = 'purchase_cancel'.tr;
        break;

      case 5:
        returnData = 'stock_adjestment'.tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
