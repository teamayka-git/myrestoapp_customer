// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      userId: json['userId'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      active: json['active'] as bool?,
      fullname: json['fullname'] as String?,
      role: json['role'] as int?,
      image: json['image'] as String?,
      status: json['status'] as int?,
      refreshToken: json['refreshToken'] as List<dynamic>?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'password': instance.password,
      'active': instance.active,
      'fullname': instance.fullname,
      'role': instance.role,
      'image': instance.image,
      'status': instance.status,
      'refreshToken': instance.refreshToken,
      'permissions': instance.permissions,
    };
