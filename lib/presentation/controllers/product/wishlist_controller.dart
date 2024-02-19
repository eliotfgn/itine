import 'package:get/get.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/domains/models/wishlist/wishlist_item.dart';

class WishlistController extends GetxController {
  final ProductService _productService = ProductService();

  RxInt index = 0.obs;
  RxList<WishlistItem> items = <WishlistItem>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<bool> addToWishlist(WishlistItem item) async {
    bool success = await _productService.addToWishlist(item);

    if (success) {
      items.add(item);
    }

    return success;
  }

  Future<bool> removeFromWishlist(int productId) async {
    WishlistItem item =
        items.singleWhere((element) => element.product.id == productId);

    bool success = await _productService.deleteWishlistItem(item.id);
    if (success) {
      items.remove(item);
    }

    return success;
  }
}
