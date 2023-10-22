import 'package:get/get.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/domains/models/category/category.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';

class ProductsController extends GetxController {
  final ProductService _productService = ProductService();
  final CartController _cartController = Get.put(CartController());
  final SessionController _sessionController = Get.find<SessionController>();
  final List<Gender> genders = [Gender.man, Gender.woman, Gender.child];

  RxInt quantity = 0.obs;
  RxString selectedColor = ''.obs;
  RxString selectedSize = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Category> categories = <Category>[].obs;
  RxInt activeGender = 0.obs;

  fetchProducts() async {
    products.value = await _productService.getAll();
  }

  Future<List<Category>> fetchCategories(Gender gender) async {
    return await _productService.getCategoriesByGender(gender);
  }

  Future<List<Product>> fetchProductsByGender(Gender gender) async {
    return await _productService.getProductsByGender(gender);
  }

  Future<void> fetchProductsByCategoryAndGender(
    String category,
  ) async {
    products.value = await _productService.getProductsByCategoryAndGender(
      genders[activeGender.value],
      category,
    );
  }

  addToCart(productId, quantity, color, size) {
    int userId = _sessionController.user.value!.id;
    _cartController.addToCart(
      userId,
      productId,
      quantity,
      color,
      size,
    );
    resetSelection();
  }

  changeActiveGender(int genderIndex) {
    activeGender.value = genderIndex;
  }

  resetSelection() {
    selectedSize.value = '';
    selectedColor.value = '';
  }
}
