import 'package:get/get.dart';

class MainGlobalController extends GetxController {
  RxBool isInitApiCallProgressbarShowing = true.obs;
  RxBool mastersSidebarShowing = true.obs;

  RxList<String> permissionCodes = <String>[].obs;
  var userName = "Customer".obs;
  var userRole = 0.obs;
  var userId = 0.obs;
  var userimage =
      "https://s3-media0.fl.yelpcdn.com/bphoto/LfJECJ31MXixzHH3iMCD1A/348s.jpg"
          .obs;

  var appVersion = 0.obs;
  var appAndroidUrl = "".obs;
  var appIosUrl = "".obs;
  var appWindowsUrl = "".obs;

  RxBool isShowCashierShift = true.obs;
  RxBool isShowOnScreenKeyboard = true.obs;
  RxBool isAutoCustomerPrintWaiterCompleteOrder = true.obs;
  RxBool waiterMultipleOrderHold = false.obs;
  RxBool isAutoDrawerOpenCashierCompleteOrder = true.obs;
  RxBool isEnableTaxCalculation = true.obs;
  RxBool isAllowWaiterUpdateKotStatus = false.obs;
  var cordinatorPrintIp = "".obs;
  var initialRoute = "/".obs;
  var amountRoundOff = 2.obs;
  var amountDinominaion = "SAR".obs;
  var companyName = "Family restaurant".obs;
  var companyPlace = "Calicut".obs;
  var companyVatString = "".obs;
  var companyPhone = "".obs;
  var printFooterSmall = "".obs;
  var printFooterBig = "".obs;

  var companyAddress = "address".obs;
  var companyCaption = "caption".obs;

  RxBool allowCreditCashierview = true.obs;
  RxBool isSaleRateEditable = true.obs;

  RxBool isPrintToWindowsApp = true.obs;
  var windowsUdpIp = "".obs;
  var windowsUdpPort = "".obs;
}
