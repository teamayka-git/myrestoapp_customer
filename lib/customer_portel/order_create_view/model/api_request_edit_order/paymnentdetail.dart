import 'package:json_annotation/json_annotation.dart';

part 'paymnentdetail.g.dart';

@JsonSerializable()
class Paymnentdetail {
  int? typeId;
  double? amount;
  String? description;

  Paymnentdetail({this.typeId, this.amount, this.description});
  Paymnentdetail.create(
      {required this.typeId, required this.amount, required this.description});

  factory Paymnentdetail.fromJson(Map<String, dynamic> json) {
    return _$PaymnentdetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymnentdetailToJson(this);
}
