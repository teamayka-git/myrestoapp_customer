import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  int? propertyId;
  String? propertyName;
  String? description;
  String? color;

  Property({
    this.propertyId,
    this.propertyName,
    this.description,
    this.color,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return _$PropertyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}
