import 'package:json_annotation/json_annotation.dart';

part 'api_response_success.g.dart';

@JsonSerializable()
class ApiResponseSuccess {
  String? message;

  ApiResponseSuccess({this.message});

  factory ApiResponseSuccess.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseSuccessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseSuccessToJson(this);
}
