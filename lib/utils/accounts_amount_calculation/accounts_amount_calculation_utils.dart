import 'package:myresto_customer/utils/accounts_amount_calculation/accounts_amount_calculation_bill_item_ratetotal_tax_net_model.dart';

class AccountsAmountCalculationUtils {
  AccountsAmountCalculationBillItemRatetotalTaxNetModel
      getBillItem_saleTotal_taxAmt_netAmt({
    required bool isEnableTaxCalculation,
    required bool isInclusive,
    required bool isEnableBillSplit,
    required double rate,
    required double qty,
    required double discAmountItem,
    // required double discPercentageItem,
    required double discAmountBillWise,
    // required double discPercentageBillWise,
    required double offerAmountItem,
    // required double offerPercentageItem,
    required double offerAmountBillWise,
    // required double offerPercentageBillWise,
    required double taxPercentage,
    required double totalTaxPercentage,
  }) {
    if (rate == -1) {
      return AccountsAmountCalculationBillItemRatetotalTaxNetModel(
          saleTotal: -1, taxAmt: -1, netTotal: -1);
    }

    var saleTotal = 0.0;
    var taxTotalAmount = 0.0;
    var netAmount = 0.0;

    if (isEnableTaxCalculation) {
      rate = getItemPureRate(
          rate: rate,
          isInclusive: isInclusive,
          taxPercentage: totalTaxPercentage);
    }

    rate = rate - discAmountItem;
    rate = rate - offerAmountItem;

    if (isEnableBillSplit) {
      rate = rate - discAmountBillWise;
      rate = rate - offerAmountBillWise;
    }

    saleTotal = rate * qty;

    if (isEnableTaxCalculation && taxPercentage != 0) {
      taxTotalAmount = saleTotal * taxPercentage / 100;
    }

    netAmount = saleTotal + taxTotalAmount;

    return AccountsAmountCalculationBillItemRatetotalTaxNetModel(
        saleTotal: saleTotal, taxAmt: taxTotalAmount, netTotal: netAmount);
  }

  double grtBillNetTotal(
      {required double grossAmount,
      required bool isSplitBillItems,
      required double discountAmount,
      required double offerAmount,
      required double deliveryChargeOrFright}) {
    var totalGrossAmount = grossAmount;

    if (isSplitBillItems == false) {
      totalGrossAmount = totalGrossAmount - discountAmount;
      totalGrossAmount -= offerAmount;
    }

    totalGrossAmount += deliveryChargeOrFright;

    return totalGrossAmount;
  }

  double getItemPureRate({
    required double rate,
    required bool isInclusive,
    required double taxPercentage,
  }) {
    if (isInclusive && taxPercentage != 0) {
      rate = (rate / (1 + (taxPercentage / 100)));
    }
    return rate;
  }
}
