import 'package:get/get.dart';
import 'package:itine/core/services/api/products/cart_service.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';

class CartController extends GetxController {
  final CartService _cartService = CartService();

  RxDouble total = .0.obs;
  RxInt totalArticles = 0.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  Future<void> loadCart() async {
    int userId = 1; // _sessionController.user.value!.id;

    items.value = await _cartService.getItems(userId);

    double count = 0;
    for (var item in items) {
      count += (item.product.price * item.quantity);
    }

    total.value = count;
    totalArticles.value = items.length;
  }

  void addToCart(userId, productId, quantity, color, size) async {
    await _cartService.addToCart(userId, productId, quantity, color, size);
  }

  void removeFromCart(int id) {
    items.removeWhere((element) => element.id == id);
  }
}
