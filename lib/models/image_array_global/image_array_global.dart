import 'package:json_annotation/json_annotation.dart';

part 'image_array_global.g.dart';

@JsonSerializable()
class ImageArrayGlobal {
  String? filename;
  String? path;
  String? linkingIdString;

  ImageArrayGlobal({this.filename, this.path, this.linkingIdString});
  ImageArrayGlobal.create(
      {required this.filename,
      required this.path,
      required this.linkingIdString});

  factory ImageArrayGlobal.fromJson(Map<String, dynamic> json) {
    return _$ImageArrayGlobalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageArrayGlobalToJson(this);
}
