// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      categoryDetails: (json['categoryDetails'] as List<dynamic>?)
          ?.map((e) => CategoryDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'categoryDetails': instance.categoryDetails,
      'userDetails': instance.userDetails,
    };
