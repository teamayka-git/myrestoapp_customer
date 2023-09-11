import 'package:myresto_customer/customer_portel/order_create_view/model/chair_model.dart';

class TableModel {
  String? tableId;
  String? name;
  int? seatCount;
  List<ChairModel>? chairs;

  TableModel({
    required this.tableId,
    required this.name,
    required this.seatCount,
    required this.chairs,
  });
}
