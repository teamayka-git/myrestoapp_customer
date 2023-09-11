import 'package:json_annotation/json_annotation.dart';

import 'customer_detail.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<CustomerDetail>? customerDetails;

  Data({this.customerDetails});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
