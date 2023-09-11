import 'package:json_annotation/json_annotation.dart';

part 'delivery_staff.g.dart';

@JsonSerializable()
class DeliveryStaff {
  int? userId;
  String? fullname;
  dynamic imageUrl;

  DeliveryStaff({this.userId, this.fullname, this.imageUrl});

  factory DeliveryStaff.fromJson(Map<String, dynamic> json) {
    return _$DeliveryStaffFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryStaffToJson(this);
}
