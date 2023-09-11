import 'package:get/get.dart';

class SalesOrderGet {
  String? orderStatus(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "holding".tr;
        break;

      case 2:
        returnData = "placed".tr;
        break;

      case 3:
        returnData = "completed".tr;
        break;

      case 4:
        returnData = "cancelled".tr;
        break;

      case 5:
        returnData = "rejected".tr;
        break;

      case 6:
        returnData = "deliveryBoyAssigned".tr;
        break;

      case 7:
        returnData = "deliveryBoyPicked".tr;
        break;

      case 8:
        returnData = "delivered".tr;
        break;

      case 9:
        returnData = "customerRejected".tr;
        break;

      case 10:
        returnData = "customerCancelled".tr;
        break;

      case 11:
        returnData = "thirdPartyPickupCompleted".tr;
        break;

      case 12:
        returnData = "customerPickupCompleted".tr;
        break;

      case 13:
        returnData = "kitchenPreparing".tr;
        break;

      case 14:
        returnData = "kitchenCompleted".tr;
        break;

      case 15:
        returnData = "kitchenPacked".tr;
        break;

      case 16:
        returnData = "kitchenServed".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }

  String? paymentStatus(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "pending".tr;
        break;

      case 2:
        returnData = "billed".tr;
        break;

      case 3:
        returnData = "paid".tr;
        break;

      case 4:
        returnData = "processing".tr;
        break;
      case 5:
        returnData = "cancelled".tr;
        break;
      case 6:
        returnData = "partial".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }

  String? kotStatus(int value) {
    //todo give multilingual
    String returnData = "unknown_status_code".tr;

    switch (value) {
      case 1:
        returnData = "pending".tr;
        break;

      case 2:
        returnData = "preparing".tr;
        break;

      case 3:
        returnData = "cancelled".tr;
        break;

      case 4:
        returnData = "rejected".tr;
        break;
      case 5:
        returnData = "completed".tr;
        break;
      case 6:
        returnData = "ready".tr;
        break;
      case 7:
        returnData = "modifief".tr;
        break;
      case 8:
        returnData = "served".tr;
        break;

      default:
        returnData = "unknown".tr;
    }
    return returnData;
  }
}
