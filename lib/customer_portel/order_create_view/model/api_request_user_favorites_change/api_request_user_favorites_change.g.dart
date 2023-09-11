// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request_user_favorites_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRequestUserFavoritesChange _$ApiRequestUserFavoritesChangeFromJson(
        Map<String, dynamic> json) =>
    ApiRequestUserFavoritesChange(
      productId: json['productId'] as int?,
      isAdd: json['isAdd'] as bool?,
    );

Map<String, dynamic> _$ApiRequestUserFavoritesChangeToJson(
        ApiRequestUserFavoritesChange instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'isAdd': instance.isAdd,
    };
