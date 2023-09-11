import 'package:json_annotation/json_annotation.dart';

import 'order_detail.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<OrderDetail>? orderDetails;

  Data({this.orderDetails});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
