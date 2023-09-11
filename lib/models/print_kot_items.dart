class PrintKotItems {
  String name;
  String localName;
  String kotNote;
  bool isStrike;
  String variantName;
  String printIp;
  String kitchenName;
  double qty;
  int? status;
  double unitPrice;
  double totalPrice;

  PrintKotItems({
    required this.name,
    required this.localName,
    required this.isStrike,
    required this.kitchenName,
    required this.printIp,
    required this.variantName,
    required this.kotNote,
    required this.qty,
    required this.unitPrice,
    required this.status,
    required this.totalPrice,
  });
}
