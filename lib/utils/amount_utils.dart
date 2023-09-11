import 'package:get/get.dart';
import 'package:myresto_customer/main_global_controller.dart';

class AmountUtils {
  String getRoundedAmount({required double amount}) {
    var stateMainGlobalcontroller = Get.put(MainGlobalController());
    return amount
        .toStringAsFixed(stateMainGlobalcontroller.amountRoundOff.value);
  }

  String getRoundedAmountWithDenomination({required double amount}) {
    var stateMainGlobalcontroller = Get.put(MainGlobalController());
    return "${stateMainGlobalcontroller.amountDinominaion.value} ${amount.toStringAsFixed(stateMainGlobalcontroller.amountRoundOff.value)}";
  }

  String getDenomination() {
    var stateMainGlobalcontroller = Get.put(MainGlobalController());
    return stateMainGlobalcontroller.amountDinominaion.value;
  }
}
