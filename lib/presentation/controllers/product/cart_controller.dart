import 'package:get/get.dart';
import 'package:itine/core/services/api/products/cart_service.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';

class CartController extends GetxController {
  final CartService _cartService = CartService();

  RxInt index = 0.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  void addToCart(userId, productId, quantity, color, size) async {
    await _cartService.addToCart(userId, productId, quantity, color, size);
  }

  void removeFromCart(int id) {
    items.removeWhere((element) => element.id == id);
  }
}
