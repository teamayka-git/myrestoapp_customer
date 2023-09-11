import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  int? userId;
  String? email;
  String? password;
  bool? active;
  String? fullname;
  int? role;
  String? image;
  int? status;
  List<dynamic>? refreshToken;

  List<String>? permissions;

  UserDetails({
    this.userId,
    this.email,
    this.password,
    this.active,
    this.fullname,
    this.role,
    this.image,
    this.status,
    this.refreshToken,
    this.permissions,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
