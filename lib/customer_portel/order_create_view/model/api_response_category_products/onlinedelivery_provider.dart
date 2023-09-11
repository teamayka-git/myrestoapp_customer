import 'package:json_annotation/json_annotation.dart';

part 'onlinedelivery_provider.g.dart';

@JsonSerializable()
class OnlinedeliveryProvider {
  int? id;
  String? name;
  String? email;
  String? mobile;

  OnlinedeliveryProvider({this.id, this.name, this.email, this.mobile});

  factory OnlinedeliveryProvider.fromJson(Map<String, dynamic> json) {
    return _$OnlinedeliveryProviderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OnlinedeliveryProviderToJson(this);
}
