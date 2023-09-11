// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      orderTypeName: json['orderTypeName'] as String?,
      name: json['name'] as String?,
      listCustomerDetailsString:
          (json['listCustomerDetailsString'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      staffName: json['staffName'] as String?,
      token: json['token'] as String?,
      notes: json['notes'] as String?,
      orderTimeMil: json['orderTimeMil'] as int?,
      listKotItems: (json['listKotItems'] as List<dynamic>?)
          ?.map((e) => ListKotItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'orderTypeName': instance.orderTypeName,
      'name': instance.name,
      'listCustomerDetailsString': instance.listCustomerDetailsString,
      'staffName': instance.staffName,
      'token': instance.token,
      'notes': instance.notes,
      'orderTimeMil': instance.orderTimeMil,
      'listKotItems': instance.listKotItems,
    };
