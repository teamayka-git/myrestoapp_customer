import 'package:json_annotation/json_annotation.dart';

part 'shift_data.g.dart';

@JsonSerializable()
class ShiftData {
  String? counterName;

  int? counterId;

  int? shiftId;

  ShiftData({this.counterName, this.counterId, this.shiftId});

  factory ShiftData.fromJson(Map<String, dynamic> json) {
    return _$ShiftDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShiftDataToJson(this);
}
