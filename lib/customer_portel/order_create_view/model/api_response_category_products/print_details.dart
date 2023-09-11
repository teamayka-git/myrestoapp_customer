import 'package:json_annotation/json_annotation.dart';

part 'print_details.g.dart';

@JsonSerializable()
class PrintDetails {
  @JsonKey(name: '_string')
  String? string;
  @JsonKey(name: '_code')
  String? code;

  PrintDetails({this.code, this.string});

  factory PrintDetails.fromJson(Map<String, dynamic> json) {
    return _$PrintDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrintDetailsToJson(this);
}
