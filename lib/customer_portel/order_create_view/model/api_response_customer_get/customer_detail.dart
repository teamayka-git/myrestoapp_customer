import 'package:json_annotation/json_annotation.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/address_list.dart';

part 'customer_detail.g.dart';

@JsonSerializable()
class CustomerDetail {
  int? id;
  String? name;
  String? city;
  String? mobile;
  List<AddressList>? addressList;

  CustomerDetail({
    this.id,
    this.name,
    this.addressList,
    this.city,
    this.mobile,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) {
    return _$CustomerDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerDetailToJson(this);
}
