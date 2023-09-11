// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_print.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsPrint _$ProductDetailsPrintFromJson(Map<String, dynamic> json) =>
    ProductDetailsPrint(
      isStrike: json['isStrike'] as bool?,
      productName: json['productName'] as String?,
      variantName: json['variantName'] as String?,
      localName: json['localName'] as String?,
      qty: (json['qty'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      status: json['status'] as int?,
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      printer: json['printer'] as String?,
      printerName: json['printerName'] as String?,
      kotNotes: json['kotNotes'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$ProductDetailsPrintToJson(
        ProductDetailsPrint instance) =>
    <String, dynamic>{
      'isStrike': instance.isStrike,
      'productName': instance.productName,
      'localName': instance.localName,
      'variantName': instance.variantName,
      'qty': instance.qty,
      'rate': instance.rate,
      'status': instance.status,
      'netAmount': instance.netAmount,
      'printer': instance.printer,
      'printerName': instance.printerName,
      'kotNotes': instance.kotNotes,
      'remarks': instance.remarks,
    };
