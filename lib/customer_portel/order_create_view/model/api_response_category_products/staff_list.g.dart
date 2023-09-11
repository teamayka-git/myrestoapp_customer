// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffList _$StaffListFromJson(Map<String, dynamic> json) => StaffList(
      userId: json['userId'] as int?,
      fullname: json['fullname'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$StaffListToJson(StaffList instance) => <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'imageUrl': instance.imageUrl,
    };
