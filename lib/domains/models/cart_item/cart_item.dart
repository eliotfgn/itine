import 'package:itine/domains/models/product/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  CartItem({
    this.id,
    required this.product,
    this.userId,
    required this.quantity,
    this.color,
    this.size,
  });

  final int? id;
  final Product product;
  final int? userId;
  final int quantity;
  final String? color;
  final String? size;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}