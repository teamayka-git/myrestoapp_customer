import 'package:json_annotation/json_annotation.dart';

part 'tax_detail.g.dart';

@JsonSerializable()
class TaxDetail {
  int? schemeId;
  String? description;
  double? taxRate;
  int? effectiveFrom;
  int? effectiveTo;
  bool? isTaxInclusive;

  TaxDetail({
    this.schemeId,
    this.description,
    this.taxRate,
    this.effectiveFrom,
    this.effectiveTo,
    this.isTaxInclusive,
  });

  factory TaxDetail.fromJson(Map<String, dynamic> json) {
    return _$TaxDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaxDetailToJson(this);
}
