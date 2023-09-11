import 'package:json_annotation/json_annotation.dart';

import 'category_detail.dart';
import 'user_details.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<CategoryDetail>? categoryDetails;
  UserDetails? userDetails;

  Data({this.categoryDetails, this.userDetails});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
