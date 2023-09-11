// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableDetail _$TableDetailFromJson(Map<String, dynamic> json) => TableDetail(
      tableId: json['tableId'] as int?,
      tableName: json['tableName'] as String?,
      status: json['status'] as int?,
      chairs: (json['chairs'] as List<dynamic>?)
          ?.map((e) => Chair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TableDetailToJson(TableDetail instance) =>
    <String, dynamic>{
      'tableId': instance.tableId,
      'tableName': instance.tableName,
      'status': instance.status,
      'chairs': instance.chairs,
    };
