import 'package:json_annotation/json_annotation.dart';

part 'bundle_alternatives.g.dart';

@JsonSerializable()
class BundleAlternatives {
  int? id;
  int? productId;
  int? unitId;
  double? unitQty;

  BundleAlternatives({this.id, this.productId, this.unitId, this.unitQty});
  BundleAlternatives.create(
      {required this.id,
      required this.productId,
      required this.unitId,
      required this.unitQty});

  factory BundleAlternatives.fromJson(Map<String, dynamic> json) {
    return _$BundleAlternativesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BundleAlternativesToJson(this);
}
