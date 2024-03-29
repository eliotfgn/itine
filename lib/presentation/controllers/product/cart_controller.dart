import 'package:get/get.dart';
import 'package:itine/core/services/api/products/cart_service.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';

class CartController extends GetxController {
  final CartService _cartService = CartService();
  final SessionController _sessionController = Get.put(SessionController());

  RxDouble total = .0.obs;
  RxInt totalArticles = 0.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  Future<void> loadCart() async {
    int userId = 1; // _sessionController.user.value!.id;

    items.value = await _cartService.getItems(userId);

    for (var item in items) {
      total.value += (item.product.price * item.quantity);
    }
    totalArticles.value = items.length;
  }

  void addToCart(userId, productId, quantity, color, size) async {
    await _cartService.addToCart(userId, productId, quantity, color, size);
  }

  void removeFromCart(int id) {
    items.removeWhere((element) => element.id == id);
  }
}
