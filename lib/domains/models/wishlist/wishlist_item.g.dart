// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistItem _$WishlistItemFromJson(Map<String, dynamic> json) => WishlistItem(
      id: json['id'] as int?,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$WishlistItemToJson(WishlistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'userId': instance.userId,
    };
