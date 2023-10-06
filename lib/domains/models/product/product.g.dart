// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      cover: json['cover'] as int,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'cover': instance.cover,
      'categories': instance.categories,
      'images': instance.images,
      'sizes': instance.sizes,
      'colors': instance.colors,
    };
