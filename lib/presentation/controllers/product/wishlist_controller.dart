import 'package:get/get.dart';
import 'package:itine/domains/models/wishlist/wishlist_item.dart';

class WishlistController extends GetxController {
  RxInt index = 0.obs;
  RxList<WishlistItem> items = <WishlistItem>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  void addToWishlist() {}
}
