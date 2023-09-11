import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'print_model_customer_print.g.dart';

@JsonSerializable()
class PrintModelCustomerPrint {
  int? type;
  String? printerIp;
  Data? data;
  String? printUserName;

  PrintModelCustomerPrint(
      {required this.type,
      required this.printerIp,
      required this.data,
      required this.printUserName});

  factory PrintModelCustomerPrint.fromJson(Map<String, dynamic> json) {
    return _$PrintModelCustomerPrintFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrintModelCustomerPrintToJson(this);
}
