// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetail _$CustomerDetailFromJson(Map<String, dynamic> json) =>
    CustomerDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      addressList: (json['addressList'] as List<dynamic>?)
          ?.map((e) => AddressList.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$CustomerDetailToJson(CustomerDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'mobile': instance.mobile,
      'addressList': instance.addressList,
    };
