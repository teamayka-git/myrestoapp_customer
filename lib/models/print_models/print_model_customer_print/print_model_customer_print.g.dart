// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model_customer_print.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintModelCustomerPrint _$PrintModelCustomerPrintFromJson(
        Map<String, dynamic> json) =>
    PrintModelCustomerPrint(
      type: json['type'] as int?,
      printerIp: json['printerIp'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      printUserName: json['printUserName'] as String?,
    );

Map<String, dynamic> _$PrintModelCustomerPrintToJson(
        PrintModelCustomerPrint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'printerIp': instance.printerIp,
      'data': instance.data,
      'printUserName': instance.printUserName,
    };
