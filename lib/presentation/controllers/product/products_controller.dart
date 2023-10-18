import 'package:get/get.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';
import 'package:itine/domains/models/category/category.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';

class ProductsController extends GetxController {
  final ProductService _productService = ProductService();
  final CartController _cartController = Get.put(CartController());

  RxInt quantity = 0.obs;
  RxString selectedColor = ''.obs;
  RxString selectedSize = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    products.value = await _productService.getAll();
  }

  Future<List<Category>> fetchCategories(String gender) async {
    return await _productService.getCategoriesByGender(gender);
  }

  addToCart(Product product) {
    CartItem item = CartItem(
      product: product,
      quantity: quantity.value,
      color: selectedColor.value,
      size: selectedSize.value,
    );

    _cartController.addToCart(item);
    resetSelection();
  }

  resetSelection() {
    selectedSize.value = '';
    selectedColor.value = '';
  }
}
