// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_get_tables.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseGetTables _$ApiResponseGetTablesFromJson(
        Map<String, dynamic> json) =>
    ApiResponseGetTables(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseGetTablesToJson(
        ApiResponseGetTables instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
