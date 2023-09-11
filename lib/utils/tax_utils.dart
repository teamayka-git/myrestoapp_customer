class TaxUtils {
  double getInclusiveTaxRate({
    required double rateTotal,
    required double taxPercentage,
  }) {
    double returnValue = 0.0;

    returnValue = rateTotal - (rateTotal / (1 + (taxPercentage / 100)));

    return returnValue;
  }

  double getExclusiveTaxRate({
    required double rateTotal,
    required double taxPercentage,
  }) {
    double returnValue = 0.0;

    returnValue = rateTotal * (taxPercentage / 100);

    return returnValue;
  }
}
