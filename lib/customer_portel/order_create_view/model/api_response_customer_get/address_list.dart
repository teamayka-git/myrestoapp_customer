import 'package:json_annotation/json_annotation.dart';

part 'address_list.g.dart';

@JsonSerializable()
class AddressList {
  int? addressId;
  String? address;

  AddressList({
    this.addressId,
    this.address,
  });

  factory AddressList.fromJson(Map<String, dynamic> json) {
    return _$AddressListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressListToJson(this);
}
