// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      propertyDetailsId: json['propertyDetailsId'] as int?,
      description: json['description'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'propertyDetailsId': instance.propertyDetailsId,
      'description': instance.description,
      'value': instance.value,
    };
