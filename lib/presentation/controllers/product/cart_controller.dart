import 'package:get/get.dart';
import 'package:itine/core/services/api/products/cart_service.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';

class CartController extends GetxController {
  final CartService _cartService = CartService();

  final SessionController _sessionController = Get.find<SessionController>();

  RxDouble total = .0.obs;
  RxInt totalArticles = 0.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  @override
  onInit() async {
    if (_sessionController.isConnected.isTrue) await loadCart();
    super.onInit();
  }

  Future<void> loadCart() async {
    int userId = _sessionController.user.value!.id;

    items.value = await _cartService.getItems(userId);

    double count = 0;
    for (var item in items) {
      count += (item.product.price * item.quantity);
    }

    total.value = count;
    totalArticles.value = items.length;
  }

  Future<void> addToCart(productId, quantity, color, size) async {
    CartItem item = await _cartService.addToCart(
        _sessionController.user.value?.id, productId, quantity, color, size);
    items.add(item);
    total.value += (item.quantity * item.product.price);
    totalArticles.value += 1;
  }

  Future<bool> removeFromCart(CartItem item) async {
    bool success = await _cartService.delete(item.id);
    if (success == true) {
      items.removeWhere((element) => element.id == item.id);
      total.value -= (item.product.price * item.quantity);
      totalArticles.value -= 1;
    }

    return success;
  }

  bool productInCart(int id) {
    CartItem? item =
        items.firstWhereOrNull((element) => element.product.id == id);
    return item != null;
  }
}
