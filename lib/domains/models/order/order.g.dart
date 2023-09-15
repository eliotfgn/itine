// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      productId: json['productId'] as String,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'size': instance.size,
      'quantity': instance.quantity,
      'price': instance.price,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.inactive: 'inactive',
  Status.active: 'active',
  Status.completed: 'completed',
  Status.cancelled: 'cancelled',
};
