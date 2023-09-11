// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      propertyId: json['propertyId'] as int?,
      propertyName: json['propertyName'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'description': instance.description,
      'color': instance.color,
    };
