// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      productDetails: (json['productDetails'] as List<dynamic>?)
          ?.map((e) => ProductDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
      tableDetails: (json['tableDetails'] as List<dynamic>?)
          ?.map((e) => TableDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      onlinedeliveryProviders: (json['onlinedeliveryProviders']
              as List<dynamic>?)
          ?.map(
              (e) => OnlinedeliveryProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffList: (json['staffList'] as List<dynamic>?)
          ?.map((e) => StaffList.fromJson(e as Map<String, dynamic>))
          .toList(),
      salesType: (json['salesType'] as List<dynamic>?)
          ?.map((e) => SaleTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryStaffs: (json['deliveryStaffs'] as List<dynamic>?)
          ?.map((e) => DeliveryStaff.fromJson(e as Map<String, dynamic>))
          .toList(),
      printDetails: (json['printDetails'] as List<dynamic>?)
          ?.map((e) => PrintDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      shiftData: json['shiftData'] == null
          ? null
          : ShiftData.fromJson(json['shiftData'] as Map<String, dynamic>),
      totalOrders: json['totalOrders'] as int?,
      totalDineIn: json['totalDineIn'] as int?,
      totalDelivery: json['totalDelivery'] as int?,
      totalTakeAway: json['totalTakeAway'] as int?,
      totalOnline: json['totalOnline'] as int?,
      currentTime: json['currentTime'] as int?,
      userFavorites: (json['userFavorites'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'productDetails': instance.productDetails,
      'userDetails': instance.userDetails,
      'tableDetails': instance.tableDetails,
      'onlinedeliveryProviders': instance.onlinedeliveryProviders,
      'staffList': instance.staffList,
      'salesType': instance.salesType,
      'deliveryStaffs': instance.deliveryStaffs,
      'printDetails': instance.printDetails,
      'shiftData': instance.shiftData,
      'totalOrders': instance.totalOrders,
      'totalDineIn': instance.totalDineIn,
      'totalDelivery': instance.totalDelivery,
      'totalTakeAway': instance.totalTakeAway,
      'totalOnline': instance.totalOnline,
      'currentTime': instance.currentTime,
      'userFavorites': instance.userFavorites,
    };
