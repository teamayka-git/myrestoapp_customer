import 'package:json_annotation/json_annotation.dart';

part 'chair.g.dart';

@JsonSerializable()
class Chair {
  int? chairId;
  String? chairName;
  int? status;
  bool? isFree;

  Chair({this.chairId, this.chairName, this.status, this.isFree});

  factory Chair.fromJson(Map<String, dynamic> json) => _$ChairFromJson(json);

  Map<String, dynamic> toJson() => _$ChairToJson(this);
}
