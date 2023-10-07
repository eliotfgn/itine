import 'package:get/get.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';

class CartController extends GetxController {
  RxInt index = 0.obs;
  RxList<CartItem> items = <CartItem>[].obs;

  void addToCart(CartItem item) {
    item.id = index.value;
    index++;
    items.add(item);
  }

  void removeFromCart(int id) {
    items.removeWhere((element) => element.id == id);
  }
}
