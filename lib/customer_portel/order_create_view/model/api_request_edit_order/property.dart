import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  int? propertyDetailsId;
  String? description;
  String? value;

  Property({this.propertyDetailsId, this.description, this.value});
  Property.create(
      {required this.propertyDetailsId,
      required this.description,
      required this.value});

  factory Property.fromJson(Map<String, dynamic> json) {
    return _$PropertyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}
