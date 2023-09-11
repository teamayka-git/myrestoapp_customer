// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request_customer_get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRequestCustomerGet _$ApiRequestCustomerGetFromJson(
        Map<String, dynamic> json) =>
    ApiRequestCustomerGet(
      sortType: json['sortType'] as int?,
      sortOrder: json['sortOrder'] as int?,
      statusArray: (json['statusArray'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      screenType:
          (json['screenType'] as List<dynamic>?)?.map((e) => e as int).toList(),
      searchingText: json['searchingText'] as String?,
      responseFormat: (json['responseFormat'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      limit: json['limit'] as int?,
      skip: json['skip'] as int?,
      id: (json['id'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ApiRequestCustomerGetToJson(
        ApiRequestCustomerGet instance) =>
    <String, dynamic>{
      'sortType': instance.sortType,
      'sortOrder': instance.sortOrder,
      'statusArray': instance.statusArray,
      'screenType': instance.screenType,
      'searchingText': instance.searchingText,
      'responseFormat': instance.responseFormat,
      'limit': instance.limit,
      'skip': instance.skip,
      'id': instance.id,
    };
