import 'package:get/get.dart';

class GetxUtils {
  bool getxCanPopWithNavigatorId(int id) {
    if (Get.keys[id] == null || Get.keys[id]!.currentState == null) {
      return false;
    }
    return Get.keys[id]!.currentState!.canPop();
  }
}
