import 'package:get/get.dart';
import 'package:myresto_customer/api_utils/tables_value/kot_print_action_status.dart';


class KotPrintStatusActionGet {
  String? getActionString(int value) {
    //todo give multilingual
    String returnData = "---";

    switch (value) {
      case KotPrintActionStatus.nilItem:
        returnData = "-";
        break;
      case KotPrintActionStatus.newItem:
        returnData = "New";
        break;
      case KotPrintActionStatus.modifiedItem:
        returnData = "modify";
        break;
      case KotPrintActionStatus.cancelledItem:
        returnData = "cancel";
        break;
    }
    return returnData;
  }
}
