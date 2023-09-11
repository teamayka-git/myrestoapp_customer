// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model_kot_print.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintModelKotPrint _$PrintModelKotPrintFromJson(Map<String, dynamic> json) =>
    PrintModelKotPrint(
      type: json['type'] as int?,
      printerIp: json['printerIp'] as String?,
      runningKotMessage: json['runningKotMessage'] as String?,
      printUserName: json['printUserName'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrintModelKotPrintToJson(PrintModelKotPrint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'printerIp': instance.printerIp,
      'printUserName': instance.printUserName,
      'runningKotMessage': instance.runningKotMessage,
      'data': instance.data,
    };
