// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetail _$CategoryDetailFromJson(Map<String, dynamic> json) =>
    CategoryDetail(
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      categoryImage: json['categoryImage'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDetailToJson(CategoryDetail instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryImage': instance.categoryImage,
      'products': instance.products,
    };
