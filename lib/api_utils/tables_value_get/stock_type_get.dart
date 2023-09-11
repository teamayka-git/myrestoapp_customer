import 'package:get/get.dart';

class StockTypeGet {
  String? stockType(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "stock_opening".tr;
        break;

      // case 2:
      //   returnData = "stock_transfer".tr;
      //   break;

      case 3:
        returnData = "stock_adjustment".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
