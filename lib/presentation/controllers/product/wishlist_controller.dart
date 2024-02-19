import 'package:get/get.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/domains/models/wishlist/wishlist_item.dart';

class WishlistController extends GetxController {
  final ProductService _productService = ProductService();

  RxInt index = 0.obs;
  RxList<WishlistItem> items = <WishlistItem>[].obs;

  @override
  void onInit() async {
    await fetchItemsByUser();
    super.onInit();
  }

  Future<bool> addToWishlist(int productId) async {
    WishlistItem? item = await _productService.addToWishlist(productId);

    if (item != null) {
      items.add(item);
    }

    return item != null;
  }

  Future<bool> removeFromWishlist(int productId) async {
    WishlistItem item =
        items.singleWhere((element) => element.productId == productId);

    bool success = await _productService.deleteWishlistItem(item.id);
    if (success) {
      items.remove(item);
    }

    return success;
  }

  Future<void> fetchItemsByUser() async {
    List<WishlistItem> wishlistItems =
        await _productService.getWishlistItems(1);
    items.addAll(wishlistItems);
  }

  Future<bool> handleLikeButton(int productId) async {
    bool success = false;
    if (hasLiked(productId) == false) {
      success = await addToWishlist(productId);
      if (success) return true;
    } else {
      success = await removeFromWishlist(productId);
      if (success) return false;
    }

    return success;
  }

  bool hasLiked(int productId) {
    return items
            .firstWhereOrNull((element) => element.productId == productId) !=
        null;
  }
}
