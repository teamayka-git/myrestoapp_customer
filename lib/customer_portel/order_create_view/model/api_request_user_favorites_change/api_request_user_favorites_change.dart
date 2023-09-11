import 'package:json_annotation/json_annotation.dart';

part 'api_request_user_favorites_change.g.dart';

@JsonSerializable()
class ApiRequestUserFavoritesChange {
  int? productId;
  bool? isAdd;

  ApiRequestUserFavoritesChange({required this.productId, required this.isAdd});

  factory ApiRequestUserFavoritesChange.fromJson(Map<String, dynamic> json) {
    return _$ApiRequestUserFavoritesChangeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiRequestUserFavoritesChangeToJson(this);
}
