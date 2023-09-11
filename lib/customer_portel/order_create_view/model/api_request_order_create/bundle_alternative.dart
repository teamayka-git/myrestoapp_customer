import 'package:json_annotation/json_annotation.dart';

part 'bundle_alternative.g.dart';

@JsonSerializable()
class BundleAlternative {
  int? id;
  int? productId;
  int? unitId;
  double? unitQty;

  BundleAlternative({this.id, this.productId, this.unitId, this.unitQty});
  BundleAlternative.create(
      {required this.id,
      required this.productId,
      required this.unitId,
      required this.unitQty});

  factory BundleAlternative.fromJson(Map<String, dynamic> json) {
    return _$BundleAlternativeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BundleAlternativeToJson(this);
}
