// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      orderTypeName: json['orderTypeName'] as String?,
      taxString: json['taxString'] as String?,
      notes: json['notes'] as String?,
      isOpenDrawer: json['isOpenDrawer'] as bool?,
      listCustomerDetailsString:
          (json['listCustomerDetailsString'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      subTotalAmount: json['subTotalAmount'] as String?,
      staffName: json['staffName'] as String?,
      orderNumber: json['orderNumber'] as String?,
      token: json['token'] as String?,
      orderTimeMil: json['orderTimeMil'] as int?,
      deliveryCharge: json['deliveryCharge'] as String?,
      taxAmount: json['taxAmount'] as String?,
      grandTotalAmount: json['grandTotalAmount'] as String?,
      footerBig: json['footerBig'] as String?,
      footerSmall: json['footerSmall'] as String?,
      isShowPaidStamb: json['isShowPaidStamb'] as bool?,
      listKotItems: (json['listKotItems'] as List<dynamic>?)
          ?.map((e) => ListKotItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'orderTypeName': instance.orderTypeName,
      'taxString': instance.taxString,
      'notes': instance.notes,
      'isOpenDrawer': instance.isOpenDrawer,
      'listCustomerDetailsString': instance.listCustomerDetailsString,
      'subTotalAmount': instance.subTotalAmount,
      'staffName': instance.staffName,
      'orderNumber': instance.orderNumber,
      'token': instance.token,
      'orderTimeMil': instance.orderTimeMil,
      'deliveryCharge': instance.deliveryCharge,
      'taxAmount': instance.taxAmount,
      'grandTotalAmount': instance.grandTotalAmount,
      'footerBig': instance.footerBig,
      'footerSmall': instance.footerSmall,
      'isShowPaidStamb': instance.isShowPaidStamb,
      'listKotItems': instance.listKotItems,
    };
