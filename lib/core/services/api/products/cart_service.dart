import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';

class CartService extends ApiService {
  Future<CartItem> addToCart(userId, productId, quantity, color, size) async {
    Response response = await client.post(
      ApiEndpoints.cart,
      data: {
        'userId': userId,
        'productId': productId,
        'quantity': quantity,
        'color': color,
        'size': size,
      },
    );

    return CartItem.fromJson(response.data['data']);
  }

  getItems(int userId) async {
    List<CartItem> items = [];
    Response response = await client.get('${ApiEndpoints.cart}?userId=$userId');

    response.data['data'].forEach((item) {
      items.add(CartItem.fromJson(item));
    });

    return items;
  }

  Future<bool> delete(int id) async {
    Response response = await client.delete('${ApiEndpoints.cart}$id');

    return response.data['success'];
  }
}
