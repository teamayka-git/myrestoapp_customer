import 'package:json_annotation/json_annotation.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/print_details.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/sale_types.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/shift_data.dart';

import 'delivery_staff.dart';
import 'onlinedelivery_provider.dart';
import 'product_detail.dart';
import 'table_detail.dart';
import 'user_details.dart';
import 'staff_list.dart';
part 'data.g.dart';

@JsonSerializable()
class Data {
  List<ProductDetail>? productDetails;
  UserDetails? userDetails;
  List<TableDetail>? tableDetails;
  List<OnlinedeliveryProvider>? onlinedeliveryProviders;
  List<StaffList>? staffList;
  List<SaleTypes>? salesType;
  List<DeliveryStaff>? deliveryStaffs;
  List<PrintDetails>? printDetails;
  ShiftData? shiftData;
  int? totalOrders;
  int? totalDineIn;
  int? totalDelivery;
  int? totalTakeAway;
  int? totalOnline;
  int? currentTime;
  List<int>? userFavorites;

  Data({
    this.productDetails,
    this.userDetails,
    this.tableDetails,
    this.onlinedeliveryProviders,
    this.staffList,
    this.salesType,
    this.deliveryStaffs,
    this.printDetails,
    this.shiftData,
    this.totalOrders,
    this.totalDineIn,
    this.totalDelivery,
    this.totalTakeAway,
    this.totalOnline,
    this.currentTime,
    this.userFavorites,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
