// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      userId: json['userId'] as int?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      active: json['active'] as bool?,
      fullname: json['fullname'] as String?,
      role: json['role'] as int?,
      superUser: json['superUser'] as bool?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'active': instance.active,
      'fullname': instance.fullname,
      'role': instance.role,
      'superUser': instance.superUser,
    };
