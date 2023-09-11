class ResponseFormat {
  static const light = 0;
  static const minimum = 1;
  static const medium = 2;
  static const maximum = 3;

  int getRfNo(
      {required int rfNumber, required int rfType, required String rfValue}) {
    return int.parse("${(rfNumber != 0) ? rfNumber : ""}$rfType");
  }
}
