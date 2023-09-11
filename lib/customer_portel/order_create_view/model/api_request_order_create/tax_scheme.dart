import 'package:json_annotation/json_annotation.dart';

part 'tax_scheme.g.dart';

@JsonSerializable()
class TaxScheme {
  int? taxId;
  double? taxRate;

  TaxScheme({this.taxId, this.taxRate});
  TaxScheme.create({required this.taxId, required this.taxRate});

  factory TaxScheme.fromJson(Map<String, dynamic> json) {
    return _$TaxSchemeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaxSchemeToJson(this);
}
