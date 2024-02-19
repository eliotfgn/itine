import 'package:itine/domains/models/product/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_item.g.dart';

@JsonSerializable()
class WishlistItem {
  WishlistItem({
    required this.id,
    required this.productId,
    this.userId,
  });

  int id;
  final int productId;
  final int? userId;

  factory WishlistItem.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistItemToJson(this);
}
