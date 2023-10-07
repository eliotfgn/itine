// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as int?,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      userId: json['userId'] as int?,
      quantity: json['quantity'] as int,
      color: json['color'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'color': instance.color,
      'size': instance.size,
    };
