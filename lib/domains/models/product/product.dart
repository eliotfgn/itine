import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.cover,
    required this.categories,
    required this.images,
    required this.sizes,
    required this.colors,
  });

  final String? id;
  final String name;
  final String description;
  final double price;
  final int cover;
  final List<String> categories;
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
