import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  int? userId;
  String? userName;
  String? email;
  String? password;
  bool? active;
  String? fullname;
  int? role;
  bool? superUser;

  UserDetails({
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.active,
    this.fullname,
    this.role,
    this.superUser,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
