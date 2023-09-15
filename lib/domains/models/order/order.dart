import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  Order({
    this.id,
    required this.productId,
    required this.size,
    required this.quantity,
    required this.price,
    required this.status,
  });

  final String? id;
  final String productId;
  final String size;
  final int quantity;
  final double price;
  final Status status;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

enum Status {
  inactive,
  active,
  completed,
  cancelled,
}
