import 'package:json_annotation/json_annotation.dart';

part 'payment_detail.g.dart';

@JsonSerializable()
class PaymentDetail {
  int? typeId;
  double? amount;

  PaymentDetail({this.typeId, this.amount});
  PaymentDetail.create({required this.typeId, required this.amount});

  factory PaymentDetail.fromJson(Map<String, dynamic> json) {
    return _$PaymentDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentDetailToJson(this);
}
