import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'print_model_kot_print.g.dart';

@JsonSerializable()
class PrintModelKotPrint {
  int? type;
  String? printerIp;
  String? printUserName;
  String? runningKotMessage;
  Data? data;

  PrintModelKotPrint(
      {required this.type,
      required this.printerIp,
      required this.runningKotMessage,
      required this.printUserName,
      required this.data});

  factory PrintModelKotPrint.fromJson(Map<String, dynamic> json) {
    return _$PrintModelKotPrintFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrintModelKotPrintToJson(this);
}
