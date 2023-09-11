import 'package:json_annotation/json_annotation.dart';

part 'print_model_test_print.g.dart';

@JsonSerializable()
class PrintModelTestPrint {
  int? type;
  String? printerIp;
  String? kitchenName;
  String? printUserName;

  PrintModelTestPrint({
    required this.type,
    required this.printerIp,
    required this.kitchenName,
    required this.printUserName,
  });

  factory PrintModelTestPrint.fromJson(Map<String, dynamic> json) {
    return _$PrintModelTestPrintFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrintModelTestPrintToJson(this);
}
