// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chair _$ChairFromJson(Map<String, dynamic> json) => Chair(
      chairId: json['chairId'] as int?,
      chairName: json['chairName'] as String?,
      status: json['status'] as int?,
      isFree: json['isFree'] as bool?,
    );

Map<String, dynamic> _$ChairToJson(Chair instance) => <String, dynamic>{
      'chairId': instance.chairId,
      'chairName': instance.chairName,
      'status': instance.status,
      'isFree': instance.isFree,
    };
