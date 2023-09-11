// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model_test_print.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintModelTestPrint _$PrintModelTestPrintFromJson(Map<String, dynamic> json) =>
    PrintModelTestPrint(
      type: json['type'] as int?,
      printerIp: json['printerIp'] as String?,
      kitchenName: json['kitchenName'] as String?,
      printUserName: json['printUserName'] as String?,
    );

Map<String, dynamic> _$PrintModelTestPrintToJson(
        PrintModelTestPrint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'printerIp': instance.printerIp,
      'kitchenName': instance.kitchenName,
      'printUserName': instance.printUserName,
    };
