import 'package:json_annotation/json_annotation.dart';

part 'staff_list.g.dart';

@JsonSerializable()
class StaffList {
  int? userId;
  String? fullname;
  String? imageUrl;

  StaffList({this.userId, this.fullname, this.imageUrl});

  factory StaffList.fromJson(Map<String, dynamic> json) {
    return _$StaffListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StaffListToJson(this);
}
