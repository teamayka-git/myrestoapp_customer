// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryStaff _$DeliveryStaffFromJson(Map<String, dynamic> json) =>
    DeliveryStaff(
      userId: json['userId'] as int?,
      fullname: json['fullname'] as String?,
      imageUrl: json['imageUrl'],
    );

Map<String, dynamic> _$DeliveryStaffToJson(DeliveryStaff instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'imageUrl': instance.imageUrl,
    };
